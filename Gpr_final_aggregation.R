
library(tidyverse)
csvs <- list.files("C:/Users/afehir/Documents/Projects/New Mexico/csv_afterGPR2", full.names = TRUE)

final_csv <- as.data.frame(NULL)


for (i in csvs){
  x <- read.csv(i)
  final_csv <<- rbind(x, final_csv)
}

write_csv(final_csv, "C:/Users/afehir/Documents/Projects/New Mexico/final_csv.csv")