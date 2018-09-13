library (argparse)
library (imager)
library (stringr)

parser <- ArgumentParser()
parser$add_argument("-image",required="True" ,help = "Local File Directory of image to augment :Reqd = TRUE")
parser$add_argument("-resize",dest="HxW",help = "To resize an image :Default = 0")
parser$add_argument("-angle",default=0,type="integer", help = "To change the angle of the image :Default = 0")
parser$add_argument("-grey" ,default=FALSE,help = "To grayscale an image :Default = FALSE")

cat(parser$print_help(), "\n")

args <- parser$parse_args()

#splitting Height and Width 
num <- args$HxW
HxW <- str_split(num, "x", simplify = TRUE)
H1 <- as.numeric(HxW[1])
W1 <- as.numeric(HxW[2])
H1[is.na(H1)] <- 0
W1[is.na(W1)] <- 0

#printing desired outputs in string
cat("Current working dir/image: ", args$image, "\n")
cat("Current input Height: ", H1, "\n")
cat("Current input Width: ", W1, "\n")
cat("Current input for grayscale: ", args$grey, "\n")
cat("Current input angle: ", args$angle, "\n")

#creating another file to store augmented images
dir.create(file.path("Augmented_images"), showWarnings = FALSE)

fileimge <-function(name){
  file_path_sans_ext(name)
}
#augmenting image function
augmented <- function(img,H,W,gry,angle){
  imge <- load.image(img)
  if(gry==TRUE)
    {
      is.logical(gry)
      if(gry==TRUE){
        gray <- grayscale(imge)
        save.image(im = gray,file=paste0("Augmented_images/Grayscale_image",imge,".jpg"))
      }
    }
    if(H&&W > 1){
        imgrsze <- resize(imge, size_x = H, size_y = W)
        save.image(im = imgrsze,paste0("Augmented_images/Resized_image",imge,".jpg"))
    }
    if(angle>1){
       invimg <- imrotate(im=imge,angle)
       save.image(im = invimg,file=paste0("Augmented_images/Inverted_image",imge,".jpg"))
    }
}

print(augmented(args$image,H1,W1,args$grey,args$angle))

list.files(pattern = "\\.jpg$", ignore.case=TRUE)
