library (argparse)
library(reticulate)
library (imager)

parser <- ArgumentParser()

parser$add_argument("--dir",help = "Local File Directory of image to augment")
#parser$add_argument("--resize", type="integer", help = "Height x Width")
parser$add_argument("--H", type="integer", help = "Height x Width")
parser$add_argument("--W", type="integer", help = "Height x Width")
parser$add_argument("--grey" , type="logical", default=FALSE , help = "To grayscale an image")
parser$add_argument("--invert" , type="integer", help = "To change the angle of the image")

args <- parser$parse_args()

dir <- function(img){
  load.image(img) %>% plot
}


# augmented <- function(img,height,width,x,angle){
#   img <- load.image("img/abstract.jpg")
#   if(x==TRUE)
#   {
#     is.logical(x)
#     if(x==TRUE){
#       gray <- grayscale(img)
#       gray1 <- save.image(gray,"img/.jpg")
#       plot(gray)
#     } else{
#       plot(img)
#     }
#   }
#   if(height&&width > 1){
#     imgrsze <- resize(img, size_x = height, size_y = width)
#     save.image(im = imgrsze,"img/resize.jpg")
#     plot(imgrsze)
#   }
#   if(angle>1){
#     invimg <- imrotate(img,angle)
#     invimg1 <- save.image(invimg,"img/invert.jpg")
#     plot(invimg)
#   }
#   else{
#     plot(img)
#   }
# }

parser$print_help()
