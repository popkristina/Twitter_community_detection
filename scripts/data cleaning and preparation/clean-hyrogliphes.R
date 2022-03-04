library(plyr)
library(xlsx)

setwd("D:/Proekti/ElectionPrediction/Harvard_Dataset")

trumptrain<-read.xlsx("Cleaned2-Grouped/trump_train_set.xlsx",1)
hillarytrain<-read.xlsx("Cleaned2-Grouped/hillary_train_set.xlsx",1)
trumptest<-read.xlsx("Cleaned2-Grouped/trump_test_set.xlsx",1)
hillarytest<-read.xlsx("Cleaned2-Grouped/hillary_test_set.xlsx",1)

for(i in 1:nrow(trumptrain)){
  gsub("Ã","",trumptrain[i,2])
  gsub("Â","",trumptrain[i,2])
  gsub("¢","",trumptrain[i,2])
  gsub("¬","",trumptrain[i,2])
  gsub("¬","",trumptrain[i,2])
  gsub("ÃƒÂ¢Ã¢â€šÂ¬Ã¢â","",trumptrain[i,2])
  gsub("ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â‚¬Å¡Ã‚Â¬Ãƒâ€šÃ‚Â¦","",trumptrain[i,2])
  gsub("RT","",trumptrain[i,2])
}

for(i in 1:nrow(trumptest)){
  gsub("Ã","",trumptest[i,2])
  gsub("Â","",trumptest[i,2])
  gsub("¢","",trumptest[i,2])
  gsub("¬","",trumptest[i,2])
  gsub("¬","",trumptest[i,2])
  gsub("ÃƒÂ¢Ã¢â€šÂ¬Ã¢â","",trumptest[i,2])
  gsub("RT","",trumptest[i,2])
}

for(i in 1:nrow(hillarytest)){
  gsub("Ã","",hillarytest[i,2])
  gsub("Â","",hillarytest[i,2])
  gsub("¢","",hillarytest[i,2])
  gsub("¬","",hillarytest[i,2])
  gsub("¬","",hillarytest[i,2])
  gsub("ÃƒÂ¢Ã¢â€šÂ¬Ã¢â","",hillarytest[i,2])
  gsub("RT","",hillarytest[i,2])
}

for(i in 1:nrow(hillarytrain)){
  gsub("Ã","",hillarytrain[i,2])
  gsub("Â","",hillarytrain[i,2])
  gsub("¢","",hillarytrain[i,2])
  gsub("¬","",hillarytrain[i,2])
  gsub("¬","",hillarytrain[i,2])
  gsub("ÃƒÂ¢Ã¢â€šÂ¬Ã¢â","",hillarytrain[i,2])
  gsub("RT","",hillarytrain[i,2])
}

write.xlsx(trumptrain,"Cleaned2-Grouped/trump_train_set.xlsx",row.names = FALSE)
write.xlsx(trumptest,"Cleaned2-Grouped/trump_test_set.xlsx",row.names = FALSE)
write.xlsx(hillarytrain,"Cleaned2-Grouped/hillary_train_set.xlsx",row.names = FALSE)
write.xlsx(hillarytest,"Cleaned2-Grouped/hillary_test_set.xlsx",row.names = FALSE)