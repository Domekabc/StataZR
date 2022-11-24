#questionable research practices
#pod kątem statystycznym

# HARKing
# p-hacking
# cherrypicking

# Open Science Framework





#zadanie 1
# 50 bobrów, mierzymy temp, liczymy średnią

# μ = 37.00 σ = 3

bobry <- rnorm(50, 37, 3)
mean(bobry)
sd(bobry)

srednie <- replicate(10000, mean(rnorm(50, 37, 3)))

mean(srednie)
sd(srednie)
hist(srednie)


# SE = σ / sqrt(n) #standard error



#zadanie 2
# μ = 76.6 σ = 8.3
# n = 36; X = 81.2; s = 11.3


#Czy mamy podstawy sądzić, że ci studenci nie pochodzą z populacji o średniej μ?


# H0: μ = 76.6
# HA: μ > 76.6

# z CTG (centralnego twierdzenia granicznego) średnia z próby równa populacyjnej, 
# odchylenie z próby równe σ / sqrt(n)

sdZPróby <- 8.3 / sqrt(36)
curve(dnorm(x, 76.6, sdZPróby), from = 70, to = 85)
abline(v = 81.2, col = "red")

obszarKrytyczny <- qnorm(0.99, 76.6, sdZPróby)
abline(v = obszarKrytyczny, lty = 3)

# zatem studenci NIE pochodzą z populacji o średniej μ
# bo odrzucamy hipotezę zerową 

pnorm(81.2, 76.6, 1.38, lower.tail = F)
z_stat <- (81.2 - 76.6) / sdZPróby
pnorm(z_stat, lower.tail = F)
qnorm(0.95)


