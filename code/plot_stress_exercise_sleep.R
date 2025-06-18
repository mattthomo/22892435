# this function creates a plot visualising the relationship between exercise and sleep on stress respectively

plot_stress_exercise_sleep <- function(df){

# must first set factor levels and put in correct order

df <- df %>%
    rename("Exercise" = "Physical Activity Level",
           "Sleep" = "Sleep Quality",
           "Stress" = "Stress Level") %>%
    mutate(Exercise = factor(Exercise,
                          levels = c("Sedentary", "Lightly Active",
                                     "Moderately Active", "Very Active")),
        Sleep = factor(Sleep,
                       levels = c("Poor", "Fair", "Good", "Excellent")))

# create heatmap
g <- ggplot(df, aes(x = Exercise, y = Sleep, fill = Stress)) +
    geom_tile(color = "white",
              linewidth = 0.5) +
   # geom_text(aes(label = Stress), color = "black", size = 4) +
    scale_fill_gradient2(
        low = "darkgreen",
        mid = "white",
        high = "red",
        midpoint = 5,
        limits = c(1, 10)) +
    labs(x = "Exercise Level (Increasing Intensity →)",
        y = "Sleep Quality (Improving →)",
        fill = "Stress Level\n(1-10)"
    ) +
    theme_minimal() +
    theme(
        axis.text.x = element_text(angle = 45, hjust = 1),
        panel.grid = element_blank()
    )

g

}
