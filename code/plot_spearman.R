# this function plots the output from the spearman rank correlations obtained

plot_spearman <- function(df){

    g <- df %>%
        ggplot(aes(x = Year, y = correlation, color = time_lag)) +
        geom_point(alpha = 0.2, size = 1.5) +
        geom_smooth(method = "loess", se = TRUE, span = 0.3) +
        facet_wrap(~sex) +
        geom_vline(xintercept = 1990, linetype = "dashed", color = "gray40") +
        annotate("text", x = 1995, y = 0.2, label = "Post-1990", color = "gray40") +
        labs(x = "Year",
             y = "Rank Correlation Coefficient",
             color = "Time Lag") +
        theme_minimal(base_size = 12) +
        theme(legend.position = "bottom",
              panel.grid.minor = element_blank(),
              strip.text = element_text(face = "bold"))
    g
}