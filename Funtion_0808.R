#Funtion================================================================================

comparePlot <- function(df, y_v, d_name, p_name, c_no){
    jpeg(file = paste0(d_path,"output/",d_name,"_",c_no,"-",p_name,".jpg")
         , width = 800, height = 600, units = "px", pointsize = 12, quality = 75)
    plot.new()
    plot(df$ts, y_v, type="l", pch=1, col=3, xlab=d_name,ylab="",ylim=c(min(y_v),max(y_v)),main=p_name)
    mtext(p_name,side=2,line=2,col=3)
    par(new=T)
    plot(df$Thickness.Deviation.Absolut, axes=F, xlab="",ylab="",ylim=c(-3.5,3.5), type="l", pch=2, col=4 )
    axis(side=4)
    mtext("Thickness",side=4,line=2,col=4)
    abline(h = 3, col = "red")
    abline(h = -3, col = "red")
    dev.off()
}

comparePlot2 <- function(df, d_name, minmax, midv){
    jpeg(file = paste0(d_path,"output/",d_name,"_AB.jpg")
         , width = 1920, height = 1090, units = "px", pointsize = 12, quality = 100)
    plot.new()
    plot(df$ts, df$Thickness.Exit.Absolut, type="l", pch=1, col=3, xlab=d_name,ylab=""
         , ylim=c(midv - minmax, midv + minmax )
         , main=d_name)
    dev.off()
}

comparePlot3 <- function(df, d_name){
    jpeg(file = paste0(d_path,"output/",d_name,"_TOTAL.jpg")
         , width = 3840, height = 1090, units = "px", pointsize = 12, quality = 100)
    plot.new()
    plot(df$ts, df$Thickness.Exit.Absolut, type="l", pch=1, col=3, xlab=d_name,ylab=""
              , ylim=c(min(df$Thickness.Exit.Absolut, na.rm = TRUE),max(df$Thickness.Exit.Absolut, na.rm = TRUE))
         , main=d_name)
    dev.off()
}

#=======================================================================================

d_path <- "data0808/";
#d_path <- "data0806/";
#d_path <- "data/";

c_names <- c( "PQ0583_P1","PQ0583_P2"
              ,"PQ0583_P3","PQ0583_P5" );

#c_index <- c(2,3);
c_index <- c(3,6,8,9,11,12,13,14,15,16,18,19,20);

d_name <- "PQ0582_P1"; suffix_str <- ".txt"; file_name = paste0(d_path, d_name, suffix_str);
data_f <- read.csv(file=file_name, sep = '\t', header = TRUE)
data_f <- data_f[, c(1,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
#data_f <- head(tail(data_f, n=40000), n=30000)
data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")

#Execute================================================================================

for (i in 1:13){
#    data_f[, c_index[i]] <- as.numeric(data_f[, c_index[i]] )
    comparePlot(data_f, data_f[,c_index[i]], d_name, names(data_f)[c_index[i]], c_index[i]); 
}

for (i in 1:length(c_names)){
    d_name <- c_names[i]; 
    suffix_str <- ".txt"; 
    file_name = paste0(d_path, d_name, suffix_str);
    data_f <- read.csv(file=file_name, sep = '\t', header = TRUE)
    data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
    comparePlot2(data_f, d_name, 2, data_f$Thickness.Exit.Absolut[nrow(data_f)/2]); 
}

f_path <- c(  "data0808/PQ0582_P1.txt","data0808/PQ0582_P2.txt",
              "data0808/PQ0582_P3.txt","data0808/PQ0582_P4.txt"
             ,"data0808/PQ0582_P5.txt","data0808/PQ0582_P6.txt"
             ,"data0808/PQ0582_P7.txt","data0808/PQ0582_P8.txt" );

for (i in 1:length(f_path)){
    
    d_name <- substring(f_path[i],10,18);
    data_f <- read.csv(file=f_path[i], sep = '\t', header = TRUE)
    data_f <- data_f[, c(1,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
    data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")

    for (j in 1:13){
        data_f[, c_index[j]] <- as.numeric(data_f[, c_index[j]] )
        comparePlot(data_f, data_f[,c_index[j]], d_name, names(data_f)[c_index[j]], c_index[j]); 
    }
}

for (i in 1:length(f_path)){
    d_name <- substring(f_path[i],10,18);
    data_f <- read.csv(file=f_path[i], sep = '\t', header = TRUE)
    data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
    data_f$Thickness.Exit.Absolut <- as.numeric(data_f$Thickness.Exit.Absolut)
    comparePlot2(data_f, d_name, 2, data_f$Thickness.Exit.Absolut[nrow(data_f)/2]); 
}

for (i in 1:length(f_path)){
    if(i==1){
        data_f <- NULL; tmp <- NULL; 
        tmp <- read.csv(file=f_path[i], sep = '\t', header = TRUE);
        data_f <- subset(tmp, select = c(time, Thickness.Exit.Delta, Thickness.Exit.Absolut, Thickness.Deviation.Absolut));
        data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS");
    }
    else{
        tmp <- NULL; 
        tmp <- read.csv(file=f_path[i], sep = '\t', header = TRUE);
        tmp <- subset(tmp, select = c(time, Thickness.Exit.Delta, Thickness.Exit.Absolut, Thickness.Deviation.Absolut));
        tmp$ts <- strptime(substring(tmp$time, 1, 23), "%d.%m.%Y %H:%M:%OS");
        data_f <- rbind(data_f, tmp);
    }
}
#data_f$Thickness.Exit.Absolut <- as.numeric(data_f$Thickness.Exit.Absolut)
#data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS");
comparePlot3(data_f, paste0(substring(f_path[1],10,15),"T"));
data_f$ts<-seq.int(nrow(data_f));
comparePlot3(data_f, substring(f_path[1],10,15));


#for (i in 1:length(f_path)){
#    print(paste("========",i))
#    tmp <- read.csv(file=f_path[i], sep = '\t', header = TRUE);
#    print(paste(class(tmp$time), ":", class(tmp$Thickness.Exit.Absolut)))
#}
