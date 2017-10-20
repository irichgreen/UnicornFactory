
df1 = NULL; df2 = NULL; multi <- 1.5;

roll_job <- function(roll_name){
    f_path <- getRollFilePath(roll_name)
    
    for (i in 1:length(f_path)){
        # print(paste0(i,":",f_path[i]));
        tmp1 <- read.csv(text=readLines(paste0(f_path[i], ".txt"))[-(3:11)], sep = '\t', header = TRUE, skip = 1);
        tmp1$fileindex <- i
        convertdata(tmp1)
        tmp2 <- subdf(tmp1, tmp1$Thickness.Exit.Absolut, multi)
        
        print(paste0(i,":",f_path[i],":",nrow(tmp1),":",nrow(tmp2)));
        
        if(i==1){
            df1 <- tmp1     # 원본 데이터
            df2 <- tmp2     # 앞뒤구간 삭제 데이터 
        }else{
            df1 <- rbind(df1, tmp1)   # 같은 롤에 해당하는 데이터 머지
            df2 <- rbind(df2, tmp2)   
        }
        if(i==length(f_path)){      # 마지막 파일에서 데이터 출력 
            df1$ts <- strptime(substring(df1$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
            df2$ts <- strptime(substring(df2$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
            
            df1 <- df1[with(df1, order(ts)), ]  # 정렬
            df1$rno <- seq.int(nrow(df1));
            
            df2 <- df2[with(df2, order(ts)), ]
            df2$rno <- seq.int(nrow(df2));
            
            #     plot.new()
            #     plot(df2$ts , df2$Thickness.Exit.Absolut, type="l", col=4 )
            #     plot(df2$rno, df2$Thickness.Exit.Absolut, type="l", col=4 )
            #     # dev.off()
            # CSV 파일로 출력    
            write.table(df1, file = paste0(substring(f_path[i],1,4), roll_name, "_org.txt"), row.names = FALSE, sep = ";", dec = ".");
            write.table(df2, file = paste0(substring(f_path[i],1,4), roll_name, "_out.txt"), row.names = FALSE, sep = ";", dec = ".");
            
            # 이미지 파일로 출력   
            jpeg(file = paste0(substring(f_path[i],1,4), roll_name,"_org.jpg"), width = 1920, height = 1090, units = "px", pointsize = 12, quality = 100)
            plot.new()
            par(mfrow=c(2,1))
            plot(df1$ts, df1$Thickness.Exit.Absolut, type="l", pch=1, col=4, main=roll_name)
            agg<-aggregate(df1$ts, by = list(df1$fileindex), max)
            for(j in 1:nrow(agg)){
                abline(v = agg$x[j], col=2, lwd = 2)
            }
            plot(df1$rno, df1$Thickness.Exit.Absolut, type="l", pch=1, col=4, main=roll_name)
            agg<-aggregate(df1$rno, by = list(df1$fileindex), max)
            for(j in 1:length(agg)){
                abline(v = agg[j]$x, , col=2, lwd = 2)
            }
            dev.off()
            
            
            jpeg(file = paste0(substring(f_path[i],1,4), roll_name,"_out.jpg"), width = 1920, height = 1090, units = "px", pointsize = 12, quality = 100)
            plot.new()
            par(mfrow=c(2,1))
            plot(df2$ts, df2$Thickness.Exit.Absolut, type="l", pch=1, col=4, main=roll_name)
            agg<-aggregate(df2$ts, by = list(df2$fileindex), max)
            for(j in 1:nrow(agg)){
                abline(v = agg$x[j], col=2, lwd = 2)
            }
            plot(df2$rno, df2$Thickness.Exit.Absolut, type="l", pch=1, col=4, main=roll_name)
            agg<-aggregate(df2$rno, by = list(df2$fileindex), max)
            for(j in 1:length(agg)){
                abline(v = agg[j]$x, , col=2, lwd = 2)
            }
            dev.off()
            
        }
    }
    
}

#VAR==========================================================
roll_names <- c( "PQ0330F"
                 ,"PQ0580F"
                 ,"PQ0582"
                 ,"PQ0583"
) 

#EXECUTE==========================================================
for (i in 1:length(roll_names)){
    roll_job(roll_names[i])
}

