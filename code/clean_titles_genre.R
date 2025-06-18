# this function cleans the genre column of `Titles` and makes it match the genre entries in the `Movie_info` dataframe

clean_titles_genre <- function(Titles_clean){

    Titles_clean1 <- Titles_clean %>%
        mutate(genres_clean = str_to_title(genres_clean)) %>%
        # make the columns match as best as we can
        mutate(genres_clean = case_when(genres_clean == "Documentation" ~ "Documentaries",
                                        genres_clean == "Drama" ~ "Dramas",
                                        genres_clean == "Fantasy" ~ "Sci-Fi & Fantasy",
                                        genres_clean == "Romance" ~ "Romantic Movies",
                                        genres_clean == "Comedy" ~ "Comedies",
                                        genres_clean == "Horror" ~ "Horror Movies",
                                        genres_clean == "Thriller" ~ "Thrillers",
                                        genres_clean == "Music" ~ "Music & Musicals",
                                        genres_clean == "Family" ~ "Children & Family Movies",
                                        genres_clean == "Action" ~ "Action & Adventure",
                                        genres_clean == "Animation" ~ "Anime Features",
                                        genres_clean == "Sport" ~ "Sports Movies",
                                        genres_clean == "Scifi" ~ "Sci-Fi & Fantasy",
                                        TRUE ~ genres_clean))
    Titles_clean1
}
