dane <- read.table("dane/tab15-1.dat", header = T, row.names = 2)
dane <- dane[,-1]


plot(SATcombined ~ Expend, data = dane)

library(ggplot2)

ggplot(data = dane) + geom_point(aes(x = Expend, y = SATcombined, size = PctSAT))


fit <- lm(SATcombined ~ Expend, data = dane)
summary(fit)

fit2 <- lm(SATcombined ~ Expend + LogPctSAT, data = dane)
summary(fit2)


fit_sat <- lm(formula = SATcombined ~ LogPctSAT, data = dane)
plot(SATcombined ~ LogPctSAT, data = dane)
abline(fit_sat)
resid_sat <- fit_sat$residuals

fit_expend <- lm(Expend ~ LogPctSAT, data = dane)
plot(Expend ~ LogPctSAT, data = dane)
abline(fit_expend)
resid_expend <- fit_expend$residuals

fit_resid <- lm(resid_sat ~ resid_expend)
summary(fit_resid)



predictor <- 11.129 * dane$Expend + -78.203 * dane$LogPctSAT + 1147.1

summary(lm(dane$SATcombined ~ predictor))



# założenia regresji liniowej
# związek jest liniowy
# równość wariancji
# porządna skala dla zmiennej przewidywanej
# normalność

plot(fit2)

