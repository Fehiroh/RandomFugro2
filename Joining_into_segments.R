
# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")
# 
# BiocManager::install("IRanges")

#libraries
library(tidyverse)
library(fuzzyjoin)
library(IRanges)



# import
gpr_data <- read_csv("C:/Users/afehir/Documents/Projects/Toronto/GPR/Results/combined_GPR_results_19.csv")

og_segements_table <- read_csv("C:/Users/afehir/Documents/Projects/Toronto/GPR/Segments_table_to_join_to.csv") 

gpr_data <- gpr_data %>% 
  mutate(BeginDistanceStamp = DistanceStamp, 
         EndDistanceStamp = DistanceStamp)

combination <- interval_join(gpr_data, og_segements_table, by = c("BeginDistanceStamp", "EndDistanceStamp"), mode = "right")




