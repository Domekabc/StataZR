#zad

se <- 1.5 #tu powinien być wzór, ale się spóźniłem; ale znamy to i tak z dupy

roznice_h0 <- replicate(10000, {
  x1 <- rnorm(20, 0, 5)
  x2 <- rnorm(20, 0, 5)

  (mean(x1) - mean(x2)) / se
})

hist(roznice_h0,
     col = adjustcolor("red", alpha.f = 0.5),
     xlim = c(-5, 11)
     )


roznice_ha <- replicate(10000, {
  x1 <- rnorm(20, mean = 6, 5)
  x2 <- rnorm(20, mean = 0, 5)
  
  (mean(x1) - mean(x2)) / se
})

hist(roznice_ha,
     col = adjustcolor("blue", 0.5),
     xlim = c(-5, 11),
     add = T
     )

###################################

roznice_h0 <- replicate(10000, {
  x1 <- rnorm(20, 0, 5)
  x2 <- rnorm(20, 0, 5)
  
  sample_se <- sqrt(var(x1) / 20 + var(x2) / 20)
  (mean(x1) - mean(x2)) / sample_se
})

hist(roznice_h0,
     col = adjustcolor("red", alpha.f = 0.5),
     xlim = c(-5, 11)
)


roznice_ha <- replicate(10000, {
  x1 <- rnorm(20, mean = 6, 5)
  x2 <- rnorm(20, mean = 0, 5)
  
  sample_se <- sqrt(var(x1) / 20 + var(x2) / 20)
  (mean(x1) - mean(x2)) / sample_se
})

hist(roznice_ha,
     col = adjustcolor("blue", 0.5),
     xlim = c(-5, 11),
     add = T
)

cr <- qt(0.95, 38)
pt(cr, 38, 6/se, lower.tail = F)
pt(cr, 38, 6 / 5 * sqrt(20/2), lower.tail = F) #jakby se było dobre, to te 2 byłyby równe

#generalnie jeśli patrzymy na różnicę w odchyleniach standardowych, 
#a nie absolutna, to nie musimy znać odchylenia w populacji żeby znać moc testu



#####################################

#zadanie
n <- 51
cr <- qt(0.95, 2*n-2)
pt(cr, 2*n-2, 0.5 * sqrt(n/2), lower.tail = F)

power.t.test(delta = 0.5,
             power = 0.8,
             type = "two.sample",
             alternative = "one.sided"
             )
