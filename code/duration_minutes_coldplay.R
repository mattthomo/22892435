# this code converts song-durations from milliseconds to seconds for Coldplay

duration_minutes_coldplay <- function(coldplay){

    duration_minutes <- coldplay %>%
        mutate(duration = duration / 60)

    duration_minutes
}
