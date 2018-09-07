library(imager)
library(argparse)



#DISPLAY IMAGE IMAGER
glitch <- load.image("img/glitch.jpg") %>% plot

abstract <- load.image("img/abstract.jpg") %>% plot

spiral <- load.image("img/spiral.jpg") %>% plot


#DISPLAYING IMAGE
img <- function()

#RESIZE IMAGER
#library = imager resize image local
resizeimg <- function(img,height,width){
imgrsze <- resize(img, size_x = height, size_y = width)
save.image(im = imgrsze,"img/glitchresize.jpg")
plot(imgrsze)
}

resizeimg(glitch,250,250)

#GRAYSCALE IMAGER
#library = imager grayimg local
grayimg <- function(img,x){
  is.logical(x)
if(x==TRUE){
  gray <- grayscale(img)
  gray1 <- save.image(gray,"img/spiralgray.jpg")
  plot(gray)
} else{
  plot(img)
}
}
#grayimg local
grayimg(spiral,TRUE)
grayimg(spiral,FALSE)


#INVERTION IMAGER
#library = imager invertion of img local
invertimg <- function(img,angle){
  invimg <- imrotate(img,angle)
  invimg1 <- save.image(invimg,"img/abstractinvert.jpg")
  plot(invimg)
}
invertimg(abstract,180)

# FUNTCTION FOR RESISZING INVERTING AND GRAYSCALING
augmented <- function(img,height,width,x,angle){
  if(x==TRUE)
  {
    is.logical(x)
    if(x==TRUE){
      gray <- grayscale(img)
      gray1 <- save.image(gray,"img/spiralgray.jpg")
      plot(gray)
    } else{
      plot(img)
    }
  }
  if(height&&width > 1){
    imgrsze <- resize(img, size_x = height, size_y = width)
    save.image(im = imgrsze,"img/glitchresize.jpg")
    plot(imgrsze)
  }
  if(angle>1){
    invimg <- imrotate(img,angle)
    invimg1 <- save.image(invimg,"img/abstractinvert.jpg")
    plot(invimg)
  }
  else{
    plot(img)
  }
}

augmented(abstract,25,25,TRUE,50)

library (argparse)
library(reticulate)

parser <- ArgumentParser()
parser$add_argument("--dir" , type="character", help = "Local File Directory of image to augment")
parser$add_argument("--resize", type="integer", help = "Height x Width")
parser$add_argument("--grey" , type="logical", default=FALSE , help = "To grayscale an image")
parser$add_argument("--invert" , type="numeric", help = "To change the angle of the image")
 

parser$print_help()



