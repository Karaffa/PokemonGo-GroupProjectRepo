rm(list = ls())

install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("RColorBrewer")
install.packages("readr")

library(tm)
library(SnowballC)
library(RColorBrewer)
library(wordcloud)
library(readr)

#Creates Word Cloud BEFORE removing "Tweet", "Time", and "User"
#Destination of .csv for Josue
timedTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/timedtwitterdump.csv")

#Destination of .csv for Jessica
#timedTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/timedtwitterdump.csv")

#Destination of .csv for Pierre
#timedTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/timedtwitterdump.csv")

tweetCorpus <- Corpus(VectorSource(timedTweets))
tweetCorpus <- tm_map(tweetCorpus, content_transformer(tolower))
tweetCorpus <- tm_map(tweetCorpus, removePunctuation)
tweetCorpus <- tm_map(tweetCorpus, PlainTextDocument)
tweetCorpus <- tm_map(tweetCorpus, removeWords, stopwords('english'))
tweetCorpus <- tm_map(tweetCorpus, removeWords, stopwords('spanish'))
tweetCorpus <- tm_map(tweetCorpus, removeWords, c("user", "tweet", "time", "pokemongo", "httpst…", "ポケモンGO", 
     "retweet", "httpstcokbititppf", "pokemon", "ポケモンgo","ポケモンの巣",
     "httpstcokbititppf", "pokémon", "...", "twi...", "group...", "will",
     "httpst...", "pikachu...", "know", "look", "just", "like", "join", "aquí",
     "1000", "u00001f680", "u0001f534", "u0001f31f", "u0001f525", "ポケモン",
     "出現報告", "ポケGO", "httpst…", "u0001f60", "pikachu…", "yeah", "ポケモンGO"))
tweetCorpus <- tm_map(tweetCorpus, stemDocument)
wordcloud(tweetCorpus, max.words = 100, random.order = FALSE, random.color = TRUE, 
          colors = rev(colorRampPalette(brewer.pal(8,"Paired"))(32)), scale=c(5, .5))

#Creates Word Cloud AFTER removing "Tweet", "Time", and "User"
#Destination of .csv for Josue
wordCloudTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/forwordcloud.csv")

#Destination of .csv for Jessica
#wordCloudTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/forwordcloud.csv")

#Destination of .csv for Pierre
#wordCloudTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/forwordcloud.csv")

wordCloudCorpus <- Corpus(VectorSource(wordCloudTweets))
wordCloudCorpus <- tm_map(wordCloudCorpus, content_transformer(tolower))
wordCloudCorpus <- tm_map(wordCloudCorpus, removePunctuation)
wordCloudCorpus <- tm_map(wordCloudCorpus, PlainTextDocument)
wordCloudCorpus <- tm_map(wordCloudCorpus, removeWords, stopwords('english'))
wordCloudCorpus <- tm_map(wordCloudCorpus, removeWords, stopwords('spanish'))
wordCloudCorpus <- tm_map(wordCloudCorpus, removeWords, c("pokemongo", "httpst…", 
   "retweet", "httpstcokbititppf", "pokemon", "ポケモンgo","ポケモンの巣",
   "httpstcokbititppf", "pokémon", "twi...", "group...", "will","...",
   "httpst...", "pikachu...", "know", "look", "just", "like", "join", "aquí",
   "u00001f680", "u0001f534", "u0001f31f", "u0001f525", "ポケモン",
   "出現報告", "ポケgo", "httpst…", "pikachu…", "yeah", "ポケモンgo",
   "u0001f60", "u0001f680", "10000", "group", "still", "httpstcokbititppf",
   "無料で誰でも気軽に出現情報を共有できる♪匿名okなオープンチャット◎",
   "dont", "want", "thank", "want", "play", "telegram", "video"))
wordCloudCorpus <- tm_map(wordCloudCorpus, stemDocument)
wordcloud(wordCloudCorpus, max.words = 50, random.order = FALSE, random.color = TRUE, 
          colors = rev(colorRampPalette(brewer.pal(8,"Paired"))(32)), scale=c(5, .5))

