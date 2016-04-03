#Question 1
data = download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv",
                     destfile = "data06hid.csv")
data = read.csv(file = "data06hid.csv",header = TRUE)
aggricultureLogical = data$ACR==3 & data$AGS==6
which(aggricultureLogical == TRUE
      
#Question 2
library(jpeg)
img = readJPEG(source = "Fjeff.jpg",native = TRUE)
quantile(img,c(0.3,0.8))

#Question 3
gdp = read.csv(file="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv",skip=5,header=FALSE,nrows=190)
education = read.csv(file="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv")
merged = merge(gdp,education,by.x = "V1",by.y = "CountryCode",sort=TRUE)
m = merged[with(merged,order(-V2)),]

#Question 4
mean(merged[merged$Income.Group=='High income: OECD',]$V2)
mean(merged[merged$Income.Group=='High income: nonOECD',]$V2)

#question 5
quentile <- c(0.2,0.4,0.6,0.8,1)
q <- quantile(merged$V2, quentile)
q1 <- merged$V2 <= 38
xtabs(q1 ~ merged$Income.Group)