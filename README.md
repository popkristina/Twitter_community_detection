## 1. Intro

Aim: understand communities by mapping the relationships that connect people as a network and  draw out key 
individuals, groups within the network as well as associations between the individuals. 

Assumption: On Twitter it is highly likely that people with similar political interests will follow the 
same politicians, or people with mutual opinion on something will share each other’s posts as they express 
similar opinion.

Target: US 2016 presidential elections.  

## 2. Data

The tweets were retrieved from [Harvard Dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/PDI7IN), which contains a huge corpus of around 280 million tweet ids, 
divided into several files. All of the tweets are selected with help of Social Feed Manager so that they are all 
connected to the US 2016 presidential elections. They are divided into several collections of tweet ids. 
For the purpose of this project, few thousand tweets were downloaded from the id collections election filter 1 
through 6. The tweets from the six different collections were retrieved with the Hydrator tool. 
Since Twitter gives away its data in json format, the tweets were first processed with R and converted in csv 
format.

### Data Description

The resulting dataset contains a total of 162,520 entries and 13 column attributes. We will focus on the ‘user_screen’ and ‘original_author’ attributes for network creation. The network is created with the networkx package for Python, where each node is a user, and the edges are the ‘retweet’ connections between the users. This means, if the tweet was originally tweeted by user X, and retweeted by user Y; we will have a directed link from user Y to user X. In other words, 
we create a directed graph with ‘user_screen’ as source and ‘original_author’ as target, where the map function f is ‘retweet’. First we remove the entries where the ‘original_author’ field is blank (they are not retweeted) as we only examine the retweet relationship between users.