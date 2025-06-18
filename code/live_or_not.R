# creating a function which states if the song is live or not

live_or_not <- function(df){

    df <- df %>%
        mutate(live = ifelse(grepl("Live", df$name),
                             "Live Version",
                             "Studio Version etc."))

    df
}
