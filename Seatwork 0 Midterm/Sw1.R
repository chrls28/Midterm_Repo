x <- midetrmseatwork_data
Oz1 <- subset(x, Ozone > 25 & Temp > 70,select=c(Wind))

T1 <- function(Ozone,Temp)
{
  
  if (Ozone > 25 && Temp > 70 ){
  subset(x, select = Wind)
    
  }
}
T1

