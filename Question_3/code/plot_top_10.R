# want to create a simple visualisation of the top 10 movie-producing countries

plot_top_10 <- function(df){

    # Bar plot
    g <- df %>%
        mutate(production_country =
                   fct_reorder(production_countries_clean, n)) %>%
        ggplot(aes(x = n,
                   y = production_country)) +
        geom_col(fill = "steelblue") +
        geom_text(aes(label = n), hjust = -0.2) +
        labs(x = "Number of Movies",
             y = "Country abbreviation") +
        theme_minimal()
    g
}
