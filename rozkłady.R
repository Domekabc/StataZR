#rozkłady
#d... np dnrom - gęstość rozkładu prawdopodobieństwa

#p... np pnorm - dystrybuanta
#q... np qnorm - odwrotna dystrybuanta (p^-1)

#r... np rnorm - losowanie liczb



seq(-4,4,length = 100)
śr <- 100
odch <- 15

x <- seq(-4,4,length = 100) * odch + śr
y <- dnorm(x, śr, odch)     #dnorm


plot(x,y, type = "l")


abline( v = 80, lty = 2)
pnorm(80, śr, odch)         #pnorm

#większe niż
1 - pnorm(115, śr, odch)
pnorm(115, śr, odch, lower.tail = F)     #pnorm
#to samo zapisane w inny sposób


abline(v = qnorm(0.8, śr, odch), lty = 4)

qnorm(0.1, 150, 30)









