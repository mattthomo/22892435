# create a simple table to show how the number of inherited has increased in the US

simple_inheritance_table <- function(df, caption, format){

    # need Kable for the table

    library(kableExtra)

    table_df <- df %>%
        mutate(n_not_inherited = total_count - n_inherited) %>%
        select(year, n_inherited, n_not_inherited) %>%
        rename("Year" = "year",
               "No. of inherited" = "n_inherited",
               "No. of people non-inherited" = "n_not_inherited") # cleaner column names

    printed_table <- table_df %>%
        kable(format = format,
              col.names = c("Year", "No. of billionaires who inherited their wealth", "No. of billionaires who have not inherited their wealth"),
              align = c('c', 'c', 'c'),
              caption = caption) %>%
        kable_styling(bootstrap_options = c("striped", "hover"))

    printed_table
}



