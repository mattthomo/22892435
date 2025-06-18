# this function makes sure that there is one observation for genre in every row for use with the `Movie_Info` database

one_genre_mov_info <- function(df){

    df_clean <- df %>%
        separate_rows(listed_in, sep = ",\\s*")

    df_clean
}

