#Question 1
data = read.csv("ss06hid.csv");
length(data[which(data$VAL==24 ),"VAL"])

#Question 3
library("xlsx")
colIndex = 7:15
rowIndex = 18:23
dat = read.xlsx("DATA.gov_NGAP.xlsx", sheetIndex = 1, header = TRUE, 
                colIndex = colIndex, rowIndex = rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)

#Question 4
doc = xmlTreeParse("restaurants.xml",useInternalNodes= TRUE)
zipcode = xpathSApply(doc,"//zipcode",xmlValue)
length(which(zipcode == "21231"))

