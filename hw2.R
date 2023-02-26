library(ggplot2)
library(tidyverse)
library(spotifyr)
library(compmus)

theLessIKnowID <- '6K4t31amVTZDgR3sKmwUJJ'

wood <-
  get_tidy_audio_analysis(theLessIKnowID) |>
  select(segments) |>
  unnest(segments) |>
  select(start, duration, pitches)

wood |>
  mutate(pitches = map(pitches, compmus_normalise, "euclidean")) |>
  compmus_gather_chroma() |> 
  ggplot(
    aes(
      x = start + duration / 2,
      width = duration,
      y = pitch_class,
      fill = value
    )
  ) +
  geom_tile() +
  labs(x = "Time (s)", y = NULL, fill = "Magnitude") +
  theme_minimal() +
  scale_fill_viridis_c()
