par(mar=c(1,1,1,1))
par(mfrow=c(1,1))
par(mar = rep(2, 4))
par(mfrow=c(4,2))

#install.packages('corrplot')
library(corrplot)
df582 <- read.csv(file="data/PQ0582_FR.txt", sep = '\t', header = TRUE)
nrow(df582); ncol(df582);
df582 <- df582[, c(7,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
nrow(df582); ncol(df582);
df582R <- head(df582, n = 1)

colnames(df582R) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10",
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

summary(df0)

df0 <- df582[, c(1,21)] ; plot(df0);
df0 <- df582[, c(2,21)] ; plot(df0);
df0 <- df582[, c(3,21)] ; plot(df0);
df0 <- df582[, c(4,21)] ; plot(df0);
df0 <- df582[, c(5,21)] ; plot(df0);
df0 <- df582[, c(6,21)] ; plot(df0);
df0 <- df582[, c(7,21)] ; plot(df0);
df0 <- df582[, c(8,21)] ; plot(df0);
df0 <- df582[, c(9,21)] ; plot(df0);
df0 <- df582[, c(10,21)] ; plot(df0);
df0 <- df582[, c(11,21)] ; plot(df0);
df0 <- df582[, c(12,21)] ; plot(df0);
df0 <- df582[, c(13,21)] ; plot(df0);
df0 <- df582[, c(14,21)] ; plot(df0);
df0 <- df582[, c(15,21)] ; plot(df0);
df0 <- df582[, c(16,21)] ; plot(df0);
df0 <- df582[, c(17,21)] ; plot(df0);
df0 <- df582[, c(18,21)] ; plot(df0);
df0 <- df582[, c(19,21)] ; plot(df0);
df0 <- df582[, c(20,21)] ; plot(df0);

