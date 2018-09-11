library (argparse)
library (imager)

#ung Rscript nasa isang folder dapat ng image na iaaugment 

# mga dapat palitan sa parser$add_argument isa isa 
# lahat ng variables ung mga naka double qoute"-image" to "-img" kahit ano pede
# ung help nasa sayo din

parser <- ArgumentParser()
parser$add_argument("-image", help = "Local File Directory of image to augment")
parser$add_argument("-H",type="integer", help = "Height")
parser$add_argument("-W",type="integer", help = "Width")
parser$add_argument("-grey" ,type="logical",help = "To grayscale an image")
parser$add_argument("-angle",type="integer", help = "To change the angle of the image")

parser$print_help()     #wala dapat palitan
args <- parser$parse_args()  #wala dapat palitan

#nakadepende sayo kung gusto mo makita sa cmd ung mga input values
print (args$image)
print (args$H)
print (args$W)
print (args$grey)
print (args$angle)

#palitan ung parameters img,H,W,gry,angle ng ano man gusto mo 
# wag kalimutan isubstitute ung parameters sa if statements sa baba
augmented <- function(img,H,W,gry,angle){
  if(gry==TRUE){
      imge <- load.image(img)
      gray <- grayscale(imge)
      gray1 <- save.image(im=gray,file=paste0("greyimage.jpg"))
    } 
  if(H&&W > 1){
    imge <- load.image(img)
    imgrsze <- resize(imge, size_x = H, size_y = W)
    save.image(im = imgrsze,file=paste0("resizedimage.jpg"))
  }
  if(angle>1){
    imge <- load.image(img)
    invimg <- imrotate(im=imge,angle)
    invimg1 <- save.image(im=invimg,file=paste0("invertedimage.jpg"))
  }
}
#output 
print(augmented(args$image,args$H,args$W,args$grey,args$angle))