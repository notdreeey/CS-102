movie_1 <- read.csv("/cloud/project/Activity 3/movie1.csv")
movie_2 <- read.csv("/cloud/project/Activity 3//movie2.csv")
movie_3 <- read.csv("/cloud/project/Activity 3/movie3.csv")
movie_4 <- read.csv("/cloud/project/Activity 3/movie4.csv")
movie_5 <- read.csv("/cloud/project/Activity 3/movie5.csv")
movie_6 <- read.csv("/cloud/project/Activity 3/movie6.csv")
movie_7 <- read.csv("/cloud/project/Activity 3/movie7.csv")
movie_8 <- read.csv("/cloud/project/Activity 3/movie8.csv")
movie_9 <- read.csv("/cloud/project/Activity 3/movie9.csv")
movie_10 <- read.csv("/cloud/project/Activity 3/movie10.csv")

merged_movies <- rbind(movie_1,movie_2,movie_3,movie_4,movie_5,movie_6,movie_7,movie_8,movie_9,movie_10)


write.csv(merged_movies, "Mergedmovies.csv", row.names = FALSE)