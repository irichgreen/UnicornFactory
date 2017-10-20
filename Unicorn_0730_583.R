#install.packages('corrplot')
library(corrplot)
df583 <- read.csv(file="data/PQ0583_FR.txt", sep = '\t', header = TRUE)
df583_tmp <- df583
nrow(df583); ncol(df583);
df583 <- df583[, c(1,11:14,25,29,33:34,40,72:74,77:78,85,87,175,181:182,80)]
nrow(df583); ncol(df583);
df583R <- head(df583, n = 2)

colnames(df583R) <- c("C1","C2","C3","C4","C5","C6","C7","C8","C9","C10",
                      "C11","C12","C13","C14","C15","C16","C17","C18","C19","C20","C21")

summary(df583_1)

df583_1 <- df583[, c(1,21)] ; plot(df583_1);
df583_1 <- df583[, c(2,21)] ; plot(df583_1, main="PQ0583_2");
df583_1 <- df583[, c(3,21)] ; plot(df583_1, main="PQ0583_3");
df583_1 <- df583[, c(4,21)] ; plot(df583_1, main="PQ0583_4");
df583_1 <- df583[, c(5,21)] ; plot(df583_1, main="PQ0583_5");
df583_1 <- df583[, c(6,21)] ; plot(df583_1, main="PQ0583_6");
df583_1 <- df583[, c(7,21)] ; plot(df583_1, main="PQ0583_7");
df583_1 <- df583[, c(8,21)] ; plot(df583_1, main="PQ0583_8");
df583_1 <- df583[, c(9,21)] ; plot(df583_1, main="PQ0583_9");
df583_1 <- df583[, c(10,21)] ; plot(df583_1, main="PQ0583_10");
df583_1 <- df583[, c(11,21)] ; plot(df583_1, main="PQ0583_11");
df583_1 <- df583[, c(12,21)] ; plot(df583_1, main="PQ0583_12");
df583_1 <- df583[, c(13,21)] ; plot(df583_1, main="PQ0583_13");
df583_1 <- df583[, c(14,21)] ; plot(df583_1, main="PQ0583_14");
df583_1 <- df583[, c(15,21)] ; plot(df583_1, main="PQ0583_15");
df583_1 <- df583[, c(16,21)] ; plot(df583_1, main="PQ0583_16");
df583_1 <- df583[, c(17,21)] ; plot(df583_1, main="PQ0583_17");
df583_1 <- df583[, c(18,21)] ; plot(df583_1, main="PQ0583_18");
df583_1 <- df583[, c(19,21)] ; plot(df583_1, main="PQ0583_19");
df583_1 <- df583[, c(20,21)] ; plot(df583_1, main="PQ0583_20");


ggplot(data = df583, aes(x=df583$time, y=df583$OS.Force.Actual)) + geom_line(aes(colour=variable))



df583_1 <- read.csv(file="data/PQ0583_FR.txt", sep = '\t', header = TRUE)
df583_2 <- subset(df583_1, df583_1$Thickness.Deviation.Absolut >= 3 );
df583_3 <- subset(df583_1, df583_1$Thickness.Deviation.Absolut <= -3 );
df583_4 <-  rbind(df583_2, df583_3);

install.packages('ggplot2')


plot(0,0, xlim = c(min(df583$time),max(df583$time)) ,ylim = c(-10,10),type = "n")

cl <- rainbow(5)
cl[2]

plot(df583$time,df583$OS.Force.Actual, xlim = c(min(df583$time),max(df583$time)), col = cl[1] ,type = "b")

lines(df583$time, df583$Force.Diff..Actual, col = cl[2],type = 'b')
lines(df583$time, df583$Speed.Exit.Actual, col = cl[3],type = 'b')
lines(df583$time, df583$Mean.Tension, col = cl[4],type = 'b')

?plot


head(df583$time, n = 10)


df583$time <- strptime(substring(df583$time, 1, 23), "%d.%m.%Y %H:%M:%OS")
df583$time <- as.numeric(df583$time)

class(df583$time)

strptime(substring(df583$time, 1, 23), "%d.%m.%Y %H:%M:%OS")


p <- ggplot(data = df583, mapping = aes(x = df583$time, y = df583$OS.Force.Actual)) + 
    facet_grid(panel~., scale="free") + 
    geom_line(data = df583$Force.Sum.Actual, stat = "identity") 
p


plot(df583$time, df583$Force.Sum.Actual);
plot(df583$time, df583$Thickness.Deviation.Absolut);

plot(df583$time, df583$DS.U_Pressure.Actual);
plot(df583$time, df583$Thickness.Deviation.Absolut);

plot(df583$time, df583$Bending.Pressure.Measured.Negative);
plot(df583$time, df583$Thickness.Deviation.Absolut);



