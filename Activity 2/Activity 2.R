#Install and load required packages
install.packages("rvest")
install.packages("httr")
install.packages("polite")

library(rvest)
library(httr)
library(polite)

# Set up polite scraper
polite::use_manners(save_as = 'polite_scrape.R')

# Define the URL template
url_template <- 'https://www.imdb.com/title/tt2024544/reviews?ref_=tt_urv'

# Initialize vectors
Usernames <- character(0)
ReviewerDates <- character(0)
ReviewerContents <- character(0)
Ratings <- character(0)

# Scrape data from multiple pages
for (page in 1:12) {  # Assuming there are 12 pages, adjust as needed
  # Create a session for each page
  session <- bow(sprintf(url_template, page), user_agent = "Educational")
  
  # Scrape data
  Usernames <- c(Usernames, scrape(session) %>% html_nodes('span.display-name-link') %>% html_text())
  ReviewerDates <- c(ReviewerDates, scrape(session) %>% html_nodes('span.review-date') %>% html_text())
  ReviewerContents <- c(ReviewerContents, scrape(session) %>% html_nodes('div.text.show-more__control') %>% html_text())
  Ratings <- c(Ratings, scrape(session) %>% html_nodes('span.rating-other-user-rating') %>% html_text())
}

# Create a data frame
DataFrame <- data.frame(
  Usernames = Usernames[1:300],
  Reviewer_Date = ReviewerDates[1:300],
  Reviewer_Content = ReviewerContents[1:300],
  Rating = Ratings[1:300]
)

# Save as CSV
write.csv(DataFrame, file = "imdb_reviews.csv", row.names = FALSE)

# Print the data frame
print(DataFrame)
