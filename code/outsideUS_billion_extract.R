# this function extracts for only those billionaires from outside of the US

outsideUS_billion_extract <- function(){

    country_df <- billionaires %>%
        filter(location.citizenship != "United States")

    country_df
}
