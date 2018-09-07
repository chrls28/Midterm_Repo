library(imager)

augmented <- function(img,height,width,x,angle){
    img <- load.image("img/abstract.jpg")
    names = LETTERS[1:26] ## Gives a sequence of the letters of the alphabet
    
    beta1 = rnorm(26, 5, 2) ## A vector of slopes (one for each letter)
    beta0 = 10 ## A common intercept
    
    for(i in 1:26){
      x = rnorm(500, 105, 10)
      y = beta0 + beta1[i]*x + 15*rnorm(500)
      
    
  if(x==TRUE)
  {
    is.logical(x)
    if(x==TRUE){
      gray <- grayscale(img)
    gray1 <- save.image(gray,file=paste0("img/grey",img,".jpg"))
      plot(gray)
    } else{
      plot(img)
    }
  }
  if(height&&width > 1){
    imgrsze <- resize(img, size_x = height, size_y = width)
    save.image(im = imgrsze,"img/resize.jpg")
    plot(imgrsze)
  }
  if(angle>1){
    invimg <- imrotate(img,angle)
    invimg1 <- save.image(invimg,"img/invert.jpg")
    plot(invimg)
  }
  else{
    plot(img)
  }
}



print(augmented(img,250,300,T,90))

