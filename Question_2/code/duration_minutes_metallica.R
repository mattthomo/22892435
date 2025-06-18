# this code converts song-durations from milliseconds to seconds for Metallica

duration_minutes_metallica <- function(metallica){

    duration_minutes <- metallica %>%
        mutate(duration = (duration_ms / 1000) / 60)

    duration_minutes
}
