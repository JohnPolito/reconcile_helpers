file_path=file.choose()
dane_sites_feat<-read.csv(file_path,header=TRUE, sep=";")
write.csv(dane_sites_feat,file=paste("rapidminer_ready",basename(file_path)),na="?")