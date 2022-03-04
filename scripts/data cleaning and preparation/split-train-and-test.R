library(plyr)
library(xlsx)

setwd("D:/Proekti/ElectionPrediction/Harvard_Dataset")

#Load the sheets
trump<-read.xlsx("Cleaned2-Grouped/trump.xlsx",1)
hillary<-read.xlsx("Cleaned2-Grouped/hillary.xlsx",1)

set.seed(101) # Set Seed so that same sample can be reproduced in future also
# Now Selecting 75% of data as sample from total 'n' rows of the data  
sample <- sample.int(n = nrow(trump), size = floor(.75*nrow(trump)), replace = F)
print(sample)
trump_train <-trump[sample, ]
trump_test<-trump[-sample, ]


set.seed(101) # Set Seed so that same sample can be reproduced in future also
# Now Selecting 75% of data as sample from total 'n' rows of the data  
sample <- sample.int(n = nrow(hillary), size = floor(.75*nrow(hillary)), replace = F)
print(sample)
hillary_train <-hillary[sample, ]
hillary_test<-hillary[-sample, ]

write.xlsx(trump_train,"Cleaned2-Grouped/trump_train_set.xlsx",row.names = FALSE)
write.xlsx(trump_test,"Cleaned2-Grouped/trump_test_set.xlsx",row.names = FALSE)
write.xlsx(hillary_train,"Cleaned2-Grouped/hillary_train_set.xlsx",row.names = FALSE)
write.xlsx(hillary_test,"Cleaned2-Grouped/hillary_test_set.xlsx",row.names = FALSE)