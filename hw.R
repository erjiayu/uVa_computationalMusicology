library(ggplot2)
library(tidyverse)
library(spotifyr)

tameImpala <- get_artist_audio_features('tame impala')
tameImpalaID <- '5INjqkS1o8h1imAzPqGZBb'
tameImpalaTopTracks <- get_artist_top_tracks('5INjqkS1o8h1imAzPqGZBb')

ggplot(tameImpala, aes(x = tempo, y = energy, size = valence, color = album_name)) + geom_point() + ggtitle("Tame Impala Analysis")

