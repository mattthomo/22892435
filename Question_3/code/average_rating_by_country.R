# this function aims to average the IMDB ratings across each country from the `Titles_clean` dataframe

average_rating_by_country <- function(df){

    clean_df <- df %>%
        group_by(production_countries_clean) %>%
        mutate(country_average = mean(imdb_score, na.rm = T)) %>%
        ungroup()

    clean_df
}

