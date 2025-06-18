# This script houses the function for obtaining each year's 25 most popular boys' and girs' names

twenty5_most_pop_names_yearly <- function(Baby_Names){

    library(tidyverse)

    # first aggregate all names to a country-level

    total_name_count <- function(Baby_Names){

        total_count_per_year <- Baby_Names %>%
            group_by(Name, Year, Gender) %>%
            summarise(total_count = sum(Count)) %>%
            ungroup()

        total_count_per_year
    }

    # create a function which creates a column assigning a rank by frequency of each name for each year and gender

    rank_name_yearly <- function(total_count_per_year){

        ranked_total_names <- total_count_per_year %>%
            group_by(Year, Gender) %>%
            arrange(desc(total_count)) %>%
            mutate(yearly_rank = min_rank(desc(total_count))) %>%
            ungroup

        ranked_total_names
    }

    ranked_total_names <- rank_name_yearly(total_count_per_year)

    # now want to get top 25 boys' and girls' names per year

    top_25_yearly <- function(ranked_total_names){

        top_25 <- ranked_total_names %>%
            group_by(Year, Gender) %>%
            filter(yearly_rank == 1:25) %>%
            ungroup() %>%
            arrange(Year, Gender)


        top_25
    }

 top_25 <- top_25_yearly(ranked_total_names)
}
