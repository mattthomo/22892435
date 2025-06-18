# this function is applied to one of the dataframes to make sure that both dataframes have the same column names

same_columns <- function(df){

    df_same_columns <- df %>%
        rename(album = album_name)
}

