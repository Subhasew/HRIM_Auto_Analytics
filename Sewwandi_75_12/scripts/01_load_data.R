library(ggplot2)
library(dplyr)

auto <- read.csv("data/auto_info.csv")
str(auto)
summary(auto)

shapiro.test(auto$price)
shapiro.test(auto$engine_size)
shapiro.test(auto$horsepower)
shapiro.test(auto$curb_weight)
shapiro.test(auto$age)

cor.test(auto$price, auto$engine_size, method = "spearman")
cor.test(auto$price, auto$horsepower, method = "spearman")
cor.test(auto$price, auto$curb_weight, method = "spearman")
cor.test(auto$price, auto$age, method = "spearman", exact = FALSE)

ggplot(auto, aes(engine_size, price)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_minimal() +
  ggtitle("Price vs Engine Size")

ggplot(auto, aes(horsepower, price)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_minimal() +
  ggtitle("Price vs Horsepower")

ggplot(auto, aes(curb_weight, price)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_minimal() +
  ggtitle("Price vs Curb Weight")

ggplot(auto, aes(age, price)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_minimal() +
  ggtitle("Price vs Age")

price_model <- lm(price ~ engine_size + horsepower + curb_weight + age, data = auto)
summary(price_model)

price ~ engine_size + horsepower + curb_weight + fuel_efficiency + age
