# this function plots the relationship between calorie deficit/surplus and the quality of sleep

plot_calorie_exercise <- function(df){

    plot_df <- df %>%
        rename("Calorie_balance" = "Daily Caloric Surplus/Deficit",
               "Sleep" = "Sleep Quality",
               "Stress" = "Stress Level",
               "Exercise" = "Physical Activity Level") %>%
        mutate(Sleep = factor(Sleep,
                              levels = c("Poor", "Fair", "Good", "Excellent"))) %>%
        mutate(Exercise = factor(Exercise,
                                 levels = c("Sedentary", "Lightly Active",
                                            "Moderately Active", "Very Active")))

    g <- plot_df %>%
        ggplot(aes(x = Calorie_balance,
                              y = Exercise,
                              size = Stress)) +
        geom_point(aes(color = Stress), alpha = 0.6) +
        scale_size(range = c(3, 10)) +
        scale_color_viridis_c() +
        labs(x = "Calorie Balance",
             y = "Exercise",
             size = "Stress",
             color = "Stress") +
        theme_minimal()

    g

}


