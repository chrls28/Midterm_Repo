x <- midetrmseatwork_data

subset_data <- function(data,min,max){
  subset_param <- (data$class>min)&(data$class<max)
  data[subset_param]
}

T1 <- 
  
  if (x$Ozone > 25 && x$Temp > 70 && !is.na(x$Wind)){
  subset_data(x,25,70)
  mean(subset_data)
}

