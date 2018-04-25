rm(list = ls())

install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("readr")

library(tm)
library(SnowballC)
library(wordcloud)
library(readr)

#Creates Word Cloud before removing "Tweet", "Time", and "User"
timedTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/timedtwitterdump.csv")

tweetCorpus <- Corpus(VectorSource(timedTweets))
tweetCorpus <- tm_map(tweetCorpus, content_transformer(tolower))
tweetCorpus <- tm_map(tweetCorpus, removePunctuation)
tweetCorpus <- tm_map(tweetCorpus, PlainTextDocument)
tweetCorpus <- tm_map(tweetCorpus, removeWords, stopwords('english'))
tweetCorpus <- tm_map(tweetCorpus, removeWords, stopwords('spanish'))
tweetCorpus <- tm_map(tweetCorpus, stemDocument)
wordcloud(tweetCorpus, max.words = 200, random.order = FALSE, random.color = TRUE, 
          colors = rev(colorRampPalette(brewer.pal(8,"Paired"))(32)), scale=c(5, .5))

#Creates Word Cloud after removing "Tweet", "Time", and "User"
wordCloudTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/forwordcloud.csv")

wordCloudCorpus <- Corpus(VectorSource(wordCloudTweets))
wordCloudCorpus <- tm_map(wordCloudCorpus, content_transformer(tolower))
wordCloudCorpus <- tm_map(wordCloudCorpus, removePunctuation)
wordCloudCorpus <- tm_map(wordCloudCorpus, PlainTextDocument)
wordCloudCorpus <- tm_map(wordCloudCorpus, removeWords, stopwords('english'))
wordCloudCorpus <- tm_map(wordCloudCorpus, removeWords, stopwords('spanish'))
wordCloudCorpus <- tm_map(wordCloudCorpus, stemDocument)
wordcloud(wordCloudCorpus, max.words = 200, random.order = FALSE, random.color = TRUE, 
          colors = rev(colorRampPalette(brewer.pal(8,"Paired"))(32)), scale=c(5, .5))

