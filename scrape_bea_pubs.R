# Load required libraries
library(rvest)
library(dplyr)
library(readr)

# Assuming you have the HTML content in a variable called 'html_content'
# html_content <- read_html("path/to/your/html/file.html")
# Or if you had permission and ability to scrape directly:
html_content <- read_html("https://www.bea.gov/research/special-sworn-researcher-program/papers")

# Parse the table
table_data <- html_content %>%
  html_node("table.national-experts") %>%
  html_table()

# Properly assign column names
column_names <- table_data[1,]
final_data <- table_data[2:nrow(table_data),]
names(final_data) <- as.vector(column_names)

# Write to CSV
write_csv(final_data, "output_table.csv")

