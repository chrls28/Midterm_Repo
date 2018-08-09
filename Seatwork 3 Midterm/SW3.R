x <- midetrmseatwork_data
names(x)
T1 <- function(data,row){
      data[row,3]
}
T1(x,82)

T2 <- function(data){
      sum(is.na(data[,3]))
}
T2(x)

T3 <- function (data,row1,row2){
  ozone<- data[row1:row2,1]
  sapply(ozone, mean, na.rm = TRUE)
}
T3(x,20,70)


