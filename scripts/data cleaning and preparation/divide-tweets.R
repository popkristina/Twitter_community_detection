library(plyr)
library(xlsx)

setwd("D:/Proekti/ElectionPrediction/Harvard_Dataset")

#Load the sheets
election_day<-read.xlsx("Cleaned/election-day-cleaned.xlsx",1)
election_filter1<-read.xlsx("Cleaned/election-filter1-cleaned.xlsx",1)
election_filter2<-read.xlsx("Cleaned/election-filter2-cleaned.xlsx",1)
election_filter3<-read.xlsx("Cleaned/election-filter3-cleaned.xlsx",1)
election_filter4<-read.xlsx("Cleaned/election-filter4-cleaned.xlsx",1)
election_filter5<-read.xlsx("Cleaned/election-filter5-cleaned.xlsx",1)
election_filter6<-read.xlsx("Cleaned/election-filter6-cleaned.xlsx",1)
first_debate<-read.xlsx("cleaned/first-debate-cleaned.xlsx",1)
second_debate<-read.xlsx("Cleaned/second-debate-cleaned.xlsx",1)
third_debate<-read.xlsx("Cleaned/third-debate-cleaned.xlsx",1)
vp_debate<-read.xlsx("Cleaned/vp-debate-cleaned.xlsx",1)


all_tweets<-rbind(election_day,election_filter1,election_filter2,election_filter3,
                  election_filter4,election_filter5,election_filter6,first_debate,
                  second_debate,third_debate,vp_debate)

TrumpTweets<-data.frame()
HillaryTweets<-data.frame()
TrumpAndHillaryTweets<-data.frame()
neitherDirectlyMentioned<-data.frame()

j=1
k=1
m=1
n=1

for(i in 1:nrow(all_tweets)){
  if(grepl("trump",tolower(all_tweets[i,2])) && grepl("clinton",tolower(all_tweets[i,2])) ||
     grepl("trump",tolower(all_tweets[i,2])) && grepl("hillary",tolower(all_tweets[i,2])) ||
     grepl("donald",tolower(all_tweets[i,2])) && grepl("clinton",tolower(all_tweets[i,2])) ||
     grepl("trump",tolower(all_tweets[i,2])) && grepl("hillary",tolower(all_tweets[i,2]))){
    TrumpAndHillaryTweets[j,1]<-all_tweets[i,1]
    TrumpAndHillaryTweets[j,2]<-all_tweets[i,2]
    j<-j+1
  }
  else if(grepl("trump",tolower(all_tweets[i,2])) || 
          grepl("donald",tolower(all_tweets[i,2]))){
    TrumpTweets[k,1]<-all_tweets[i,1]
    TrumpTweets[k,2]<-all_tweets[i,2]
    k<-k+1
  }
  else if(grepl("clinton",tolower(all_tweets[i,2])) || 
          grepl("hillary",tolower(all_tweets[i,2]))){
    HillaryTweets[m,1]<-all_tweets[i,1]
    HillaryTweets[m,2]<-all_tweets[i,2]
    m<-m+1
  }
  else{
    neitherDirectlyMentioned[n,1]<-all_tweets[i,1]
    neitherDirectlyMentioned[n,2]<-all_tweets[i,2]
    n<-n+1
  }
}

names<-c("Location","Text")

write.xlsx(TrumpAndHillaryTweets,"Cleaned2-Grouped/trump-and-hillary.xlsx",row.names = FALSE)
write.xlsx(TrumpTweets,"Cleaned2-Grouped/trump.xlsx",row.names = FALSE)
write.xlsx(HillaryTweets,"Cleaned2-Grouped/hillary.xlsx",row.names = FALSE)
write.xlsx(neitherDirectlyMentioned,"Cleaned2-Grouped/neither-mentioned.xlsx",row.names = FALSE)

