# this function combines the dataframes separated by gender which can be useful for later analysis when visualising the spearman rank correlations

combine_genders_for_plot <- function(boy_df, girl_df){

combined_results <- bind_rows(boy_df %>%
                                  mutate(sex = "Boys"),
                              girl_df %>%
                                  mutate(sex = "Girls")) %>%
    pivot_longer(cols = starts_with("cor_"),
                 names_to = "time_lag",
                 values_to = "correlation") %>%

    # creating the time lag column here to account for later persistence

    mutate(time_lag = case_when(time_lag == "cor_1yr" ~ "1 Year Later",
                                time_lag == "cor_2yr" ~ "2 Years Later",
                                time_lag == "cor_3yr" ~ "3 Years Later"),
           time_lag = factor(time_lag, levels = c("1 Year Later", "2 Years Later", "3 Years Later")))

combined_results

}
