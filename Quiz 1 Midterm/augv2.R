library (argparse)
library (imager)

parser <- ArgumentParser()
parser$add_argument("-image",required="True" ,help = "Local File Directory of image to augment :Reqd = TRUE")
parser$add_argument("-H",default=0,type="integer", help = "Height :Default = 0")
parser$add_argument("-W",default=0,type="integer", help = "Width :Default = 0")
parser$add_argument("-grey" ,default=FALSE,help = "To grayscale an image :Default = FALSE")
parser$add_argument("-angle",default=0,type="integer", help = "To change the angle of the image :Default = 0")

#cat(parser$print_usage(), "\n")
cat(parser$print_help(), "\n")

args <- parser$parse_args()

cat("Current working dir/image: ", args$image, "\n")
cat("Current input Height: ", args$H, "\n")
cat("Current input Width: ", args$W, "\n")
cat("Current input for grayscale: ", args$grey, "\n")
cat("Current input angle: ", args$angle, "\n")


dir.create(file.path("Augmented_images"), showWarnings = FALSE)


augmented <- function(img,H,W,gry,angle){
  imge <- load.image(img)
  if(gry==TRUE)
  {
    is.logical(gry)
    if(gry==TRUE){
      gray <- grayscale(imge)
      save.image(im = gray,file=paste0("Augmented_images/grayimage",LETTERS[1:10],".jpg"))
    } else{
      plot(imge)
    }
  }
  if(H&&W > 1){
    imgrsze <- resize(imge, size_x = H, size_y = W)
    save.image(im = imgrsze,file=paste0("Augmented_images/resizedimage",LETTERS[1:10],".jpg"))
  }
  if(angle>1){
    invimg <- imrotate(im=imge,angle)
    save.image(im=invimg,file=paste0("Augmented_images/invertedimage",LETTERS[1:10],".jpg"))
  }
}

print(augmented(args$image,args$H,args$W,args$grey,args$angle))