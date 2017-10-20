#install.packages('corrplot')
library(corrplot)
pqd= read.csv(file="data/PQ0330_RE1.csv", sep = '\t')
class(pqd)
summary(pqd)
head(pqd, n = 1)
pqd2 <- pqd[, c(7:22)]
head(pqd2, n = 2)

colnames(pqd2) <- c("DS_Reference_Force",
                    "OS_Reference_Force",
                    "DS_Force_Actual",
                    "OS_Force_Actual",
                    "Force_Sum_Actual",
                    "Bending_POS_Controller_Output",
                    "Bending_NEG_Controller_Output",
                    "Bending_Reference",
                    "Bending_Actual",
                    "Speed_Entry_Actual",
                    "Speed_Mill_Actual",
                    "Speed_Exit_Actual",
                    "Thickness_Control_On",
                    "Speed_Control_On",
                    "Tension_Control_On",
                    "SAO_Control_On")

plot(pqd2$DS_Reference_Force)
plot(pqd2$OS_Reference_Force)

pqd2 <- as.matrix(sapply(pqd2, as.numeric))
cors <- cor(pqd2)
#cors <- cor(as.matrix(pqd2))
plot(pqd2)
plot(cors)
corrplot(cors, method='shade', shade.col = NA, tl.col = 'black', tl.srt = 45)

summary(pqd2$DS_Reference_Force)

pqd3 <- pqd2[complete.cases(pqd2),]
summary(pqd3)
cors <- cor(pqd3)#Features of each process
y.features<-vector(mode="list",length=length(steps))
y.features[1]<-list(c(list(c("ok", "Cr"))))
y.features[2]<-list(c(list(c("weight", "Cr"))))
y.features[3]<-list(c(list(c("time", "Cr"))))
y.features[4]<-list(c(list(c("label", "Cr"))))
y.features
ss.pMap(steps, inputs.overall, outputs.overall,
        input.output, x.parameters, y.features,
        sub="Paper Helicopter Project")
corrplot(cors, method='shade', shade.col = NA, tl.col = 'black', tl.srt = 45)

