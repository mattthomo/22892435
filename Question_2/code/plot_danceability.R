# now want to plot how danceability has changed over time for each band


plot_danceability <- function(df) {

    # Extract overall max and min danceability scores(across all songs)

    max_val <- max(df$danceability)
    min_val <- min(df$danceability)
    max_song <- df$name[which.max(df$danceability)]
    min_song <- df$name[which.min(df$danceability)]

    # make plot
    g <-  ggplot(df, aes(x = release_date, y = danceability, color = album)) +
        geom_point(size = 3) +

        # Horizontal reference lines
        geom_hline(
            yintercept = max_val,
            linetype = "dashed",
            color = "red",
            alpha = 0.7
        ) +
        geom_hline(
            yintercept = min_val,
            linetype = "dashed",
            color = "blue",
            alpha = 0.7
        ) +

        # Annotations
        annotate(
            "text",
            x = min(df$release_date),
            y = max_val,
            label = paste("Max:", round(max_val, 3), "-", max_song),
            vjust = -1,
            hjust = 0,
            color = "red"
        ) +
        annotate(
            "text",
            x = min(df$release_date),
            y = min_val,
            label = paste("Min:", round(min_val, 3), "-", min_song),
            vjust = 1.5,
            hjust = 0,
            color = "blue"
        ) +

        # Adjust plot limits to accommodate annotations
        expand_limits(y = c(min_val - 0.1, max_val + 0.1)) +

        labs(
            title = "Song Danceability",
            x = "Release Date",
            y = "Danceability (scale between 0-1)",
            color = "Album"
        ) +
        theme_minimal() +
        theme(legend.position = "none")
    g
}

plot_danceability <- function(df) {
    # Calculate overall max and min (across all songs)
    max_val <- max(df$danceability)
    min_val <- min(df$danceability)
    max_song <- df$name[which.max(df$danceability)]
    min_song <- df$name[which.min(df$danceability)]

   g <-  ggplot(df, aes(x = release_date, y = danceability, color = album)) +
        geom_point(size = 3) +

        # Horizontal reference lines (same for both facets)
        geom_hline(yintercept = max_val, linetype = "dashed", color = "red", alpha = 0.7) +
        geom_hline(yintercept = min_val, linetype = "dashed", color = "blue", alpha = 0.7) +

        # Annotations (same for both facets)
        annotate("text", x = min(df$release_date), y = max_val,
                 label = paste("Max:", round(max_val, 3), "-", max_song),
                 vjust = -1, hjust = 0, color = "red") +
        annotate("text", x = min(df$release_date), y = min_val,
                 label = paste("Min:", round(min_val, 3), "-", min_song),
                 vjust = 1.5, hjust = 0, color = "blue") +

        # Facet by live status
        facet_wrap(~live, ncol = 2) +

        # Adjust plot limits
        expand_limits(y = c(min_val - 0.1, max_val + 0.1)) +

        labs(title = "Song Danceability: Live vs Studio Versions",
             x = "Release Date",
             y = "Danceability (0-1)",
             color = "Album") +
        theme_minimal() +
        theme(legend.position = "none",
              strip.text = element_text(size = 12, face = "bold"))
    g
}



plot_danceability <- function(df) {

    # Calculate averages by live status
    avg_lines <- df %>%
        group_by(live) %>%
        summarize(avg_dance = mean(danceability))

    # Calculate global min/max for reference lines
    max_val <- max(df$danceability)
    min_val <- min(df$danceability)
    max_song <- df$name[which.max(df$danceability)]
    min_song <- df$name[which.min(df$danceability)]

    g <- ggplot(df, aes(x = release_date, y = danceability, color = album)) +
        geom_point(size = 3) +

        # Facet by live status
        facet_wrap(~live, ncol = 2) +

        # Global reference lines (shown in both facets)
        geom_hline(yintercept = max_val, linetype = "dotted", color = "red", alpha = 0.7) +
        geom_hline(yintercept = min_val, linetype = "dotted", color = "blue", alpha = 0.7) +

        # Facet-specific average lines
        geom_hline(data = avg_lines,
                   aes(yintercept = avg_dance),
                   color = "darkgreen", size = 1, linetype = "solid") +

        # Annotations for global min/max
        geom_text(data = data.frame(live = unique(df$live)),
                  aes(x = min(df$release_date), y = max_val,
                      label = paste("Max for both:", round(max_val, 3))),
                  vjust = -0.5, hjust = 0, color = "red") +
        geom_text(data = data.frame(live = unique(df$live)),
                  aes(x = min(df$release_date), y = min_val,
                      label = paste("Min for both:", round(min_val, 3))),
                  vjust = 1.5, hjust = 0, color = "blue") +

        # Annotations for facet averages
        geom_text(data = avg_lines,
                  aes(x = min(df$release_date), y = avg_dance,
                      label = paste("Avg:", round(avg_dance, 3))),
                  vjust = -0.5, hjust = 0, color = "darkgreen") +

        scale_y_continuous(limits = c(0, 1)) +
        labs(x = "Release Date",
             y = "Danceability (0-1)",
             color = "Album") +
        theme_minimal() +
        theme(legend.position = "none",
              strip.text = element_text(size = 12, face = "bold"))

    g
}







