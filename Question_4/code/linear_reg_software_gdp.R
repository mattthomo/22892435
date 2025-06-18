# this function performs a linear regression to assess whether GDP affects the probability of a billionaire being in the software sector

linear_reg_software_gdp <- function(df, caption, format){

    # first want to create binary variable for if the observation is in the software sector or not and want to log GDO
    reg_df <- df %>%
        mutate(is_software = ifelse(company.sector %in% c("Software", "software"), 1, 0)) %>%
        mutate(ln_gdp = log(location.gdp)) %>%
        mutate(ln_gdp = ifelse(ln_gdp == -Inf, NA, ln_gdp))

    model <- lm(is_software ~ ln_gdp + year, data = reg_df, na.action = na.exclude)

    # visualise results

    g <- model %>%
        broom::tidy() %>%
        kable(format = format,
              digits = 3,
              col.names = c("Variable", "Coefficient", "Std. Error", "Statistic", "p-value"),
              caption = caption) %>%
        kable_styling(bootstrap_options = c("striped", "hover"))
    g
}

