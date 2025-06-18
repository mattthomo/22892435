# this function aims to clean up the `company.sector` column, and then to plot the top 10 most frequent sectors

plot_sectors <- function(df) {

    # first clean and capitalise sectors
    clean_df <- df %>%
        mutate(company.sector = str_to_title(company.sector)) %>%
        filter(!is.na(company.sector))

    # get top 10 sectors per period
    top_sectors <- clean_df %>%
        count(year, company.sector) %>%
        group_by(year) %>%
        arrange(desc(n)) %>%
        slice_max(n, n = 10) %>%
        ungroup()

    # get software values for all years
    software_values <- clean_df %>%
        filter(company.sector == "Software") %>%
        count(year, name = "software_n") %>%
        complete(year = unique(top_sectors$year), fill = list(software_n = 0))

    # now want to make plot

    g <- ggplot() +

        # bars for top sectors
        geom_col(
            data = top_sectors,
            aes(x = reorder(company.sector, n),
                y = n,
                fill = company.sector)
        ) +
        # software reference lines

        geom_hline(
            data = software_values,
            aes(yintercept = software_n),
            color = "black",
            linetype = "dashed",
            linewidth = 0.8
        ) +

        # Software labels
        geom_text(
            data = software_values,
            aes(
                x = 10,
                y = pmax(software_n, max(top_sectors$n) * 0.9),
                label = paste0("Software: ", software_n)
            ),
            color = "darkred",
            size = 3,
            hjust = 1,
            vjust = -0.5
        ) +
        coord_flip() +
        facet_wrap(~year, scales = "free_y") +
        labs(x = "Sector",
            y = "Number of Billionaires"
        ) +
        theme_minimal() +
        theme(
            legend.position = "none",
            strip.text = element_text(size = 10, face = "bold")
        )

    g
}


