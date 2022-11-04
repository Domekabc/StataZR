boxplot(iris$Sepal.Width)

#vioplot
library(vioplot)
vioplot(iris$Sepal.Width,
        horizontal = T,
        side = "right"
        )


?vioplot

boxplot(len ~ dose, data = ToothGrowth)
vioplot(len ~ dose, data = ToothGrowth)





#dplyr
library(dplyr)


#filter - wybór wierszy z data.frame
mtcars[mtcars$hp > 110, ]
filter(mtcars, hp > 110)
filter(mtcars, hp > 110, cyl == 4)

#select - wybiera kolumny
mtcars[, c("hp", "wt")]
select(mtcars, hp, wt)

#arrange
arrange(mtcars, hp)

#summarise
summarise(mtcars, M_hp = mean(hp))
summarise(mtcars, M_hp = mean(hp), SD_hp = sd(hp))

#mutate/transmute
mutate(mtcars, hp_per_tonne = hp / wt) #ramka plus nowe kolumny
transmute(mtcars, hp_per_tonne = hp / wt) #tylko nowe kolumny



#combo
mtcars %>%
  mutate(hp_per_tonne = hp / wt) %>%
  arrange(hp_per_tonne)


#split -> apply -> combine
mtcars %>%
  group_by(cyl, am) %>%
  summarise(M_hp = mean(hp),
            SD_hp = sd(hp),
            n = n()
            ) %>%
  arrange(desc(M_hp))




ToothGrowth %>%
  group_by(supp, dose) %>%
  summarise(M_len = mean(len),
            SD_len = sd(len),
            n = n()
            ) %>%
  arrange(desc(M_len))




library(tidyr)
data <- data.frame(participant = c(1,2,3,4,5),
                   gender = c("M","M","K","K","M"),
                   pre_coffe = c(3,4,3,5,4),
                   first_coffe = c(5,5,6,4,7),
                   second_coffe = c(7,5,7,6,8)
                   )
data
pivot_longer(data,
             cols = c("pre_coffe", "first_coffe", "second_coffe"),
             names_to = "measurement",
             values_to = "score"
             ) %>%
  group_by(measurement) %>%
  summarise(M = mean(score), SD = sd(score)) %>%
  arrange(M)



data_long <- pivot_longer(data,
             cols = c("pre_coffe", "first_coffe", "second_coffe"),
             names_to = "measurement",
             values_to = "score"
             )

data_long

pivot_wider(data_long,
            id_cols = c("participant", "gender"),
            names_from = "measurement",
            values_from = "score"
            )



