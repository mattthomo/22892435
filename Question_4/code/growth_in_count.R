# this function calculates the growth in the number of billionaires who either come from inheritance or do not

growth_in_count <- function(df){

    growth_df <- df %>%
        mutate(n_not_inherited = total_count - n_inherited) %>%
        mutate(growth_inherited = (n_inherited - lag(n_inherited)) / lag(n_inherited) * 100) %>%
        mutate(growth_not_inherited = (n_not_inherited - lag(n_not_inherited)) / lag(n_not_inherited) * 100)
    growth_df
}


