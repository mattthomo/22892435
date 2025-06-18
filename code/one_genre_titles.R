# this function makes sure that there is one observation for genre in every row for use with the `Titles` database

one_genre_titles <- function(df){

    df_clean <- df %>%
        # Remove brackets and quotes
        mutate(genres_clean = str_remove_all(genres, pattern = "\\[|\\]|'")) %>%
        # Split comma-separated values into separate rows
        separate_rows(genres_clean, sep = ",\\s*")

    # View result
    df_clean
}

