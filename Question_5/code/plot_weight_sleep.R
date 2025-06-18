# this function creates the output of a regression of weight change and sleep quality on stress

plot_weight_sleep<- function(df){

    pacman::p_load(scales)

    plot_df <- df %>%
        rename("Sleep" = "Sleep Quality",
               "Stress" = "Stress Level",
               "Weight_change" = "Weight Change (lbs)",
               "Exercise" = "Physical Activity Level") %>%
        mutate(Sleep = factor(Sleep,
                       levels = c("Poor", "Fair", "Good", "Excellent")))

    g <- plot_df %>%
        ggplot(aes(x = Sleep, y = Weight_change, fill = Sleep)) +
        geom_boxplot(
            width = 0.6,
            alpha = 0.8,
            outlier.shape = 21,
            outlier.size = 3,
            outlier.fill = "red",
            outlier.alpha = 0.6
        ) +
        # add mean markers
        stat_summary(
            fun = mean,
            geom = "point",
            shape = 23,
            size = 4,
            color = "black",
            fill = "yellow"
        ) +

        # custom colours found on internet
        scale_fill_manual(values = c("#4E79A7", "#A0CBE8", "#F28E2B", "#FFBE7D")) +

        labs(x = "Sleep Quality Category",
            y = "Weight Change (lbs)") +
        theme_minimal() +
        theme(axis.title = element_text(face = "bold"),
            legend.position = "none",
            panel.grid.major.x = element_blank()) +
        scale_y_continuous(breaks = pretty_breaks(n = 8)) +
        coord_flip()  # Flip coordinates for horizontal boxplots


    g
}


