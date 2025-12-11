df <- read.csv("diamonds.csv")

library(ggplot2)
> 
  > ggplot(df, aes(x = carat, y = price)) +
  +     geom_point(alpha = 0.4, colour = "blue") +
  +     geom_smooth(method = "lm", se = TRUE, colour = "red") +
  +     labs(
    +         title = "Scatterplot of Diamond Carat vs Price",
    +         x = "Carat (Weight in Carats)",
    +         y = "Price (USD)"
    +     ) +
  +     theme_minimal()

ggsave("scatterplot.png", width = 6, height = 4)

______________________________________________________________________________________________

ggplot(df, aes(x = carat)) +
  +     geom_histogram(aes(y = ..density..), bins = 40, fill = "lightblue", colour = "black") +
  +     stat_function(
    +         fun = dnorm,
    +         args = list(
      +             mean = mean(df$carat, na.rm = TRUE),
      +             sd = sd(df$carat, na.rm = TRUE)
      +         ),
    +         colour = "red",
    +         size = 1
    +     ) +
  +     labs(
    +         title = "Histogram of Diamond Carat with Normal Curve Overlay",
    +         x = "Carat (Weight in Carats)",
    +         y = "Density"
    +     ) +
  +     theme_minimal()

ggsave("histogram.png", width = 6, height = 4)

______________________________________________________________________________________

cor.test(df$carat, df$price, method = "pearson")
