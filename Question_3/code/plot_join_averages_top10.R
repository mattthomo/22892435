# this function aims to join the averages of the top 10 countries to the `top_10` dataframe and then to make a plot from this

plot_join_averages_top10 <- function(df){

    # first want to get average ratings of all countries
    av_df <- titles_clean_countries %>%
        average_rating_by_country() %>%
        select(country_average, production_countries_clean)

    # then want to join this onto the top_10 df
    join_df <- df %>%
        left_join(av_df, by = "production_countries_clean") %>%
        distinct() # only keeps one row of data for every country (useful as many duplicates joined after previous line)
    join_df
    # now want to plot

    g <- join_df %>%
        ggplot(aes(
            x = n,
            y = country_average,
            size = n,
            color = production_countries_clean
        )) +
        geom_point(alpha = 0.7) +
        scale_size(range = c(5, 15)) +
        ggrepel::geom_text_repel(aes(label = production_countries_clean), size =
                                     4) +
        labs(x = "Number of Movies Produced",
             y = "Average Rating (IMDb)") +
        theme_minimal() +
        theme(legend.position = "none")

    g
}



