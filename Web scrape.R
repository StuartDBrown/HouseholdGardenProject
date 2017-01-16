library("rvest")
library("xml2")

library("XML")

Cam_Phones <- read_html("https://en.wikipedia.org/wiki/Telephone_numbers_in_Cambodia")

Cam_Phones <- read_html("https://en.wikipedia.org/wiki/Telephone_numbers_in_Cambodia")
Cam_companies <- Cam_Phones %>%
  html_node("table.wikitable") %>%
  html_table(header = TRUE)

str(Cam_Phones)
write_xml(Cam_companies, file="temp.html")
str(Cam_companies)
head(Cam_companies)

Cam_companies$Notes <- NULL
Cam_companies$`Mobile Examples` <- NULL
Cam_companies$`Landline Examples` <- NULL
Cam_companies[1,1]
names(Cam_companies)
Cam_companies$`Landline Prefixes` <- NULL
Cam_test <- t(Cam_companies)

names(Cam_companies)[2] <- "Prefix"

Cam_companies$Prefix <- gsub("\\(","", Cam_companies$`Mobile Prefixes`)

Cam_companies$Prefix <- gsub(" 7 digits","", Cam_companies$Prefix)
Cam_companies$Prefix <- gsub(" 6 digits","", Cam_companies$Prefix)
Cam_companies$Prefix <- gsub("\\)","", Cam_companies$Prefix)

Cam_companies$Prefix <- gsub(" 7digits But start with 5xxxxxx","", Cam_companies$Prefix)
Cam_companies$Prefix <- gsub("6-7 digits","", Cam_companies$Prefix)

library(tidyr)
#library(dplyr)
Cam_companies$'Mobile Prefixes' <- NULL

#tidyr.ex <- data.frame(Prefix_name = c(Cam_companies$Prefix))
#tidyr.ex$Prefix_name
#test_data <- tidyr.ex %>% separate(Prefix_name, c("NGO", "Del1", "Prov", "Del2", "Dist", "Del3", "Comm", "Del4","Vill","Del5"), "-", extra = "drop", fill = "left")
#head(test_data)

Prefix_list <- list(Cam_companies$Prefix)
Prefix_list

mobi_list <- gsub("\\+","", Cam_companies[1,2])
mobi_list
mobi_list <- gsub("\\n","", mobi_list)








