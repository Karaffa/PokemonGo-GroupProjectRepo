install.packages("tm")
install.packages("SnowballC")
install.packages("wordcloud")
install.packages("readr")

library(tm)
library(SnowballC)
library(wordcloud)
library(readr)

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

#source('http://www.sthda.com/upload/rquery_wordcloud.r')
#filePath <- "~/Desktop/PokemonGo-GroupProjectRepo/data/timedtwitterdump.txt"
#res<-rquery.wordcloud(filePath, type ="file", lang = "english")
#res<-rquery.wordcloud(filePath, type ="file", lang = "english",
#                                       min.freq = 1,  max.words = 200)
                          
#rquery.wordcloud(x, type=c("text", "url", "file"), 
#                 lang="english", excludeWords = NULL, 
#                 textStemming = FALSE,  colorPalette="Dark2",
#                 max.words=200)