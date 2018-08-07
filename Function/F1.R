add5numbers <- function(num1,num2,num3,num4,num5){
  sum_nums = num1 + num2 + num3 + num4 + num5
  sum_nums
}

Ftemp <- function(Ctemp){
  FTemp = (Ctemp*1.8)+32
  FTemp
}

subset_data <- function(data,min,max){
  subset_param <- (data>min)&(data<max)
  data[subset_param]
}

x <- c(1:500)
subset_data(x,60,100)

Ftemp(32)

MeanFunction <- function(dataset_csv, removeNA = TRUE){
  Col_num <- ncol (dataset_csv)
  means_per_col <- numeric(Col_num)
  for(element in 1:Col_num){
    means_per_col
  }
  
}
Ftemp(45)

