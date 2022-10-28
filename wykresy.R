# lab 28.10.2022

b1 <- beaver1[beaver1$day == 346,]
b2 <- beaver2[beaver2$day == 307,]
head(b1)

min_value <- min(b1$temp, b2$temp)
max_value <- max(b1$temp, b2$temp)



plot(b1$time,
     b1$temp,
     type = "o",
     ylab = "Temperatura Bobra 1 w ℃",
     xlab = "Godzina pomiaru",
     main = "Temperatura Bobra w czasie",
     sub = "Dzień 346 pomiarów",
     col = "turquoise1",
     ylim = c(min_value, max_value)
     )

points(b2$time,
       b2$temp,
       col = "black",
       type = "o",
       pch = 11,
       )

legend(x = "topleft",
       legend = c("Bóbr 1", "Bóbr 2"),
       col = c("black", "turquoise1"),
       pch = c(1,11)
       )

abline(h = mean(b1$temp),
       col = "turquoise1",
       lty = 6,
       lwd = 2
       )

abline(h = mean(b2$temp),
       col = "black",
       lty = 6,
       lwd = 2
)

student <- read.csv2("dane/student-mat.csv")

student$G3
student$Mjob

barplot(
  tapply(student$G3, student$Mjob, mean)
)

średnie <- tapply(student$G3, student$Mjob, mean)
średnie

barplot(średnie)
text(x = c(0.7, 1.9, 3.1, 4.3, 5.5), y = średnie - 2, labels = round(średnie, 1))

bplot <- barplot(średnie,
                 ylim = c(0, 13))

bplot
