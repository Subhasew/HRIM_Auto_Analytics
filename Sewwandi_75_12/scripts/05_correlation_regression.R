# ===============================
# 05_correlation_regression.R
# Correlation & Regression Analysis
# ===============================

# 1️⃣ Load necessary libraries
library(ggplot2)
library(dplyr)

# 2️⃣ Load dataset
auto <- read.csv("data/auto_info.csv")

# 3️⃣ Scatter Plot 1: Engine Size vs Horsepower
p1 <- ggplot(auto, aes(x = engine_size, y = horsepower)) +
  geom_point(color = 'blue') +
  geom_smooth(method = 'lm', se = TRUE, color = 'red') +
  ggtitle("Engine Size vs Horsepower") +
  xlab("Engine Size (L)") +
  ylab("Horsepower (hp)") +
  theme_minimal()
print(p1)

# 4️⃣ Scatter Plot 2: Engine Size vs Fuel Efficiency
p2 <- ggplot(auto, aes(x = engine_size, y = fuel_efficiency)) +
  geom_point(color = 'green') +
  geom_smooth(method = 'lm', se = TRUE, color = 'red') +
  ggtitle("Engine Size vs Fuel Efficiency") +
  xlab("Engine Size (L)") +
  ylab("Fuel Efficiency (mpg)") +
  theme_minimal()
print(p2)

# 5️⃣ Multiple Linear Regression: Price Prediction
model <- lm(
  price ~ engine_size + horsepower + curb_weight + fuel_efficiency + age,
  data = auto
)

# 6️⃣ Regression Summary
summary(model)

# 7️⃣ Predicted vs Actual Price Plot
auto$predicted_price <- predict(model, auto)
p3 <- ggplot(auto, aes(x = predicted_price, y = price)) +
  geom_point(color = 'purple') +
  geom_abline(slope = 1, intercept = 0, linetype = 'dashed', color = 'red') +
  ggtitle("Actual vs Predicted Price") +
  xlab("Predicted Price (USD)") +
  ylab("Actual Price (USD)") +
  theme_minimal()
print(p3)

# 8️⃣ Save plots as PNG files
if(!dir.exists("outputs/plots")) dir.create("outputs/plots", recursive = TRUE)
ggsave("outputs/plots/engine_hp_plot.png", p1)
ggsave("outputs/plots/engine_fuel_plot.png", p2)
ggsave("outputs/plots/predicted_price_plot.png", p3)

# ===============================
# ✅ Script Completed
# ===============================

