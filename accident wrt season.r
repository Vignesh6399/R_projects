'Accidents with respect to Season'

library(zoo)
library(tidyverse)
library(RSocrata)
library(lubridate)
library(viridis)
library(ggthemes)
library(hrbrthemes)

y$yq<- as.yearqtr(as.yearmon(y$Date, "%m/%d/%Y") + 1/12)

y$Season <- factor(format(yq, "%q"), levels = 1:4, 
                      labels = c("winter", "spring", "summer", "fall"))
yn<-y%>% 
  group_by(month = month(Date, label = TRUE))
  yn%>%
    na.omit(yn)%>%
  count(Head,Season)%>%
  ggplot(aes(fill=Head, y=n, x=Season)) + 
  geom_bar(position="stack", stat="identity") +
  scale_fill_viridis(discrete = T) +
  ggtitle("Accident with respect to season") +
  labs(
    x = NULL, y = "Number of traffic accidents per Season",
    color = "CASES"
  ) +
  theme_ipsum_ps() +
  xlab("") + theme_minimal()  + theme(plot.title = element_text(hjust = 0.5),text = element_text( size = 12, family = "Open Sans"))




