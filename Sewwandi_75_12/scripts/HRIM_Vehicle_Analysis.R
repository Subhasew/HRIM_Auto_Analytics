
install.packages("dplyr")  
install.packages("ggplot2") 
install.packages("car")     

library(dplyr)
library(ggplot2)
library(car)


setwd("C:/Users/Madhushika/Desktop/HRIM_Auto_Analytics")
auto <- read.csv("data/auto_info.csv")

head(auto)
View(auto) 

summary(auto$price)


auto_summary <- auto %>%
  group_by(vehicle_type) %>%
  summarise(
    mean_price = mean(price),
    median_price = median(price),
    sd_price = sd(price),
    n = n()
  )
print(auto_summary)


ggplot(auto, aes(x=vehicle_type, y=price, fill=vehicle_type)) +
  geom_boxplot() +
  labs(title="Vehicle Price Distribution by Type", x="Vehicle Type", y="Price (USD)") +
  theme_minimal()

ggplot(auto_summary, aes(x=vehicle_type, y=mean_price, fill=vehicle_type)) +
  geom_bar(stat="identity") +
  labs(title="Average Vehicle Price by Type", x="Vehicle Type", y="Mean Price (USD)") +
  theme_minimal()


anova_model <- aov(price ~ vehicle_type, data = auto)


shapiro.test(residuals(anova_model))

leveneTest(price ~ vehicle_type, data = auto)


anova_result <- summary(anova_model)
print(anova_result)

tukey_result <- TukeyHSD(anova_model)
print(tukey_result)


ggplot(auto, aes(x=vehicle_type, y=price, fill=vehicle_type)) +
  geom_boxplot() +
  stat_summary(fun=mean, geom="point", shape=20, size=3, color="red") +
  labs(title="Vehicle Price by Type with Mean", x="Vehicle Type", y="Price (USD)") +
  theme_minimal()

# Optional: save plot as PNG
ggsave("outputs/vehicle_price_boxplot.png", width=8, height=6)
