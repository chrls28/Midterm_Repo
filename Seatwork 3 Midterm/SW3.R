x <- midetrmseatwork_data
names(x)
Valclass <- function(data,row,class){
      data[row,class]
}
Valclass(x,82,3)

Valmissinclass <- function(data,class){
      sum(is.na(data[,class]))
}
Valmissinclass(x,"Wind")

valmeanbetweenrow <- function (data,row1,row2,class){
  getrow<- data[row1:row2,class]
  sapply(getrow, mean, na.rm = TRUE)
}
valmeanbetweenrow(x,20,70,"Ozone")

x[82,"Wind"]


