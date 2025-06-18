# Want to create a plot which shows how the Coldplay's song length has varied over the years

plot_song_length_coldplay <- function(){

    h <- coldplay_unalive %>%
        ggplot(aes(x = release_date, y = duration, colour = album)) +
        geom_point(size = 3) +
        # Add song labels
        geom_text(
            aes(label =
                    name),
            hjust = -0.1,
            vjust = 0.5,
            size = 3,
            check_overlap = TRUE
        ) +

        # Reference lines with annotations
        geom_hline(
            yintercept = coldplay_unalive_stats$avg_duration,
            linetype = "dashed",
            color = "gray50"
        ) +
        geom_hline(
            yintercept = coldplay_unalive_stats$max_duration,
            linetype = "dotted",
            color = "red"
        ) +
        geom_hline(
            yintercept = coldplay_unalive_stats$min_duration,
            linetype = "dotted",
            color = "blue"
        ) +

        annotate(
            "text",
            x = min(coldplay_unalive$release_date),
            y = coldplay_unalive_stats$avg_duration,
            label = paste(
                "Average:",
                round(coldplay_unalive_stats$avg_duration, 1),
                "min"
            ),
            vjust = -0.5,
            hjust = 0,
            color = "gray50"
        ) +
        annotate(
            "text",
            x = min(coldplay_unalive$release_date),
            y = coldplay_unalive_stats$max_duration,
            label = paste(
                "Longest:",
                coldplay_unalive_stats$max_song,
                round(coldplay_unalive_stats$max_duration, 1),
                "min"
            ),
            vjust = -0.5,
            hjust = 0,
            color = "red"
        ) +
        annotate(
            "text",
            x = min(coldplay_unalive$release_date),
            y = coldplay_unalive_stats$min_duration,
            label = paste(
                "Shortest:",
                coldplay_unalive_stats$min_song,
                round(coldplay_unalive_stats$min_duration, 1),
                "min"
            ),
            vjust = -0.5,
            hjust = 0,
            color = "blue"
        ) +
        # Cosmetic settings
        labs(x = "Release Year",
             y = "Duration (minutes)",
             color = "Album"
        ) +
        theme_minimal() +
        theme(legend.position = "none")
}
