witaj_1 <- function(imię){
  cat("Witaj ", imię, "!\n", sep = "")
}

witaj_1("Khloe")


witaj_2 <- function(imię = "Świecie"){
  cat("Witaj ", imię, "!\n", sep = "")
}

witaj_2()

?factor


witaj_3 <- function(imię = "świecie", przymiotnik = ""){
  if(imię == "świecie"){
    cat("Witaj świecie!\n")
  } else {
    cat("Witaj ", przymiotnik, " ", imię, "!\n", "test", sep = "")
  }
}

witaj_3("Bartoszu","niedobry")


suma_skrajnych <- function(x){
  cat(x[1] + x[length(x)])
  return (x[1] + x[length(x)])
}

test <- suma_skrajnych(c(1,2,3,4))
test



iris_num <- iris[, 1:4]
średnie <- apply(iris_num, 2, mean)

#jest jeszcze lapply - tylko działa do list i sapply - które zwraca wektor


iris_num$suma_wszystkiego <- apply(iris_num,1,sum)

barplot(tapply(iris$Petal.Length, iris$Species, mean))


lapply(iris_num, function(x) mean(x, na.rm = T))

lapply(iris_num, mean, na.rm = T)


