library (argparse)
library (imager)
library (stringr)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PARSING COMMAND LINE ARGUMENTS
parser <- ArgumentParser()
parser$add_argument("-folder",required="True" ,help = "Local File Directory of images to augment :Reqd = TRUE")
parser$add_argument("-resize",dest="HxW",help = "To resize an image :Default = 0")
parser$add_argument("-angle",default=0,type="integer", help = "To change the angle of the image :Default = 0")
parser$add_argument("-grey" ,default=FALSE,help = "To grayscale an image :Default = FALSE")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FUNCTION FOR SHOWING HELP/USAGE OF PROGRAM
cat(parser$print_help(), "\n")

args <- parser$parse_args()

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~CODE FOR RESIZE INPUT OF HxW
num <- args$HxW
HxW <- str_split(num, "x", simplify = TRUE)
H1 <- as.numeric(HxW[1])
W1 <- as.numeric(HxW[2])
H1[is.na(H1)] <- 0
W1[is.na(W1)] <- 0

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PRINTING OUTPUT OF USER IN TXT
cat("Current working dir/images: ", args$folder, "\n")
cat("Current input Height: ", H1, "\n")
cat("Current input Width: ", W1, "\n")
cat("Current input for grayscale: ", args$grey, "\n")
cat("Current input angle: ", args$angle, "\n")

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FUNCTION FOR LOADING THE IMAGE FILES WITH EXTENSION JPG
getimage<- function(x){
  y <- list.files(path=x,pattern = "\\.jpg$", ignore.case=TRUE, recursive = TRUE,full.names = TRUE) 
  lapply(y, load.image)
} 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~FUNCTION FOR GETTING THE BASE NAME OF IMAGE FILES
getname<- function(x){
  y <- list.files(path=x,pattern = "\\.jpg$", ignore.case=TRUE, recursive = TRUE,full.names = TRUE) 
  lapply(y,basename)
} 

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~AUGMENTED IMAGE FILE STORAGE
dir.create(file.path("Augmented_images"), showWarnings = FALSE)


#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~AUGMENATION FUNCTION GRAYSCALE:RESIZE:ROTATE
augmented <- function(img,H,W,gry,angle){
  name <- getname(img)
  imge <- getimage(img)
  num <- 1:length(imge)
  if(gry==TRUE){
    gray <- lapply(imge,grayscale)
    for (i in num){
      save.image(im = gray[[i]],file=paste0("Augmented_images/Grayscaled_image_",name[[i]]))
    }
  }
  if(H&&W > 1){
    imgresze <- lapply(imge,resize,size_x = H, size_y = W)
    for (i in num){
      save.image(im = imgresze[[i]],file=paste0("Augmented_images/Resized_image_",name[[i]]))
    }
  }
  if(angle>1){
    invimg <- lapply(imge,imrotate,angle = angle)
    for (i in num){
      save.image(im = invimg[[i]],file=paste0("Augmented_images/Inverted_image_",name[[i]]))
    }
  }
}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~PRINTING OUTPUT
print(augmented(args$folder,H1,W1,args$grey,args$angle))
