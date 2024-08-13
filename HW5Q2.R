library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)

load('/Users/akk/Library/CloudStorage/GoogleDrive-kateley@umich.edu/.shortcut-targets-by-id/1ehWwunuAo7CE1Vk2JYkUnQMmxh5pph3C/DATA/house_prices.rda')

house_prices%>%gather(key=measure, value=value, -c(house_price_index, date, state))->house_reshaped

ggplot(house_reshaped, aes(x = date, y = value, color = measure)) +
  geom_line() +
  facet_wrap(~ state) +
  scale_x_continuous(
    breaks = ymd(c("1980-01-01", "2000-01-01", "2020-01-01")), 
    labels = c("80", "00", "20"))+
  labs(title = "House Price Index and Unemployment Percentage Trends by State",
       x = "Year",
       y = "Value",
       color = "Measure") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


 


