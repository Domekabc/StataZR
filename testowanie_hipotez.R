#zadanie 1
#n = 500
#s = 10 (sukces - zachorowanie na astmę)
#H0: P = 0.014

pbinom(9, 500, 0.014, lower.tail = F) #dystrybuanta od +inf a nie od -inf, dlatego 9 nie 10

binom.test(10, 500, 0.014, alternative = "greater", conf.level = 0.95)


#zadanie2
#n = 66
#s = 7
#H0: P = 0.05

test <- binom.test(7, 66, 0.05, alternative = "greater", conf.level = 0.95)

pbinom(6, 66, 0.05, lower.tail = F)

test$p.value


#zadanie 3
#n = 16
#s = 13
#H0: P = 0.5
#alfa = 0.05

binom.test(13, 16, 0.5, alternative = "greater", conf.level = 0.95)
binom.test(13, 16, 0.5, alternative = "two.sided", conf.level = 0.95)


#zadanie 4
#n = 50
#s = 35
#H0: P = 0.8

#h. lewostronna
binom.test(35, 50, 0.8, alternative = "less") #0.06072 - H0 przyjmujemy

#h. prawostronna
binom.test(35, 50, 0.8, alternative = "g") #0.9692 - H0 przyjmujemy

#h. obustronna
binom.test(35, 50, 0.8, alternative = "t") #0.1087 - H0 przyjmujemy


#obszary odrzucenia
#lewy ogon
qbinom(0.05, 50, 0.8) #35
binom.test(34, 50, 0.8, alternative = "l") #0.0308

#prawy ogon
qbinom(0.95, 50, 0.8) #44
binom.test(45, 50, 0.8, alternative = "g") #0.04803

#obustronny
qbinom(c(0.025, 0.975), 50, 0.8) #34, 45

binom.test(33, 50, 0.8, alternative = "t") #0.0201 
binom.test(46, 50, 0.8, alternative = "t") #0.03294


binom.test(34, 50, 0.8, alternative = "t") #0.0493 - 
      #ale to jest zły wynik, bo kwantyle dla przykładów dyskretnych, etc, blablabla
