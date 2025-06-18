# this function creates the plot which tries to visualise the relationship between genres and imdb ratings

plot_genre_ratings <- function(df){

    library(ggridges)

    genre_means <- df %>%
        group_by(genres_clean) %>%
        summarise(mean_score = mean(imdb_score, na.rm = TRUE)) %>%
        ungroup() %>%
        arrange(mean_score)

# first calculate the meme from the
    g <- df %>%
        ggplot(aes(x = imdb_score, y = genres_clean, fill = genres_clean)) +
        geom_density_ridges(alpha = 0.7) +
        labs(x = "IMDB Score", y = "Genres") +
        theme_minimal() +
        theme(legend.position = "none") +
        geom_vline(
            xintercept = mean(Titles_clean$imdb_score, na.rm = T),
            linetype = "dotted",
            color = "darkred"
        ) +
        geom_text(data = genre_means,
                  aes(x = mean_score, y = genres_clean,
                      label = round(mean_score, 1)),
                  nudge_y = 0.25,
                  size = 3) +
        geom_point(data = genre_means,
                   aes(x = mean_score, y = genres_clean),
                   color = "black",
                   size = 2)



    g
}


