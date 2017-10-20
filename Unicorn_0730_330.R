par(mar=c(1,1,1,1))
par(mfrow=c(2,1))
par(mar = rep(2, 4))
par(mfrow=c(4,2))

#install.packages('corrplot')
library(corrplot)
library(ggplot2)
library(gtable)
library(grid)

df330 <- read.csv(file="data/PQ0330_FR.txt", sep = '\t', header = TRUE)
nrow(df330); ncol(df330);
df330 <- df330[, c(1,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
nrow(df330); ncol(df330);
df330R <- head(df330, n = 1)

colnames(df330R) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10",
                      "C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21")


summary(df330_1)

df330_1 <- df330[, c(1,21)] ; plot(df330_1);
df330_1 <- df330[, c(2,21)] ; plot(df330_1, main="PQ0330_2");
df330_1 <- df330[, c(3,21)] ; plot(df330_1, main="PQ0330_3");
df330_1 <- df330[, c(4,21)] ; plot(df330_1, main="PQ0330_4");
df330_1 <- df330[, c(5,21)] ; plot(df330_1, main="PQ0330_5");
df330_1 <- df330[, c(6,21)] ; plot(df330_1, main="PQ0330_6");
df330_1 <- df330[, c(7,21)] ; plot(df330_1, main="PQ0330_7");
df330_1 <- df330[, c(8,21)] ; plot(df330_1, main="PQ0330_8");
df330_1 <- df330[, c(9,21)] ; plot(df330_1, main="PQ0330_9");
df330_1 <- df330[, c(10,21)] ; plot(df330_1, main="PQ0330_10");
df330_1 <- df330[, c(11,21)] ; plot(df330_1, main="PQ0330_11");
df330_1 <- df330[, c(12,21)] ; plot(df330_1, main="PQ0330_12");
df330_1 <- df330[, c(13,21)] ; plot(df330_1, main="PQ0330_13");
df330_1 <- df330[, c(14,21)] ; plot(df330_1, main="PQ0330_14");
df330_1 <- df330[, c(15,21)] ; plot(df330_1, main="PQ0330_15");
df330_1 <- df330[, c(16,21)] ; plot(df330_1, main="PQ0330_16");
df330_1 <- df330[, c(17,21)] ; plot(df330_1, main="PQ0330_17");
df330_1 <- df330[, c(18,21)] ; plot(df330_1, main="PQ0330_18");
df330_1 <- df330[, c(19,21)] ; plot(df330_1, main="PQ0330_19");
df330_1 <- df330[, c(20,21)] ; plot(df330_1, main="PQ0330_20");

#op <- options(digits.secs=3)
#options(op) #reset options

df330$ts <- strptime(substring(df330$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
df330$lt <- as.numeric(df330$ts)
df330$lt <- as.du

plot(df330$time, df330$Force.Sum.Actual)
plot(df330$time, df330$Thickness.Deviation.Absolut);

plot(df330$time, df330$DS.U_Pressure.Actual)
plot(df330$time, df330$Thickness.Deviation.Absolut);

plot(df330$time, df330$Bending.Pressure.Measured.Negative)
plot(df330$time, df330$Thickness.Deviation.Absolut);

head(substring(df330$time, 1, 23))
head(df330$time)
head(df330$ts)
head(df330$lt)
min(df330$ts)
max(df330$ts)




     