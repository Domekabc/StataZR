set.seed(13)
x <- rnorm(30, 10, 15)
średnia <- mean(x)
odchylenie <- sd(x)

se <- odchylenie / sqrt(30)

dolna_granica <- qnorm(0.025, średnia, se)
górna_granica <- qnorm(0.975, średnia, se)

#weźmy H0: mu = 3
#wtedy odrzucamy H0, bo 3 jest poza przedziałem (dolna_granica, górna_granica)

pnorm(średnia, 3, se, lower.tail = F)
pnorm(średnia, dolna_granica, se, lower.tail = F)

#weźmy H0: mu = 7
#wtedy przyjmujemy H0, bo 7 jest wewntrz przedziału ufności

pnorm(średnia, 7, se, lower.tail = F)

N <- 30
mu <- 165
sigma <- 15
i <- 10000
sum(replicate(i, {
  sample <- rnorm(N, mu, sigma)
  mu >= mean(sample) - qnorm(.975) * sigma/sqrt(N) &
  mu <= mean(sample) + qnorm(.975) * sigma/sqrt(N)
})) / i



#ale prawie nigdy nie znamy odchylenia z populacji

sum(replicate(i, {
  sample <- rnorm(N, mu, sigma)
  mu >= mean(sample) - qnorm(.975) * sd(sample)/sqrt(N) &
    mu <= mean(sample) + qnorm(.975) * sd(sample)/sqrt(N)
})) / i


#a teraz używając testu t
sum(replicate(i, {
  sample <- rnorm(N, mu, sigma)
  mu >= mean(sample) - qt(.975, N-1) * sd(sample)/sqrt(N) &
    mu <= mean(sample) + qt(.975, N-1) * sd(sample)/sqrt(N)
})) / i



#zadanie:
#H0:
mu <- 3.87

N <- 36
średnia <- 4.39
odchylenie <- 2.61

t_stat <- (średnia - mu) / (odchylenie / sqrt(N))
t_stat

pt(t_stat, 35, lower.tail = F)
pt(t_stat, 35, lower.tail = F) * 2 #dla dwustronnego

#przedział ufności

dolna_granica <- średnia + qt(0.025, N-1) * (odchylenie / sqrt(N))
górna_granica <- średnia + qt(0.975, N-1) * (odchylenie / sqrt(N))



#zadanie:
#H0:
mu <- 26.5
wyniki <- c(10, 50, 46, 32, 37, 28, 41, 20, 32, 43)

t.test(wyniki, mu = mu, alternative = "greater")
