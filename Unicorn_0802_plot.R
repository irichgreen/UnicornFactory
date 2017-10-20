df330$ts <- strptime(substring(df330$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
df582$ts <- strptime(substring(df582$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
df583$ts <- strptime(substring(df583$time, 1, 23), "%d.%m.%Y %H:%M:%OS")


plot(df330$ts, df330$Force.Sum.Actual, pch=1, col=3, xlab="Time",ylab="",ylim=c(min(df330$Force.Sum.Actual),max(df330$Force.Sum.Actual)),main="Force.Sum.Actual")
mtext("Force.Sum.Actual",side=2,line=2,col=3)
par(new=T)
plot(df330$Thickness.Deviation.Absolut, axes=F, xlab="",ylab="",ylim=c(-3.5,3.5), pch=2, col=4 )
axis(side=4)
mtext("Thickness",side=4,line=2,col=4)
abline(h = 3, col = "red")
abline(h = -3, col = "red")


    df330$Force.Sum.Actual
    df330$DS.U_Pressure.Actual
    df330$Bending.Pressure.Measured.Negative
    df330$Bending.U.Measured.Positive
    df330$Speed.Mill.Actual
    df330$Speed.Exit.Actual
    df330$dh_raw
    df330$Tension.Exit.Actual
    df330$Thickness.Exit.Delta
    df330$VC.Ctrl.Out
    df330$Flow.Error
    df330$Oil.Pressure
    df330$Mean.Tension
    