# this function aims to produce visualised output for the Spearman rank correlation for each year's top 25 names

spearman_top25 <- function(df){

    library(tidyverse)


    # Join to get next years' ranks for same names & gender
    top_25_persistence <- names %>%
        select(Year, Gender, Name, rank) %>%
        rename(rank_t = rank) %>%
        left_join(
            top_25 %>% select(year, gender, name, rank) %>%
                mutate(year = year - 1),
            by = c("year", "gender", "name")
        ) %>%
        rename(rank_t1 = rank) %>%
        left_join(
            top_25 %>% select(year, gender, name, rank) %>%
                mutate(year = year - 2),
            by = c("year", "gender", "name")
        ) %>%
        rename(rank_t2 = rank)




# first want to pivot table into wider format and split up by gender (found it easier to do it this way than to use `group_by`) so that the ranks appear next to each other for each year (making it easier to see correlations for each name)

make_data_wider <- function(df, gender){
    wider_data <- df %>%
        filter(Gender == gender) %>%
        select(Name, Year, yearly_rank) %>%
        pivot_wider(names_from = Year,
                    values_from = yearly_rank)
    wider_data
}


   wider_f_data <- make_data_wider(complete_data, "F")

   wider_m_data <- make_data_wider(complete_data, "M")


# now can get the spearman correlations by gender

   get_spearman <- function(wide_df, gender) {
       years <- names(wide_df) %>%
           str_subset("^Y") %>%
           str_remove("Y") %>%
           as.integer() %>%
           sort()


       starts <- years[years <= max(years) - 2]
       map_dfr(starts, function(y) {
           cols <- paste0("Y", y:(y+2))
           df <- wide_df %>% select(all_of(cols)) %>% drop_na()
           if (nrow(df) < 5) return(NULL)
           cm <- cor(df, method = "spearman")
           tibble(
               gender = gender,
               start_year = y,
               Yt_Yt1 = cm[1, 2],
               Yt_Yt2 = cm[1, 3],
               Yt1_Yt2 = cm[2, 3],
               n_names = nrow(df)
           )
       })
   }

   spearman_female <- get_spearman(female_wide, "F")
   spearman_male   <- get_spearman(male_wide, "M")

}