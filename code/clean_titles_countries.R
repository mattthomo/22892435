# this function aims to clean up the country column in the `Titles_clean` dataframe so that each country stands in its own row

clean_titles_countries <- function(df){

    clean_df <- df %>%
        # want to remove all brackets around country names
        mutate(production_countries_clean =
                   str_remove_all(production_countries,
                                  pattern = "\\[|\\]|'")) %>%
    # want to remove commas separating certain observations and to put each country in own row
        separate_rows(production_countries_clean, sep = ",\\s*")

    clean_df

}

