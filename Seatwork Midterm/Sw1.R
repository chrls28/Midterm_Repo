x <- midetrmseatwork_data
Oz1 <- subset(x, Ozone > 25 & Temp > 70,select=c(Wind))
if (x$Ozone > 25 && x$Temp > 70 && !is.na(x$Wind)){
  subset.data.frame(x, )
  mean()
}

print(select)
ss