#A.
warpbreaks

# 1. 
numeric_cols <- sapply(warpbreaks, is.numeric)
integer_cols <- sapply(warpbreaks, is.integer)
numeric_or_integer_cols <- names(warpbreaks)[numeric_cols | integer_cols]
numeric_or_integer_cols

# 2. 
warpbreaks[, numeric_or_integer_cols] <- lapply(warpbreaks[, numeric_or_integer_cols], as.integer)

# 3. example code that creates error:
sum(warpbreaks$tension)

# Error message:
#Error in Summary.factor(c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L,  : 
#‘sum’ not meaningful for factors

# This error message is saying that you can't calculate the "max" (maximum) 
# value for a categorical variable (factor). 
# are not numbers, so it doesn't make sense to find the 
# sum value among them.


#B.
# 1. 
example_data <- readLines("/cloud/project/Practical exam/exampleFile.txt")

# 2. 
comments <- example_data[grepl("^//", example_data)]
data_lines <- example_data[!grepl("^//", example_data)]

# 3. 
date_line <- comments[1]
date <- gsub("^// date creatrd : ", "", date_line)

# 4. 
# a. 
data_fields <- strsplit(data_lines, ";")

# b. 
max_fields <- max(sapply(data_fields, length))
data_fields <- lapply(data_fields, function(x) { 
  if(length(x) < max_fields) c(x, rep(NA, max_fields - length(x)))
  else x
})

# c. 
data_matrix <- matrix(unlist(data_fields), ncol = max_fields, byrow = TRUE)

# d. 
field_names <- gsub("^// field [0-9]+: ", "", comments[2:4])
colnames(data_matrix) <- field_names
print(data_matrix)
