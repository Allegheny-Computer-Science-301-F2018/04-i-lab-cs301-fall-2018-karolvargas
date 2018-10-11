# Name:Karol Vargas     
# Date:10/10/18

# Run the below only if the library is not already installed.
# install.packages(dslabs)

library(dslabs)
library(dplyr)
library(tidyverse)
data(us_contagious_diseases)

#Question 1.

data <- filter(us_contagious_diseases, disease == "Measles", state != "Alaska", state != "Hawaii") 

dat <- mutate(data, per100000rate = ((count*100000)/population)*((weeks_reporting)/52))

first part shows us only the measles and using the notequals sign excludes Alaska and Hawaii from the list. The second adds the per 100,000 rate at the end of the data

#Question 2.
californiaData <- filter(us_contagious_diseases, disease == "Measles", state == "California")

ggplot(data = californiaData) +
  geom_point(mapping = aes(x = year, y = count )) + geom_vline(xintercept = 1965)

The first part only shows california since we used the double equals signs. and the second part adds an x intercept on the graph we made at 1965 and sets the x and y intercepts with labels. 


#Question 3.

> dat_caliFocus$yearBlock[dat_caliFocus$year  <= 1969] <- "1960’s"
> dat_caliFocus$yearBlock[dat_caliFocus$year  <= 1959] <- "1950’s"
> dat_caliFocus$yearBlock[dat_caliFocus$year  <= 1949] <- "na"
> dat_caliFocus$yearBlock[dat_caliFocus$year  <= 1979] <- "1970’s"
> dat_caliFocus$yearBlock[dat_caliFocus$year  <= 1969] <- "1960’s"
> dat_caliFocus$yearBlock[dat_caliFocus$year  <= 1959] <- "1950’s"
> dat_caliFocus$yearBlock[dat_caliFocus$year  > 1979] <- "Greater than 1979"
> dat_caliFocus$yearBlock[dat_caliFocus$year  < 1950] <- "Before 1950"
> ggplot(data = dat_caliFocus ) + geom_bar(mapping = aes(x = state,y = sqrt(count), fill = yearBlock), 
position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))


we used greater than and equal to functions to apply to all the years we wanted a focus in. we also used the greater than and less than
functions to describe the data we did not want to look at. and the final piece of code implements the graphing functions


#Question 4.
> data$yearBlock[data$year  > 1979] <- "After 1979"
> View(data)
> View(data)
> data$yearBlock[data$year  <= 1979] <- "1970’s"
> data$yearBlock[data$year  <= 1969] <- "1960’s"
> data$yearBlock[data$year  <= 1959] <- "1950’s"
> data$yearBlock[data$year  < 1950] <- "Before 1950"
> ggplot(data = data ) + geom_bar(mapping = aes(x = state,y = sqrt(count), fill = yearBlock), 
position = "dodge", stat = "identity") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))

The pattern in the NA group seems to hold true to everything that we saw in just california so after vaccines were 
made there is a spike in drops for diseases and the years outside of the target range seem to be the highest because after 1979
there were vaccines developed.

#Question 5.

ggplot(data, aes(x = state, y = sqrt(count))) +
  +     geom_tile(aes(fill = yearBlock), colour = "red") + theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust=-0.01))


code adds layers to bargraph to make it much easier to see trends in the data


#Question 6.

https://www.sfautismsociety.org/blog

listed above is a plot of autism yearly data and this goes against the data we see in our graph as there may be a drop in some diseases with
vaccines there is a clear rise in autism cases with these vaccines. So it is possible that there may be some correlation. 




