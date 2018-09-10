library (argparse)
library (imager)

parser <- ArgumentParser()
parser$add_argument("-dir", type="character", default= "img/glitch.jpg", help = "Local File Directory of image to augment")
#parser$add_argument("resize", type="integer", help = "Height x Width")
parser$add_argument("-H",type="integer", help = "Height x Width")
parser$add_argument("-W",type="integer", help = "Height x Width")
parser$add_argument("-grey" ,type="logical", default=FALSE , help = "To grayscale an image")
parser$add_argument("-invert",type="integer", help = "To change the angle of the image")
parser$print_help()

args <- parser$parse_args()


img <- args$dir
heigth <- args$H
width <- args$W
gry <- args$grey
angle <- args$invert

augmented <- function(img,height,width,gry,angle){
  if(gry==TRUE)
  {
    is.logical(gry)
    if(gry==TRUE){
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

augmented(args$dir,args$H,args$W,args$grey,args$invert)