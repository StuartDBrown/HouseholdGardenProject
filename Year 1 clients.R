# USAID "Deploying Vegetable Seed Kits to Tackle Malnutrition in Cambodia
# First part look at the Client Characterization data for Year 1

setwd("C:/Users/stuart.brown/OneDrive - WVC/World Vegetable Center/HG - Cambodia/Project reporting/Data Analysis/Client characterization/Data analysis")
getwd()

Year1_clients <- read.csv("Client data 8112016.csv", na.strings = c(""))

head(Year1_clients,1)
str(Year1_clients)
summary(Year1_clients)

# Remove columns that are not of interest to the analysis
Year1_clients$Repeat.no. <- NULL
Year1_clients$Instance <- NULL
Year1_clients$X..GEOCODE...Geo.Code <- NULL
Year1_clients$NA. <- NULL
Year1_clients$X..GEOELE...Elevation <-NULL
Year1_clients$X8140104.Child.1.Name <- NULL
Year1_clients$X8130044.Child.5.Name <- NULL
Year1_clients$X3180096.Child.4.Name <- NULL
Year1_clients$X6150031.Child.3.Name <- NULL
Year1_clients$X3180095.Child.2.Name <- NULL
Year1_clients$Duration <- NULL
Year1_clients$X9160012.Name <- NULL
Year1_clients$X6160248.Do.you.have.a.phone. <- NULL
Year1_clients$X40146.Location <- NULL
Year1_clients$X7180280.Head.of.household.name <- NULL
Year1_clients$X <- NULL

# Check the column names
names(Year1_clients)

# Rename columns to appropriate values for analysis
library(plyr)
Year1_clients <-  plyr::rename(Year1_clients, c("Device.identifier"="DeviceID", "Submission.Date"="SubmitDate", "X4120036.Select.your.NGO.Organisation"="NGO"))
Year1_clients <-  plyr::rename(Year1_clients, c("X3140255.Gender"="ClientGender", "X6190013.Age"="ClientAge", "X6190014.Phone.Number"="ClientPhone"))
Year1_clients <-  plyr::rename(Year1_clients, c("X3100420.Client.main.occupation"="ClientOccupation", "X5080371.Is.the.client.a.CBT.for.the.home.garden.project."="CBT", "X4130112.Where.is.the.client.learning.about.home.gardens."="LearnHG"))                     
Year1_clients <-  plyr::rename(Year1_clients, c("X9140371.Does.the.client.have.a.disability..For.example..a.physical.disability."="ClientDisabled"))
Year1_clients <-  plyr::rename(Year1_clients, c("X8170437.Is.the.client.the.head.of.the.household."="ClientHH", "X9140361.Head.of.household.age"="HHAge"))                       
Year1_clients <-  plyr::rename(Year1_clients, c("X3220094.Head.of.household.gender"="HHGender", "X6170345.Head.of.household.phone"="HHPhone", "X9140361.Head.of.household.age"="HHAge"))        
Year1_clients <-  plyr::rename(Year1_clients, c("X8130040.How.many.children.in.your.household.below.5.years.of.age..including.soon.to.be.born..."="Child5"))
Year1_clients <-  plyr::rename(Year1_clients, c("X120177.Child.1.Gender"="Child1Gender", "X160016.Child.2.Gender"="Child2Gender", "X1130103.Child.3.Gender"="Child3Gender", "X2150119.Child.4.Gender"="Child4Gender", "X2150120.Child.5.Gender"="Child5Gender"))
Year1_clients <-  plyr::rename(Year1_clients, c("X8130046.Client.photo"="ClientPhoto", "X6160252.Latitude"="Latitude", "X..GEOLON...Longitude"="Longitude"))

# Check the listing in the dataframe
names(Year1_clients)

Year1_clients$Display.Name <- as.character(Year1_clients$Display.Name) 


# A tidyr example
library(tidyr)
library(dplyr)

tidyr.ex <- data.frame(Display_name = c(Year1_clients$Display.Name))
tidyr.ex$Display_name
test_data <- tidyr.ex %>% separate(Display_name, c("NGO", "Del1", "Prov", "Del2", "Dist", "Del3", "Comm", "Del4","Vill","Del5"), "-", extra = "drop", fill = "left")
head(test_data)
test_data$NGO <- NULL
test_data$Del1 <- NULL
test_data$Del2 <- NULL
test_data$Del3 <- NULL
test_data$Del4 <- NULL
test_data$Del5 <- NULL


# Add the separated data to the Year1_Clients
Year1_clients$Province <- test_data$Prov
Year1_clients$District <- test_data$Dist
Year1_clients$Commune <- test_data$Comm
Year1_clients$Village <- test_data$Vill

# Trim the trailing spaces
Year1_clients$Province <- trimws(Year1_clients$Province, "r")
Year1_clients$District <- trimws(Year1_clients$District, "r")
Year1_clients$Commune <- trimws(Year1_clients$Commune, "r")
Year1_clients$Village <- trimws(Year1_clients$Village, "r")

Year1_clients$Commune <- trimws(Year1_clients$Commune, "l")
Year1_clients$Village <- trimws(Year1_clients$Village, "l")

# Change to a factor

Year1_clients$Province <- factor(Year1_clients$Province)
Year1_clients$District <- factor(Year1_clients$District)
Year1_clients$Commune <- factor(Year1_clients$Commune)
Year1_clients$Village <- factor(Year1_clients$Village)
str(Year1_clients)

# Remove Display.name column
Year1_clients$Display.Name <- NULL


# Plotting examples
source("Year 1 Plotting.R")
new_g

# Check if a client is also the head of household
head(Year1_clients$ClientPhone, 20)


