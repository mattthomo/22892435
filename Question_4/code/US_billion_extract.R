# this function filters for only those billionaires from the US

US_billion_extract <- function(x){

    country_df <- billionaires %>%
        filter(location.citizenship == x)

    country_df
}


