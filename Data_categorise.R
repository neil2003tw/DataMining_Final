library(caret)
CN1<-read.table('CN1.txt')
CN1$co_author<-apply(CN1,1,function(x) if(x[1]<x[2]){paste(x[1],x[2])}else{paste(x[2],x[1])})
CN1$co_author<-factor(CN1$co_author)
CN1_2012<-CN1[as.numeric(factor(CN1$V3))==5,]
CN1_else<-CN1[as.numeric(factor(CN1$V3))!=5,]
model<-by(CN1_else,CN1_else$V3,function(x) table(x$co_author)/2)
model_ed<-data.frame(model$'2008',model$'2009',model$'2010',model$'2011')
model_ed<-model_ed[,c(1,2,4,6,8)]
colnames(model_ed)<-c('Co_authorship','2008','2009','2010','2011')
write.table(model_ed,'CN1_categorize.txt',quote = F,row.names=F,sep='\t')


#CN2<-read.table('CN2.txt')
#createDataPartition