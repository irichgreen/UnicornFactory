#install.packages('corrplot')
library(corrplot)
df582 <- read.csv(file="data/PQ0582_FR.txt", sep = '\t', header = TRUE)
nrow(df582); ncol(df582);
df582 <- df582[, c(1,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
nrow(df582); ncol(df582);
df582R <- head(df582, n = 10)

colnames(df582R) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10",
                   "C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21")


summary(df582_1)

df582_1 <- df582[, c(1,21)] ; plot(df582_1);
df582_1 <- df582[, c(2,21)] ; plot(df582_1, main="PQ0582_2");
df582_1 <- df582[, c(3,21)] ; plot(df582_1, main="PQ0582_3");
df582_1 <- df582[, c(4,21)] ; plot(df582_1, main="PQ0582_4");
df582_1 <- df582[, c(5,21)] ; plot(df582_1, main="PQ0582_5");
df582_1 <- df582[, c(6,21)] ; plot(df582_1, main="PQ0582_6");
df582_1 <- df582[, c(7,21)] ; plot(df582_1, main="PQ0582_7");
df582_1 <- df582[, c(8,21)] ; plot(df582_1, main="PQ0582_8");
df582_1 <- df582[, c(9,21)] ; plot(df582_1, main="PQ0582_9");
df582_1 <- df582[, c(10,21)] ; plot(df582_1, main="PQ0582_10");
df582_1 <- df582[, c(11,21)] ; plot(df582_1, main="PQ0582_11");
df582_1 <- df582[, c(12,21)] ; plot(df582_1, main="PQ0582_12");
df582_1 <- df582[, c(13,21)] ; plot(df582_1, main="PQ0582_13");
df582_1 <- df582[, c(14,21)] ; plot(df582_1, main="PQ0582_14");
df582_1 <- df582[, c(15,21)] ; plot(df582_1, main="PQ0582_15");
df582_1 <- df582[, c(16,21)] ; plot(df582_1, main="PQ0582_16");
df582_1 <- df582[, c(17,21)] ; plot(df582_1, main="PQ0582_17");
df582_1 <- df582[, c(18,21)] ; plot(df582_1, main="PQ0582_18");
df582_1 <- df582[, c(19,21)] ; plot(df582_1, main="PQ0582_19");
df582_1 <- df582[, c(20,21)] ; plot(df582_1, main="PQ0582_20");

