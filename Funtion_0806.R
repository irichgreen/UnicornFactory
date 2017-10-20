#Funtion================================================================================

comparePlot <- function(df, y_v, d_name, p_name, c_no){
    jpeg(file = paste0("data0806/output/",d_name,"_",c_no,"-",p_name,".jpg")
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

#=======================================================================================

c_index <- c(2,3);

d_name <- "PQ0330-3"; suffix_str <- ".txt"; file_name = paste0("data0806/", d_name, suffix_str);
data_f <- read.csv(file=file_name, sep = '\t', header = TRUE)
#data_f <- data_f[, c(1,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
#data_f <- head(tail(data_f, n=40000), n=30000)
data_f$ts <- strptime(substring(data_f$time, 1, 23), "%d.%m.%Y %H:%M:%OS")

#Execute================================================================================

for (i in 1:2){
    comparePlot(data_f, data_f[,c_index[i]], d_name, names(data_f)[c_index[i]], c_index[i]); 
}



