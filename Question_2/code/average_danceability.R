# want to average the danceability of an album for both bands

average_danceability <- function(df){

    df1 <- df %>%
        group_by(album) %>%
        mutate(average_danceability = mean(danceability))

    df1
}


