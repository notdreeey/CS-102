
# Load required libraries
library(dplyr)
library(readr)
library(stringr)


# Read the CSV file
movies_3000 <- read.csv("/cloud/project/Activity 2/imdb_reviews.csv", stringsAsFactors = FALSE)

# Check the structure of the dataframe
str(movies_3000)

# Clean the data
cleaned_data <- movies_3000 %>%
  # Remove NA values
  na.omit() %>%
  # Remove leading and trailing whitespaces from all columns
  mutate_all(str_trim)

# Check the structure of the cleaned dataframe
str(cleaned_data)

# Write the cleaned data to a new CSV file
write.csv(cleaned_data, "cleaned_movies.csv", row.names = FALSE)