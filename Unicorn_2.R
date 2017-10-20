par(mar=c(1,1,1,1))
par(mfrow=c(1,1))
par(mar = rep(2, 4))
par(mfrow=c(4,2))

#install.packages('corrplot')
library(corrplot)
df1 <- read.csv(file="data/PQ0330_FR.csv", sep = '\t', header = TRUE)
nrow(df1); ncol(df1);
df2 <- df1[, c(7,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
nrow(df2); ncol(df2);
df3 <- head(df2, n = 1000)

colnames(df3) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10",
                   "C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21")

df4 <- df3[, c(2:21)]
summary(df4)
summary(df2)
head(df2, n=10)
plot(df4)

df5 <- df4[, c(11:20)]
plot(df5)

df6 <- df4[, c(1:10,20)]
plot(df6)

df7 <- df1[, c(11,80)]
plot(df7)



df0 <- df1[, c(11,80)] ; plot(df0);
df0 <- df1[, c(12,80)] ; plot(df0);
df0 <- df1[, c(13,80)] ; plot(df0);
df0 <- df1[, c(14,80)] ; plot(df0);
df0 <- df1[, c(25,80)] ; plot(df0);
df0 <- df1[, c(29,80)] ; plot(df0);
df0 <- df1[, c(33,80)] ; plot(df0);
df0 <- df1[, c(34,80)] ; plot(df0);
df0 <- df1[, c(40,80)] ; plot(df0);
df0 <- df1[, c(72,80)] ; plot(df0);
df0 <- df1[, c(73,80)] ; plot(df0);
df0 <- df1[, c(74,80)] ; plot(df0);
df0 <- df1[, c(77,80)] ; plot(df0);
df0 <- df1[, c(78,80)] ; plot(df0);
df0 <- df1[, c(85,80)] ; plot(df0);
df0 <- df1[, c(87,80)] ; plot(df0);
df0 <- df1[, c(175,80)] ; plot(df0);
df0 <- df1[, c(181,80)] ; plot(df0);
df0 <- df1[, c(182,80)] ; plot(df0);

