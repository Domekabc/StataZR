# Chi-kwadrat

sym <- replicate(10000, {
  k <- sum(sample(0:1, 100, replace = T))
  (k - 50) / sqrt(50)
})

hist(sym)
hist(sym, freq = F)
curve(dnorm(x, 0, sqrt(1-0.50)), add = T)

sym2 <- replicate(10000, {
  k <- sum(sample(0:1, 100, replace = T))
  ((k - 50) / sqrt(50))^2 + ((100 - k - 50) / sqrt(50))^2
})
hist(sym2)
hist(sym2, freq = F)
curve(dchisq(x, 1), add = T)


###
zaobserwowane <- c(123, 157)
oczekiwane <- c(140, 140)
sum((zaobserwowane-oczekiwane)^2 / oczekiwane)

chi_kw <- sum((zaobserwowane-oczekiwane)^2 / oczekiwane)
qchisq(0.95, 1)
pchisq(chi_kw, 1, lower.tail = F)


bnom() #liczy dokładne prawdopodobieńśtwo, chi liczy aproksymację


###
zaobserwowane2<- c(30, 21, 24)
oczekiwane2 <- c(25, 25, 25)
sum((zaobserwowane2-oczekiwane2)^2 / oczekiwane2)

chi_kw <- sum((zaobserwowane2-oczekiwane2)^2 / oczekiwane2)
qchisq(0.95, 2)
pchisq(chi_kw, 2, lower.tail = F)

chisq.test(c(30, 21, 24))