dane <- replicate({obserwacje <- rnorm(100, 10, 5)

poziomy <- c("b.mało", "mało", "średnio", "dużo", "b.dużo")
czynnik <- rep(poziomy, 20)


mse <- mean(tapply(obserwacje, czynnik, var))


ms_treat <- var(tapply(obserwacje, czynnik, mean)) * 20

f_stat <- ms_treat / mse
pf(f_stat, lower.tail = F, df1 = 5 - 1, 100 - 5)
#df1 - liczba grup - 1
#df2 - liczba obserwacji - liczba grup
}, n = 10000)
?replicate
dane <- dane[dane >0.975 | dane < 0.025]



obserwacje <- rnorm(100, 10, 5)

poziomy <- c("b.mało", "mało", "średnio", "dużo", "b.dużo")
czynnik <- rep(poziomy, 20)


mse <- mean(tapply(obserwacje, czynnik, var))


ms_treat <- var(tapply(obserwacje, czynnik, mean)) * 20

f_stat <- ms_treat / mse
pf(f_stat, lower.tail = F, df1 = 5 - 1, 100 - 5)


fit <- aov(obserwacje ~ czynnik)
summary(fit)

#jest jeszcze oneway.test(), ale stosować mamy aov






PlantGrowth

library(ggplot2)
qplot(data = PlantGrowth, x = group, y = weight, geom = "boxplot")


{ mse <- mean(tapply(PlantGrowth$weight, PlantGrowth$group, var))
  
  
  ms_treat <- var(tapply(PlantGrowth$weight, PlantGrowth$group, mean)) * 10
  
  f_stat <- ms_treat / mse
  pf(f_stat, lower.tail = F, df1 = 3 - 1, 30 - 3)
}

fit2 <- aov(weight ~ group, data = PlantGrowth)
summary(fit2)



#post-hoc
TukeyHSD(fit2)
plot(TukeyHSD(fit2))

library(DescTools)

EtaSq(fit2)
