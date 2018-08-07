x<-midetrmseatwork_data

T1 <- function(data, Ozonex, Tempx){
  apply(subset(data, Ozone>Ozonex&Temp>Tempx&!is.na(Wind),select=Wind),2,mean)
}
T1(x,25,70)

T2 <- function(data, monthx, dayx){
  apply(subset(data, Month==monthx&Day==dayx&!is.na(Temp),select=Temp),2,mean)
}
T2(x,9,8)

T3 <- function(data, monthx){
  apply(subset(data, Month==monthx&!is.na(Ozone), select=Ozone),2,min)
}
T3(x,5)


