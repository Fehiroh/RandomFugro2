
# GPR Rounding, by Aaron Fehir, 




# This script takes the combined csv from the Merge GPR FME workbench, 
# (minus the AtrributeRounder2, which caused crashes) and
# applies the roundings conditionally to prevent memory leaks


library(tidyverse)


# Put filepath to combined csv here
initial_data <- read_csv("C:/Users/afehir/Documents/Projects/New Mexico/csv_afterGPR2/All2.csv")

gpr_round <- function(x) {
  x <- if_else(!is.na(x),  round(x, 2), NaN)
}


rounded_data <- initial_data %>% 
  mutate(`Layer1-Depth` = gpr_round(`Layer1-Depth`),
         `Layer1-Thickness` =  gpr_round(`Layer1-Thickness`),
         `Layer2-Depth` =  gpr_round(`Layer2-Depth`),
         `Layer2-Thickness` =  gpr_round(`Layer2-Thickness`),
         `Layer3-Depth` =  gpr_round(`Layer3-Depth`),
         `Layer3-Thickness` =  gpr_round(`Layer3-Thickness`),
         `Layer4-Depth` =  gpr_round(`Layer4-Depth`),
         `Layer4-Thickness` =  gpr_round(`Layer4-Thickness`))


# nan_conversion <- function(x) {
#   x <- if_else(is.nan(x), NA, x)
# }
# 
# NAd_data <- rounded_data %>% 
#   mutate(`Layer1-Depth` = nan_conversion(`Layer1-Depth`),
#          `Layer1-Thickness` =  nan_conversion(`Layer1-Thickness`),
#          `Layer2-Depth` =  nan_conversion(`Layer2-Depth`),
#          `Layer2-Thickness` =  nan_conversion(`Layer2-Thickness`),
#          `Layer3-Depth` =  nan_conversion(`Layer3-Depth`),
#          `Layer3-Thickness` =  nan_conversion(`Layer3-Thickness`),
#          `Layer4-Depth` =  nan_conversion(`Layer4-Depth`),
#          `Layer4-Thickness` =  nan_conversion(`Layer4-Thickness`))
# 


rounded_data <- as.data.frame(rounded_data)

#put filepath and filename for output here
write_csv(rounded_data, "C:/Users/afehir/Documents/Projects/New Mexico/Rounded_GPR.csv")
