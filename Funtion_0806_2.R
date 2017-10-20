#Funtion================================================================================

viewPlot <- function(df, d_name){
    plot.new()
    plot(df$ts, df$Thickness.Exit.Absolut, type="l", pch=1, col=3, xlab=d_name,ylab=""
         #          , ylim=c(min(df$Thickness.Exit.Absolut),max(df$Thickness.Exit.Absolut))
         , ylim=c(df$Thickness.Exit.Absolut[nrow(df)/2] - 10, df$Thickness.Exit.Absolut[nrow(df)/2] + 10 )
         , main=d_name)
}

comparePlot2 <- function(df, d_name, minmax, midv){
    jpeg(file = paste0(d_path,"output/",d_name,"_AB.jpg")
         , width = 1920, height = 1090, units = "px", pointsize = 12, quality = 100)
    plot.new()
    plot(df$ts, df$Thickness.Exit.Absolut, type="l", pch=1, col=3, xlab=d_name,ylab=""
    #          , ylim=c(min(df$Thickness.Exit.Absolut),max(df$Thickness.Exit.Absolut))
              , ylim=c(midv - minmax, midv + minmax )
         , main=d_name)
    dev.off()
}

executeUnit <- function(name){
    d_name <- name; 
    suffix_str <- ".txt"; 
    file_name = paste0(d_path, d_name, suffix_str);
    data_f <- read.csv(file=file_name, sep = '\t', header = TRUE)
    data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
    viewPlot(data_f, d_name); 
}

#=======================================================================================

c_names <- c("PQ0330-1","PQ0330-2","PQ0330-3","PQ0330-4","PQ0330-5"
            ,"PQ0580-1","PQ0580-2","PQ0580-3","PQ0580-4","PQ0580-5"
            ,"PQ0582-1","PQ0582-2","PQ0582-3"
            ,"PQ0583-1","PQ0583-2","PQ0583-3"
            ,"PQ0781-1","PQ0781-2","PQ0781-3","PQ0781-4","PQ0781-5");

c_names <- c( "PQ0582_P4","PQ0582_P5"
             ,"PQ0583_P4","PQ0583_P5"
             );


d_path <- "data0806/";
d_path <- "data/";

#Execute================================================================================


for (i in 1:length(c_names)){
    d_name <- c_names[i]; 
    suffix_str <- ".txt"; 
    file_name = paste0(d_path, d_name, suffix_str);
    data_f <- read.csv(file=file_name, sep = '\t', header = TRUE)
    data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
    
#    data_f <- head(tail(data_f
#                        , n=nrow(data_f)-(nrow(data_f)*0.1))
#                        , n=nrow(data_f)-(nrow(data_f)*0.3))
    comparePlot2(data_f, d_name, 2); 
}

#executeUnit(c_names[1]);

data_f <- NULL; ddf <- NULL; d_name <- "PQ0330-2";
#data_f <- rbind(data_f, read.csv(file="data0806/PQ0330-1.txt", sep = '\t', header = TRUE))
#data_f <- rbind(data_f, read.csv(file="data0806/PQ0330-2.txt", sep = '\t', header = TRUE))
ddf <- read.csv(file="data0806/PQ0330-3.txt", sep = '\t', header = TRUE);
data_f <- subset(ddf, select = c(time, Thickness.Exit.Delta, Thickness.Exit.Absolut, Thickness.Deviation.Absolut))
ddf <- read.csv(file="data0806/PQ0330-4.txt", sep = '\t', header = TRUE);
ddf <- subset(ddf, select = c(time, Thickness.Exit.Delta, Thickness.Exit.Absolut, Thickness.Deviation.Absolut))
data_f <- rbind(data_f, ddf)
ddf <- read.csv(file="data0806/PQ0330-5.txt", sep = '\t', header = TRUE);
ddf <- subset(ddf, select = c(time, Thickness.Exit.Delta, Thickness.Exit.Absolut, Thickness.Deviation.Absolut))
data_f <- rbind(data_f, ddf)
data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
#comparePlot2(data_f, d_name, 100, data_f$Thickness.Exit.Absolut[120000]); 
#data_f$ts<-seq.int(nrow(data_f))
comparePlot2(data_f, d_name, 20, data_f$Thickness.Exit.Absolut[nrow(data_f)/2]); 


colnames(data_f)
ddf2 <- read.csv(file="data/PQ0330_P4.txt", sep = '\t', header = TRUE)
colnames(ddf2)
c_index <- c(3,6,8,9,11,12,13,14,15,16,18,19,20);
ddf2 <- ddf2[, c(1,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]

