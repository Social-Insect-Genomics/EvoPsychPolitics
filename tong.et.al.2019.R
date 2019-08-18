# tong et al. 2019

# need to load these packages

library(devtools)
library(stringr)
library(plyr)
library(dplyr)
library(reshape2)
library(tokenizers)
library(tidytext)
library(qdap)
library(network)
library(RSQLite)
library(httr)
library(bit64)
library(sna)
library(ggplot2)
library(network)
require(ggnet)
require(rtweet)
require(twtools)

twitter_tokens <- create_token(app = "EvoPsychPolitics",
                               consumer_key = "EiBIaJ11vKe05Mzmu5CM3rIv5",
                               consumer_secret = "1Qr5nl08nk0TRsN5mCev9NCr0FVaEwrWmmsa6q5KInOcoOActV",
                               access_token = "1162231836937822208-MFJEiDuJ2K7IKqzpdkdxF1EfmQMDlV",
                               access_secret = "EKWBIXxHh8ZjjksLa0jXBtN758pooGpGkEFPQrYqZZvWO")

                               #searching for evolutionary psychology tweets on twitter

                               evopsy <- search_tweets('evolutionary psychology', n = 1000, lang = 'en')

                               #clean tweets so they can be analysed

                               evopsy <- clean_tweets(evopsy)

                               #specify lexicon (NRC)
                               lexicon <- "nrc"

                               #count number of negative or positive words

                               evopsy <- dictionary_count(evopsy)

                               #searching for social psychology tweets on twitter

                               socpsy <- search_tweets('social psychology', n = 1000, lang = 'en')

                               #clean tweets so they can be analysed

                               socpsy <- clean_tweets(socpsy)

                               #count number of negative or positive words

                               socpsy <- dictionary_count(socpsy)

                               #ttest to test for differnces

                               t.test(evopsy$negative_count, socpsy$negative_count, var.equal = TRUE)

                               #correct for number of words in tweet

                               evopsy$perc_negative <- evopsy$negative_count/evopsy$word_count
                               socpsy$perc_negative <- socpsy$negative_count/socpsy$word_count

                               #ttest to test for differnces

                               t.test(evopsy$perc_negative, socpsy$perc_negative, var.equal = TRUE)
