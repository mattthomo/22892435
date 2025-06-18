# this function makes it more efficient to read in the dataset for question 4

# # not working and left out due to time. Had the following error:
#Error in `map()`:
# ℹ In index: 1.
# ℹ With name: name.
# Caused by error in `Column_typeString()`:
#     ! could not find function "Column_typeString"

bespoke_read_function <- function(df){

    library(readxl)

    # first read in the excel file which houses the info
    info <- readxl::read_excel("./Question_4/data/Billions/Info_File.xlsx")


    info <- info %>%
        select(Key, "Column Type") %>%
        rename("Column_type" = "Column Type") # for easier matching

    library(readr)
    library(purrr)

    # Convert info to named list of column types
    type_list <- info %>%
        {setNames(as.list(.$Column_type), .$Key)} %>%
        map(~ do.call(paste0("Column_type", .x), list()))

    # Generate col_types specification
    col_specification <- do.call(cols, c(type_list, list(.default = col_guess())))

}