#install.packages('corrplot')
library(corrplot)
df4 <- read.csv("data/PQ0330_FR.csv", sep = '\t', header = TRUE)
#pqd2= read.csv(file="C:/Tools/DATA/PQ0330_FR.csv", sep = '\t', header = TRUE)
class(df4)
summary(df4)
head(df4, n = 1)

#pqd2 <- pqd2[complete.cases(pqd2),]
#pqd22 <- sapply(pqd2, as.numeric)
df4m <- as.matrix(sapply(df4, as.numeric))
cors <- cor(df4m)
corrplot(cors, method='shade', shade.col = NA, tl.col = 'black', tl.srt = 45)

nrow(df4)
ncol(df4)

df5 <- df4[, c(7:21)]
df5m <- as.matrix(sapply(df5, as.numeric))
cors <- cor(df5m)
corrplot(cors, method='shade', shade.col = NA, tl.col = 'black', tl.srt = 45)


#pqd3 <- pqd2[, c(7:21, 30:40, 50:60)]
pqd3 <- pqd2[, c(7:21)]
#pqd3 <- pqd2[, c(7:21,32:35)]
#pqd32 <- sapply(pqd3, as.numeric)
pqd32 <- as.matrix(sapply(pqd3, as.numeric))
cors3 <- cor(pqd32)
corrplot(cors3, method='shade', shade.col = NA, tl.col = 'black', tl.srt = 45)

install.packages('party')
library(party)

iris_ctree <- ctree(pqd3$DS.Reference.Force ~ ., data = pqd3)
print(iris_ctree)
