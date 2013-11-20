require(rjson)
library(plyr)

parseJson <- function(s) {
if(is.na(s)){
	s<-"{'#NA':0}"
}
  y <- fromJSON(gsub("'", '"', s))
  names(y) <- gsub("#", "", names(y))

  as.data.frame(y)
}
file_path=file.choose()
dane_sites_feat<-read.csv(file_path,header=TRUE, sep=";")
dane_sites_feat$parts_of_speech[dane_sites_feat$parts_of_speech=="None"]<- "{}"
dane_sites_feat$parts_of_speech[dane_sites_feat$parts_of_speech=="{}"]<- NA

temp<-rbind.fill(lapply(dane_sites_feat$parts_of_speech, parseJson))
temp$NA. <- NULL
#head(temp)


dane_sites_feat<-data.frame(dane_sites_feat,temp)

write.csv(dane_sites_feat,file=paste("no_json_",basename(file_path),sep=""))