## Overview

Aim: understand communities by mapping the relationships that connect people as a network and  draw out key 
individuals, groups within the network as well as associations between the individuals. 

Assumption: On Twitter it is highly likely that people with similar political interests will follow the 
same politicians, or people with mutual opinion on something will share each other’s posts as they express 
similar opinion.

Target tweets: US 2016 presidential elections.  

## Data

Tweets retrieved from [Harvard Dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/PDI7IN).
Dataset originally contains a huge corpus of ~280 million tweet ids, grouped into separate collections. 

Tweets used from dataset: random selection from id collections election filter 1 through 6.

[Hydrator tool](https://github.com/DocNow/hydrator) used to retrieve tweets from tweet ids

Since Twitter gives away its data in json format, the tweets were first processed with R and converted in csv 
format.

For this project, a subset dataset of 162,520 entries and 13 column attributes is used. 

## Network Creation

[Networkx](https://networkx.org/) package for Python.

Nodes for network creation are the ‘user_screen’ and ‘original_author’ attributes. Each node is a user screen name. Edges are
the 'retweet' connections between the users. If the tweet was originally tweeted by user X, and retweeted by user Y, they form a 
directed link from user Y to user X. 

Resulting: directed graph with ‘user_screen’ as source, ‘original_author’ as target and ‘retweet’ as a mapping function. 

![Retweet relation](/plots/rt_graph.png "Retweet relationship")

## Network Properties

### Node Degrees

Average in-degree and out-degree of the graph can be calculated.

### Power Laws

In its definition, it tells that the number of web that has k in-links is approximately 1/k^2.

### Friendship Paradox

This phenomenon examined by Scott Feld which states that one person’s friends have more friends in average than he/she has. 
This was proven to be true for Facebook friendships, Tweeter follow connections, 
but also in real-life situations. 

### Page Rank

A link analysis algorithm that ranks web pages by importance and authority. The page rank of a page is calculated recursively and it depends on number of page rank metrics of all other pages that link to it.

Calculate the PR for the Twitter profiles & and order them by importance. 

PageRank calculated with networkx scipy implementation.


## Community Detection

Assumption: People tend to group themselves according to opinions by interacting with some users, therefore forming communities. 

Communities are detected with Louvain community detection algorithm. Python implementation of [Louvain](https://python-louvain.readthedocs.io/en/latest/) compatible with NetworkX used.

It finds the partitions iteratively, first starts as with every node as its own community, and then based on modularity calculation, in each next iteration it moves the nodes to a new community in order to maximize the modularity in that community. If there is no change in modularity, then the node stays in its own community.