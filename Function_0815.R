
roll_job <- function(roll_name){
    f_path <- getRollFilePath(roll_name)
    
    for (i in 1:length(f_path)){
        # print(paste0(i,":",f_path[i]));
        tmp1 <- read.csv(text=readLines(paste0(f_path[i], ".txt"))[-(3:11)], sep = '\t', header = TRUE, skip = 1);
        tmp1$fileindex <- i
        convertdata(tmp1)
        tmp2 <- subdf(tmp1, tmp1$Thickness.Exit.Absolut, multi)
        
        print(paste0(i,":",f_path[i],":",nrow(tmp1),":",nrow(tmp2)));
        
        write.table(tmp1, file = paste0(f_path[i], "_org.txt"), row.names = FALSE, sep = ";", dec = ".");
        write.table(tmp2, file = paste0(f_path[i], "_out.txt"), row.names = FALSE, sep = ";", dec = ".");
    }
    
    after_job(roll_name)
    
}


after_job <- function(roll_name){
    f_path <- getRollFilePath(roll_name)
    
    for (i in 1:length(f_path)){
        tmp1 <- read.csv(file = paste0(f_path[i], "_org.txt"), sep = ';', header = TRUE,, row.names = NULL);
        tmp2 <- read.csv(file = paste0(f_path[i], "_out.txt"), sep = ';', header = TRUE,, row.names = NULL);
        
        if(i==1){
            df1 <- tmp1
            df2 <- tmp2
        }else{
            df1 <- rbind(df1, tmp1)
            df2 <- rbind(df2, tmp2)
        }
        if(i==length(f_path)){
            df1$ts <- strptime(substring(df1$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
            df2$ts <- strptime(substring(df2$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
            
            df1 <- df1[with(df1, order(ts)), ]
            df1$rno <- seq.int(nrow(df1));
            
            df2 <- df2[with(df2, order(ts)), ]
            df2$rno <- seq.int(nrow(df2));
            
            write.table(df1, file = paste0(substring(f_path[i],1,4), roll_name, "_org.txt"), row.names = FALSE, sep = ";", dec = ".");
            write.table(df2, file = paste0(substring(f_path[i],1,4), roll_name, "_out.txt"), row.names = FALSE, sep = ";", dec = ".");
            
            out_jpeg(df1, roll_name, paste0(substring(f_path[i],1,4), roll_name, "_org.jpg"))
            out_jpeg(df2, roll_name, paste0(substring(f_path[i],1,4), roll_name, "_out.jpg"))
            
        }
    }
}


out_jpeg <- function(df, roll_name, file_path){
    jpeg(file = file_path, width = 1920, height = 1090, units = "px", pointsize = 12, quality = 100 )
    plot.new()
    par(mfrow=c(2,1))
    plot(df$ts, df$Thickness.Exit.Absolut, type="l", pch=1, col=4, main=roll_name)
    agg<-aggregate(df$ts, by = list(df$fileindex), max)
    for(i in 1:nrow(agg)){
        abline(v = agg$x[i], col=2, lwd = 2)
    }
    plot(df$rno, df$Thickness.Exit.Absolut, type="l", pch=1, col=4, main=roll_name)
    agg<-aggregate(df$rno, by = list(df$fileindex), max)
    for(i in 1:length(agg)){
        abline(v = agg[i]$x, , col=2, lwd = 2)
    }
    dev.off()
    
}

mkClsterData <- function(tmp, skip, gr_size){
    
    tmp$ts <- strptime(substring(tmp$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
    tmp <- tmp[with(tmp, order(ts)), ]
    tmp <- tmp[c(skip+1:(nrow(tmp)-skip*2)), ]
    
    thickness <- max(abs(tmp$Thickness.Deviation.Absolut))
    tmp$X <- "normal"
    tmp$X[which( abs(tmp$Thickness.Deviation.Absolut) >  (thickness * 1 / 4))] <- "NOTI"
    tmp$X[which( abs(tmp$Thickness.Deviation.Absolut) >  (thickness * 2 / 4))] <- "WARN"
    tmp$X[which( abs(tmp$Thickness.Deviation.Absolut) >  (thickness * 3 / 4))] <- "ERROR"
    
    # tmp$ts <- strptime(substring(tmp$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
    tmp$rno <- seq.int(nrow(tmp));
    tmp$gr <- as.integer(tmp$rno / gr_size)
    aggr  <- aggregate(tmp$VC.Ctrl.Out, by = list(tmp$gr), sd)
    aggrv <- aggregate(tmp$VC.Ctrl.Out, by = list(tmp$gr), var)
    aggra <- aggregate(tmp$VC.Ctrl.Out, by = list(tmp$gr), mean)
    tmp$VC.sd <- aggr[tmp$gr+1, 2]
    tmp$VC.var <- aggrv[tmp$gr+1, 2]
    tmp$VC.avg <- aggra[tmp$gr+1, 2]
    
    return(tmp)
}

mkCorData <- function(tmp){
    return( subset(tmp, select=c(DS.Force.Actual
                                 ,Force.Sum.Actual
                                 ,DS.Pressure.Actual
                                 ,OS.Pressure.Actual
                                 ,Bending.Pressure.Measured.Positive
                                 ,Bending.Pressure.Measured.Negative
                                 ,Bending.Actual
                                 ,Speed.Entry.Actual
                                 ,Speed.Mill.Actual
                                 ,Speed.Exit.Actual
                                 ,Tension.Entry.Actual
                                 ,Tension.Exit.Actual
                                 ,Thickness.Exit.Absolut
                                 ,VC.Ctrl.Out
                                 ,VC.Act
                                 ,VC.Pressure.Act
                                 ,Flow.Act
                                 ,Oil.Temp
                                 ,Oil.Pressure
                                 ,VC.sd
                                 ,Thickness.Deviation.Absolut
    )))
    
}

mkScatterData <- function(tmp){
    return( subset(tmp, select=c(Tension.Entry.Actual
                                 ,VC.Ctrl.Out
                                 ,VC.Act
                                 ,Oil.Temp
                                 ,VC.sd
                                 ,Thickness.Deviation.Absolut
    )))
    
}

