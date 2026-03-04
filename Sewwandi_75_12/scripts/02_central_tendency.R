
library(dplyr)


auto <- read.csv("data/auto_info.csv")

sapply(auto, function(x) sum(is.na(x)))

central_tendency <- data.frame(
  Variable = c("engine_size", "horsepower", "curb_weight", "fuel_efficiency", "price"),
  Mean = c(
    mean(auto$engine_size, na.rm = TRUE),
    mean(auto$horsepower, na.rm = TRUE),
    mean(auto$curb_weight, na.rm = TRUE),
    mean(auto$fuel_efficiency, na.rm = TRUE),
    mean(auto$price, na.rm = TRUE)
  ),
  Median = c(
    median(auto$engine_size, na.rm = TRUE),
    median(auto$horsepower, na.rm = TRUE),
    median(auto$curb_weight, na.rm = TRUE),
    median(auto$fuel_efficiency, na.rm = TRUE),
    median(auto$price, na.rm = TRUE)
  )
)

print(central_tendency)

if(!dir.exists("output")) {
  dir.create("output")
}

write.csv(central_tendency, "output/central_tendency.csv", row.names = FALSE)


