# this function creates missing values for all names which were not given in that year, giving a more complete dataframe

complete_ranked_name_data <- function(ranked_total_names){

    complete_data <- ranked_total_names %>%
        group_by(Gender) %>%
        complete(Name = unique(Name),
                 Year = full_seq(Year, 1)) %>%
        arrange(Gender, Name, Year) %>%
        ungroup()

    complete_data
}
