# this function creates summary stats for the duration of songs (i.e. max length, min length, average length)

duration_stats <- function(x){

    summary_stats <- x %>%
        summarize(
            avg_duration = mean(duration),
            max_duration = max(duration),
            min_duration = min(duration),
            max_song = name[which.max(duration)],
            min_song = name[which.min(duration)])

    summary_stats
}
