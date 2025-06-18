# this function creates the pie chart needed for the analysis of inheritance changes over years

plot_pie_inherited <- function(df){

    # first change df to longer format after it came from inherited_proportion function
    plot_df <- df %>%
        pivot_longer(cols = -year,
                     names_to = "wealth_type",
                     values_to = "proportion"
        ) %>%
        mutate(wealth_type = factor(wealth_type,
                                    levels = c("proportion_inherited", "proportion_not_inherited"),
                                    labels = c("Inherited", "Not Inherited"))) %>%
        filter(wealth_type %in% c("Inherited", "Not Inherited")) # only keep values for inherited and non-inherited

    # now want to plot

    g <- plot_df %>%
    ggplot(aes(x = "",
               y = proportion,
               fill = wealth_type)) +
        geom_bar(width = 1, stat = "identity") +
        coord_polar("y", start = 0) +
        facet_wrap(~year) +
        geom_text(aes(label = scales::percent(proportion, accuracy = 1)),
                  position = position_stack(vjust = 0.5)) +
        labs(fill = "Wealth Type") +
        scale_fill_manual(values = c("#E69F00", "#56B4E9")) +
        theme_void() +
        theme(legend.position = "bottom",
              plot.title = element_text(hjust = 0.5))
    g
}


