#Library for manipulation with JSON files

library(jsonlite)
library(plyr)
library(xlsx)
library(csv)
library("data.table")

json1 <- lapply(readLines("election-filter-6.json"), fromJSON)

id<-list()####
for(i in 1:length(json1)){
  id[i]<-json1[[i]]$id
}
user_screen<-list()####
for(i in 1:length(json1)){
  user_screen[i]<-json1[[i]]$user$screen_name
}
original_author<-list()
for(i in 1:length(json1)){
  if(is.null(json1[[i]]$retweeted_status)==FALSE){
    tmp<-json1[[i]]$retweeted_status$user$screen_name
  }
  else{
    tmp<-"Null"
  }
  original_author[i]<-tmp
}
user_id<-list()###
for(i in 1:length(json1)){
  user_id[i]<-json1[[i]]$user$id
}
favorite_count<-list()###
for(i in 1:length(json1)){
  favorite_count[i]<-json1[[i]]$favorite_count
}
retweet_count<-list()####
for(i in 1:length(json1)){
  retweet_count[i]<-json1[[i]]$retweet_count
}
user_following<-list()###
for(i in 1:length(json1)){
  user_following[i]<-json1[[i]]$user$following
}
user_followers<-list()####
for(i in 1:length(json1)){
  user_followers[i]<-json1[[i]]$user$followers_count
}
user_friends<-list()####
for(i in 1:length(json1)){
  user_friends[i]<-json1[[i]]$user$friends_count
}
user_statuses<-list()####
for(i in 1:length(json1)){
  user_statuses[i]<-json1[[i]]$user$statuses_count
}
tweet_text<-list()####
for(i in 1:length(json1)){
  tweet_text[i]<-json1[[i]]$full_text
}

to_export<-cbind(id,user_screen,original_author,user_id,favorite_count,retweet_count,user_following,user_followers,user_friends,user_statuses,tweet_text)
#to_export<-rbind(cbind("Screen name","Name","Location","Text"),to_export)
to_export_df<-data.frame(to_export)

write.xlsx(to_export_df,"el-filter6_new.xlsx",row.names = FALSE)
fwrite(to_export_df, file ="el-filter6_new.csv")

