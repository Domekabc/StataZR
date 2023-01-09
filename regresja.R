d1 <- read.table("dane/Fig9-1a.dat", header = T)
d2 <- read.table("dane/Fig9-1b.dat", header = T)
d3 <- read.table("dane/Fig9-1c.dat", header = T)

head(d3)


plot(InfMort ~ Physicians, data = d1)

#model liniowy
fit <- lm(InfMort ~ Physicians, data = d1)

abline(fit)
summary(fit)


#centrowanie osi x
d1$Physicians_C <- d1$Physicians - mean(d1$Physicians)

fit_c <- lm(InfMort ~ Physicians_C, data = d1)

summary(fit_c)


sum((d1$InfMort - mean(d1$InfMort)) * d1$Physicians_C) / (nrow(d1) - 1)

cov(d1$Physicians, d1$InfMort)

cor(d1$Physicians, d1$InfMort)