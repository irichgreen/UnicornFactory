#VAR==========================================================

file_name = "330/PQ0330_previous pass(full)_out.txt";
file_name = "330/PQ0330(FULL)_out.txt";
file_name = "580/PQ0580_previous pass(full)_out.txt";
file_name = "580/PQ0580(FULL)_out.txt";
file_name = "582/582-0001_out.txt";
file_name = "582/582-0002_out.txt";
file_name = "582/582-0003_out.txt";
file_name = "582/582-0004_out.txt";
file_name = "582/582-0005_out.txt";
file_name = "582/582-0006_out.txt";
file_name = "582/582-0007_out.txt";
file_name = "582/582-0008_out.txt";
file_name = "583/583-0001_out.txt";
file_name = "583/583-0002_out.txt";
file_name = "583/583-0003_out.txt";
file_name = "583/583-0005_out.txt";

#Road==========================================================

tmp1 <- read.csv(file=file_name, sep = ';', header = TRUE);
tmp <- mkClsterData(tmp1, as.integer(nrow(tmp1)*0.1), 500)


#EXECUTE==========================================================
#Plot==========================================================
plot(tmp$ts, tmp$VC.sd, type="p", col=4, 
     ylim = c(0, max(tmp$VC.sd)*1.1), main= file_name)
abline(h = 0.5, col=2, lwd = 2) 

plot(tmp$ts, tmp$VC.Ctrl.Out, type="p", col=4, main= file_name )
plot(tmp$ts, tmp$Thickness.Exit.Absolut , type="p", col=4, main= file_name)
plot(tmp$ts, tmp$Thickness.Deviation.Absolut , type="p", col=4, main= file_name )

ggplot(tmp, aes(
    tmp$VC.sd
    , tmp$Thickness.Exit.Absolut
    , color = tmp$X)
) + geom_point() + ggtitle(file_name)

#corrplot==========================================================

tmp2 <- mkCorData(tmp)  # tmp2 <- subset(tmp2, select=-c(Oil.Temp)) # colnames(tmp2)
mcor <- cor(tmp2, y = NULL)      #mcor <- round(mcor, 8)  
corrplot(mcor, method='shade', shade.col=NA, tl.col='black', tl.srt=45, title = file_name)

#Scatter================================================================================
#idx <- sample(1:nrow(tmp2), as.integer(nrow(tmp2)/100), replace = FALSE)
#tmp3 <- tmp2[idx, ]
idx <- c(1:as.integer(nrow(tmp2)/100))
tmp3 <- tmp2[idx * 100, ]
tmp3 <- mkScatterData(tmp3)
plot(tmp3, main = file_name)

#EXECUTE================================================================================
file_job <- function(file_name){
    tmp <- read.csv(file=file_name, sep = ';', header = TRUE);
    tmp <- mkClsterData(tmp, as.integer(nrow(tmp1)*0.1), 500)
    jpeg(file = paste0(file_name,"_plot.jpg"), width = 1280, height = 1024, units = "px", pointsize = 12, quality = 100)
    plot.new()
    par(mfrow=c(1,1))
    plot(tmp$ts, tmp$VC.sd, type="p", col=4, ylim = c(0, max(tmp$VC.sd)*1.1), main= file_name)
    abline(h = 0.5, col=2, lwd = 2) 
    dev.off()
    
    p <- ggplot(tmp, aes(
        tmp$VC.sd
        , tmp$Thickness.Exit.Absolut
        , color = tmp$X)
    ) + geom_point() + ggtitle(file_name) 
    ggsave(filename=paste0(file_name,"_ggplot.jpg"), plot=p)
    
    jpeg(file = paste0(file_name,"_cor.jpg"), width = 1280, height = 1024, units = "px", pointsize = 12, quality = 100)
    plot.new()
    par(mfrow=c(1,1))
    
    tmp <- mkCorData(tmp)  # tmp2 <- subset(tmp2, select=-c(Oil.Temp)) # colnames(tmp2)
    mcor <- cor(tmp, y = NULL)      #mcor <- round(mcor, 8)  
    corrplot(mcor, method='shade', shade.col=NA, tl.col='black', tl.srt=45, title = file_name)
    dev.off()
    
    plot.new()
    jpeg(file = paste0(file_name,"_Scatter.jpg"), width = 1280, height = 1024, units = "px", pointsize = 12, quality = 100)
    idx <- c(1:as.integer(nrow(tmp)/100))
    tmp <- tmp[idx * 100, ]
    tmp <- mkScatterData(tmp)
    plot(tmp, main = file_name)
    
    dev.off()
}

#VAR==========================================================
roll_names <- c( "PQ0330F"
                 ,"PQ0580F"
                 ,"PQ0582"
                 ,"PQ0583"
) 

#BATCH================================================================================
for (i in 1:length(roll_names)){
    file_names <- getRollFilePath(roll_names[i])
    for(j in 1:length(file_names)){
        file_job(paste0(file_names[j],"_out.txt"))
    }
}

