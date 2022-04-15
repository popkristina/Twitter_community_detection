## 1. Intro

Aim: understand communities by mapping the relationships that connect people as a network and  draw out key 
individuals, groups within the network as well as associations between the individuals. 

Assumption: On Twitter it is highly likely that people with similar political interests will follow the 
same politicians, or people with mutual opinion on something will share each other’s posts as they express 
similar opinion.

Target: US 2016 presidential elections.  

## 2. Data

The tweets were retrieved from Harvard Dataverse, which contains a huge corpus of around 280 million tweet ids, 
divided into several files. All of the tweets are selected with help of Social Feed Manager so that they are all 
connected to the US 2016 presidential elections. They are divided into several collections of tweet ids. 
For the purpose of this project, few thousand tweets were downloaded from the id collections election filter 1 
through 6. The tweets from the six different collections were retrieved with the Hydrator tool. 
Since Twitter gives away its data in json format, the tweets were first processed with R and converted in csv 
format.