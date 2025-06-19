# this function aims to produce Spearman rank correlations on the top 25 names

spearman_top_25 <- function(df, gender) {

    # top 25 names for each year
    top_names <- df %>%
        filter(Gender == gender) %>%
        group_by(Year) %>%
        arrange(desc(Count)) %>%
        slice_head(n = 25) %>%
        # adding in a column for rank
        mutate(rank = row_number()) %>%
        ungroup()

    # Create all year pairs we want to compare
    year_pairs <- expand_grid(year1 = unique(top_names$Year),
                              year2 = unique(top_names$Year)) %>%
        filter(year2 > year1, year2 <= year1 + 3) %>%  # Compare with next 3 years
        mutate(lag = year2 - year1)

    # now want to get correlations for each pair of years
    results <- year_pairs %>%
        rowwise() %>%

        # want to get ranks for common years

        mutate(data1 = list(top_names %>%
                                filter(Year == year1) %>%
                                select(Name, rank)),
               data2 = list(top_names %>%
                                filter(Year == year2) %>%
                                select(Name, rank)),

            # join to find common names

            joined = list(inner_join(data1, data2, by = "Name")),

            # now can calculate spearman correlations (need 5 overlapping names)

            correlation = ifelse(nrow(joined) >= 5,
                                 cor(joined$rank.x, joined$rank.y, method = "spearman"),
                                 NA)) %>%
        ungroup() %>%
        select(Year = year1, lag, correlation)

    # Reshape to wide format (one row per year)
    results_wide <- results %>%
        pivot_wider(names_from = lag,
                    values_from = correlation,
                    names_prefix = "cor_") %>%
        rename(cor_1yr = cor_1, cor_2yr = cor_2, cor_3yr = cor_3)

    return(results_wide)
}






