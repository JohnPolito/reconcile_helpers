require(rjson)
library(plyr)

calcNamedEntities <- function(s) {
if (is.na(s)){
  num_ne=NA
  sum_ne=NA
  }
else {
  y <- fromJSON(gsub("'", '"', s))		
  num_ne=0
  sum_ne=0
  num_ne=length(y)
  sum_ne=sum(unlist(y))
} 
data.frame(num_ne=num_ne,sum_ne=sum_ne)
}



dane_sites_feat$named_entities[dane_sites_feat$named_entities=="None"]<- "{}"
dane_sites_feat$named_entities[dane_sites_feat$named_entities=="{}"]<- NA


temp<-rbind.fill(lapply(dane_sites_feat$named_entities, calcNamedEntities))

dane_sites_feat<-data.frame(dane_sites_feat,temp)


write.csv(dane_sites_feat,file=paste("named_entites_sum_up_",basename(file_path)))