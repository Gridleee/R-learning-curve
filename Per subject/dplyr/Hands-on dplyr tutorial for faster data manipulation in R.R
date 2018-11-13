library("readr", lib.loc="~/R/R-3.5.1/library")
library("eurostat", lib.loc="~/R/R-3.5.1/library")

query <- search_eurostat("road", type = "table")
query <- query[3:3, 1:2]
#title: Goods transport by road
#code: ttr00005

dat <- get_eurostat(id="ttr00005", time_format = "num")
dat <- label_eurostat(dat)

library("plyr", lib.loc="~/R/R-3.5.1/library")
library("dplyr", lib.loc="~/R/R-3.5.1/library")

goods <- tbl_df(dat)

print(goods, n=20)

data.frame(goods)

##filter
#base R
goods[goods$geo == "Estonia" & goods$values <= 10000, ]

#dplyr
filter(goods, geo == "Estonia" , values <= 10000,  )
filter(goods, geo == "Estonia"| geo == "Austria",)

##select
#base R
goods[, c("unit", "geo", "time", "values")]

#dplyr
select(goods, unit, geo, time, values, )
select(goods, contains("geo"), contains("values"), )

## chaining or pipelining
#base R
filter(select(goods, geo, values), values < 1000)

#chaining
goods %>%
  select(geo, values) %>%
  filter(values < 1000)

x1 <- 1:5; x2 <- 2:6
sqrt(sum((x1-x2)^2))
(x1-x2)^2 %>% sum() %>% sqrt()

##arange
#base R
goods[order(goods$values, decreasing = TRUE), c("geo", "values")]

#dplyr
goods %>%
  select(geo, values) %>%
  arrange(desc(values))

##mutate
#base R
goods$some <- goods$values / 5
goods[, c("values", "some")]

#dplyr (prints the new variable but does not store it)
goods %>%
  select(values) %>%
  mutate(some = values/5)

##sumarize & group_by
#