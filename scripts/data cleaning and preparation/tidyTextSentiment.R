library(plyr)
library(xlsx)
library(RSentiment)
library(SentimentAnalysis)
library(tidytext)

#Extract all three lexicons

#NRC LEXICON
#Categorizes words in positive, negative, anger, anticipation, disgust, fear, joy, sadness, surprise, and trust
nrc<-get_sentiments("nrc")
nrc_positive<-list()
nrc_negative<-()
for(i in 1:nrow(nrc)){
  if(nrc[i,2]=="trust" || nrc[i,2]=="positive" || nrc[i,2]=="joy" || nrc[i,2]=="anticipation"){
    nrc_positive<-c(nrc_positive,nrc[i,1])
  }
  else if(nrc[i,2]=="fear" || nrc[i,2]=="negative" || nrc[i,2]=="sadness" || nrc[i,2]=="disgust"){
    nrc_negative<-c(nrc_negative,nrc[i,1])
  }
}


#AFINN LEXICON
#Assigns words with a score that runs between -5 and 5, with negative scores indicating negative sentiment and positive scores indicating positive sentiment
afinn<-get_sentiments("afinn")
afinn_positive<-list()
afinn_negative<-list()
afinn_neutral<-list()
for(i in 1:nrow(afinn)){
  if(afinn[i,2]<0){
    afinn_negative<-c(afinn_negative,afinn[i,1])
  }
  else if(afinn[i,2]>0){
    afinn_positive<-c(afinn_positive,afinn[i,1])
  }
  else{
    afinn_neutral<-c(afinn_neutral,afinn[i,1])
  }
}

#BING LEXICON
#Categorizes words in a binary fashion into positive and negative categories
bing<-get_sentiments("bing")
#Create two lists that will contain the positive and the negative words separately
bing_positivewords<-list()
bing_negativewords<-list()
for(i in 1:nrow(bing)){
  if(bing[i,2]=="positive"){
    bing_positivewords<-c(bing_positivewords,bing[i,1])
  }
  if(bing[i,2]=="negative"){
    bing_negativewords<-c(bing_negativewords,bing[i,1])
  }
}