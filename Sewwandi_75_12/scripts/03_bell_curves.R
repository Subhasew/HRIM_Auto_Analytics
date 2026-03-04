p1 <- ggplot(auto, aes(x = engine_size)) +
  geom_histogram(aes(y = ..density..),
                 bins = 30,
                 fill = "lightblue",
                 color = "black") +
  geom_density(color = "red", linewidth = 1) +
  ggtitle("Bell Curve of Engine Size") +
  xlab("Engine Size (Liters)") +
  ylab("Density") +
  theme_minimal()

print(p1)

ggsave("outputs/bell_curves/engine_size_curve.png",
       plot = p1, width = 6, height = 4)

p2 <- ggplot(auto, aes(x = horsepower)) +
  geom_histogram(aes(y = ..density..),
                 bins = 30,
                 fill = "lightblue",
                 color = "black") +
  geom_density(color = "red", linewidth = 1) +
  ggtitle("Bell Curve of Horsepower") +
  xlab("Horsepower (hp)") +
  ylab("Density") +
  theme_minimal()

print(p2)

ggsave("outputs/bell_curves/horsepower_curve.png",
       plot = p2, width = 6, height = 4)

p3 <- ggplot(auto, aes(x = curb_weight)) +
  geom_histogram(aes(y = ..density..),
                 bins = 30,
                 fill = "lightblue",
                 color = "black") +
  geom_density(color = "red", linewidth = 1) +
  ggtitle("Bell Curve of Curb Weight") +
  xlab("Curb Weight (lbs)") +
  ylab("Density") +
  theme_minimal()

print(p3)

ggsave("outputs/bell_curves/curb_weight_curve.png",
       plot = p3, width = 6, height = 4)

p4 <- ggplot(auto, aes(x = price)) +
  geom_histogram(aes(y = ..density..),
                 bins = 30,
                 fill = "lightblue",
                 color = "black") +
  geom_density(color = "red", linewidth = 1) +
  ggtitle("Bell Curve of Vehicle Price") +
  xlab("Price (USD)") +
  ylab("Density") +
  theme_minimal()

print(p4)

ggsave("outputs/bell_curves/price_curve.png",
       plot = p4, width = 6, height = 4)
