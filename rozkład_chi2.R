# Chi-kwadrat

sym <- replicate(10000, {
                          k <- sum(sample(0:1, 100, replace = T))
                          (k - 50) / sqrt(50)
                        }
                )

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


#stopnie swobody: df = r - 1 #r = liczba zmiennych


#-----------------------------------------------------------------------------



#zad
#RASA             Tak     Nie
#Nie-Białe        33      251   284
#Białe            33      508   541
#                 66      759   825

#H0: zmienne są niezależne
#HA: zmienne są niezależne


zaobserwowane <- matrix(c(33, 33, 251, 508), 2, 2)

margin.table(zaobserwowane)
margin.table(zaobserwowane, 1)
margin.table(zaobserwowane, 2)


NB_T <- (66 / 825) * (284 / 825) * 825
B_T <- 66 * 541 / 825
NB_N <- 759 * 284 / 825
B_N <- 759 * 541 / 825

#lepsza metoda
n <- margin.table(zaobserwowane)
rows <- margin.table(zaobserwowane, 1)
cols <- margin.table(zaobserwowane, 2)

oczekiwane <- rbind(cols, cols) * cbind(rows, rows) / n


chi_2 <- sum((zaobserwowane - oczekiwane)^2 / oczekiwane)
qchisq(0.95, 1)
#chi_2 > qchisq --> odrzucamy H0

chisq.test(zaobserwowane)

chisq.test(zaobserwowane, correct = F)

#stopnie swobody                                    !!!!!!!!!!!!!!!!!
#df = (r - 1) * (c - 1) #r i c to liczba kolumn


#zad
#co         sukces    nawrót
#prozac     13        36
#placebo    14        30


wynik <- matrix(c(13, 14, 36, 30), 2, 2)
chisq.test(wynik)

fisher.test(wynik)




#zad
#                             Abused as Adult
#   Number of CAC checked   No      Yes
#                     0     512     54
#                     1     227     37
#                     2     59      15
#                     3-4   18      12

wynik2 <- matrix(c(512, 227, 59, 18, 54, 37, 15, 12), 4, 2)
wynik2
chisq.test(wynik2)


#wizualizacja wyniku testu chi2

library(vcd)
mosaic(wynik2)

assoc(wynik2, shade = T)


