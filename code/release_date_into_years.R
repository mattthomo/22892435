# this function wants to convert the release dates into only a year value

release_date_into_years <- function(df){

    df_years <- df %>%
        mutate(release_date = as.numeric(format(as.Date(release_date), "%Y")))

    df_years
}


