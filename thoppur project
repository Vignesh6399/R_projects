library(zoo)
library(tidyverse)
library(RSocrata)
library(lubridate)
library(ggplot2)
library(viridis)
library(hrbrthemes)
y<-x_cleaned_
  y%>%
    mutate(Date = floor_date(Date, unit = "week")) %>% 
    count(Date, Head)


y%>% 
  group_by(month = month(Date, label = TRUE))%>%
  count(month, Head)%>% 
  mutate(pct = prop.table(n))

y <- y[-nrow(y),]
na.omit(y)
tail(y)
y%>%
  group_by(month = month(Date, label = TRUE))%>%
  count(month,Head)%>% 
  mutate(pct = prop.table(n))%>%
  ggplot(aes(fill=Head, y=n,x=month)) + 
  geom_bar(position="stack", stat="identity")+
  scale_fill_viridis(discrete = T) +
  ggtitle("Accident with respect to season") +
  labs(
    x = NULL, y = "Number of traffic accidents per Season",
    color = "CASES"
  ) +
  theme_ipsum() +
  xlab("") + theme_minimal()  + theme(plot.title = element_text(hjust = 0.5),text = element_text( size = 12, family = "Open Sans"))
y <- y[-nrow(y),]
y





