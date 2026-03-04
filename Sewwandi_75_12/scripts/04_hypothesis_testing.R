library(dplyr)
library(ggplot2)
library(car)

# Load dataset
auto <- read.csv("data/auto_info.csv")
auto$vehicle_type <- as.factor(auto$vehicle_type)

# ANOVA Model
anova_model <- aov(price ~ vehicle_type, data=auto)

# Check assumptions
shapiro.test(residuals(anova_model))
leveneTest(price ~ vehicle_type, data=auto)

# ANOVA Result
summary(anova_model)

# Tukey HSD post-hoc
tukey_result <- TukeyHSD(anova_model)
print(tukey_result)

# Boxplot with mean points
ggplot(auto, aes(x=vehicle_type, y=price, fill=vehicle_type)) +
  geom_boxplot() +
  stat_summary(fun=mean, geom="point", shape=20, size=3, color="red") +
  labs(title="Vehicle Price by Type with Mean", x="Vehicle Type", y="Price (USD)")
