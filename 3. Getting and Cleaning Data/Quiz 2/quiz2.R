#Question 1
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("Quiz2",
                   key = "f533674645ca3f624055",
                   secret = "69bd8ca7091964fbbdb5866aa7469e1835f0313a")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
content(req)

#Question 4
file = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCodes = readLines(file)
close(file)
nchar(htmlCodes[10])
nchar(htmlCodes[20])
nchar(htmlCodes[30])
nchar(htmlCodes[100])

#Question5
df <- read.fwf(
  file="wksst8110.for",
  widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
  skip=4
)
