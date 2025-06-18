# this function works to filter out all live tracks from the dataset

filter_out_live <- function(df){

    filter_df <- df %>%
        filter(!grepl("Live", df$name))

    filter_df
}



