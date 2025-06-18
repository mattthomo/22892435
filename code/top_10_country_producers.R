# This function aims to obtain the list of the top 10 movie producing countries which will later be joined with the average rating of movies produced in that country

top_10_country_producers <- function(df){

    top_df <- df %>%
        count(production_countries_clean, sort = T) %>%
        filter(production_countries_clean != "") %>%
        top_n(10, n) %>%
        arrange(desc(n))

    top_df
}


