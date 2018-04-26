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

#Creates Word Cloud AFTER removing "Tweet", "Time", and "User"
#Destination of .csv for Josue
wordCloudTweets <- read_csv("~/Desktop/PokemonGo-GroupProjectRepo/data/userparseddump.csv")

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
wordCloudCorpus <- tm_map(wordCloudCorpus, removeWords, c("user", "tweet", "time",
    "pokemongo", "httpst…", "...", "httpstcokbititppf", "pikachu...",
    "retweet", "httpstcokbititppf", "pokemon", "ポケモンgo","ポケモンの巣",
    "httpstcokbititppf", "pokémon", "twi...", "group...", "will","...",
    "httpst...", "know", "look", "just", "like", "join", "aquí",
    "u00001f680", "u0001f534", "u0001f31f", "u0001f525", "ポケモン",
    "出現報告", "ポケgo", "httpst…", "pikachu…", "yeah", "ポケモンgo",
    "u0001f60", "u0001f680", "10000", "group", "still", "httpstcokbititppf",
    "無料で誰でも気軽に出現情報を共有できる♪匿名okなオープンチャット◎",
    "dont", "want", "thank", "want", "play", "telegram", "video"))
wordCloudCorpus <- tm_map(wordCloudCorpus, stemDocument)
wordcloud(wordCloudCorpus, max.words = 50, random.order = FALSE, random.color = TRUE, 
          colors = rev(colorRampPalette(brewer.pal(8,"Paired"))(32)), scale=c(5, .5))
