##if (warunek){
##  wyrażenie
##} else {} ## else musi być tutaj!!!!


bond <- "Roger Moore"
if (bond == "Pierce Brosnan") {
  print("To jest najlepszy Bond!")
} else{
  print("To nie jest najlepszy Bond")
}



##for (wartość in wektor){ wyrażenie}


aktorzy <- c("Sean Connery", "Robert Downey Jr.", "Bradd Pitt")

for (aktor in aktorzy){
  cat(aktor, "jest świetnym aktorem\n")
}


plec <- c("K","M","K","K","K","M")


##ifelse(warunek, jeślitak, jeślinie)


getwd()
setwd("C://Users//Dominik//Desktop//Dominik//Studia//R")

imods <- read.csv("Dane//imodyfikatory.csv")



umyślnie <- imods[imods$Modyfikator == "Umyślnie",]

xtab <- table(umyślnie$Odpowiedź, umyślnie$Grupa)

prc_xtab <- prop.table(xtab, 2) * 100

barplot(prc_xtab, legend.text = T, col = c("#008080", "darkred"))

prc_xtab


for(i in 1:nrow(imods)){
  print(imods[i,"Płeć"])
}
