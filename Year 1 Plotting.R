# Trying plotting a number of variables

library(ggplot2)
g <- ggplot(Year1_clients)
# gender plot

new_g <- g + geom_bar(aes(x=Year1_clients$ClientGender, colour=Year1_clients$ClientGender, fill=Year1_clients$ClientGender)) + ggtitle("Year 1 clients") + xlab("Gender")
new_g + theme(legend.title=element_blank())

# correlation example
Gender <- as.numeric(Year1_clients$ClientGender)
HH <- as.numeric(Year1_clients$ClientHH)

#cor(Gender, HH)

# Scatterplot example - gender and employment
Cl_age <- Year1_clients$ClientAge
Cl_job <- Year1_clients$ClientOccupation

#ggplot(Year1_clients, aes(x=Cl_age, y=Cl_job)) +
#  geom_point(shape=1)      # Use hollow circles
