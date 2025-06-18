# this function calculates the proportion of billionaires in a period which have sourced their wealth through inheritance.

inherited_proportion <- function(df){

    prop_df <- df %>%
        group_by(year) %>%
        summarise(n_inherited = sum(wealth.how.inherited != "not inherited"),
                  total_count = n(),
                  proportion_inherited = n_inherited / total_count,
                  proportion_not_inherited = 1 - proportion_inherited)
    prop_df
}

