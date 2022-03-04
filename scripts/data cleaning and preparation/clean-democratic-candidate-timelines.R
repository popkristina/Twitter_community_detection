#Library for manipulation with JSON files
# I think we don't need this one library(rjson)
library(jsonlite)
library(plyr)
library(xlsx)

#Set the working directory as the folder of the project
setwd("D:/Proekti/ElectionPrediction/Harvard_Dataset/Raw")

#Read the JSON file into the json_file variable
json_file <- lapply(readLines("democratic-candidate-timelines-retreived.json"), fromJSON)

#Just check if the number of rows is equivalent to the number of tweets retreived with hydrator
length(json_file)

#Clear the nulls and replace them with NAs
#json_file_new <- lapply(json_file, function(x) {
#  x[sapply(x, is.null)] <- NA
#  unlist(x)
#})

#Define an empty list to store screen names
user_screen<-list()
for(i in 1:length(json_file)){
  user_screen[i]<-json_file[[i]]$user$screen_name
}

user_name<-list()
for(i in 1:length(json_file)){
  user_name[i]<-json_file[[i]]$user$name
}

user_location<-list()
for(i in 1:length(json_file)){
  user_location[i]<-json_file[[i]]$user$location
}

tweet_text<-list()
for(i in 1:length(json_file)){
  tweet_text[i]<-json_file[[i]]$full_text
}


#Binding the data we need by column
to_export<-cbind(user_screen,user_name,user_location,tweet_text)
#to_export<-rbind(cbind("Screen name","Name","Location","Text"),to_export)
to_export_df<-data.frame(to_export)


#Clean the rows in which the location is not US
#Taken into consideration only the most popular locations that were showing across the file
#Lowered the number of rows from 509 to 476
for(i in 1:nrow(to_export_df)){
  for(j in 1:ncol(to_export_df)){
    if(grepl("England",to_export_df[i,j]) || 
       grepl("Australia",to_export_df[i,j]) ||
       grepl("United Kingom",to_export_df[i,j]) ||
       grepl("Canada",to_export_df[i,j]) ||
       grepl("UK",to_export_df[i,j]) || 
       grepl("Europe",to_export_df[i,j]) || 
       grepl("Africa",to_export_df[i,j]) || 
       grepl("Ireland",to_export_df[i,j]) || 
       grepl("France",to_export_df[i,j]) || 
       grepl("London",to_export_df[i,j]) ||
       grepl("Spain",to_export_df[i,j]) ||
       grepl("Italy",to_export_df[i,j]) ||
       grepl("Belgium",to_export_df[i,j]) ||
       grepl("Barcelona",to_export_df[i,j]) ||
       grepl("Russia",to_export_df[i,j]) ||
       grepl("Barcelona",to_export_df[i,j]) ||
       grepl("Paris",to_export_df[i,j]) ||
       grepl("Moscow",to_export_df[i,j]) ||
       grepl("China",to_export_df[i,j]) ||
       grepl("Abu Dhabi",to_export_df[i,j]) ||
       grepl("Germany",to_export_df[i,j]) ||
       grepl("Berlin",to_export_df[i,j])){
      to_export_df<-to_export_df[-i,]
    }
  }
}

write.xlsx(to_export_df,"../Cleaned/democratic-candidate-timelines-cleaned.xlsx",row.names = FALSE)
