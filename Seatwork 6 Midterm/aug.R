library (argparse)
library (imager)



augmented <- function(args.dir,args.H,args.W,args.grey,args.invert){
  dirimage <- load.image(args.dir)
  if(args.grey==TRUE)
  {
    is.logical(args.grey)
    if(args.grey==TRUE){
      gray <- grayscale(dirimage)
      gray1 <- save.image(im=gray,file=paste0("img/grey",dirimage,".jpg"))
    } else{
      plot(dirimage)
    }
  }
  if(args.H&&args.W > 1){
    imgrsze <- resize(dirimage, size_x = args.H, size_y = args.W)
    save.image(im = imgrsze,file=paste0("img/resized",dirimage,".jpg"))
  }
  if(args.invert>1){
    invimg <- imrotate(im=dirimage,args.invert)
    invimg1 <- save.image(im=invimg,file=paste0("img/inverted",dirimage,".jpg"))
  }
  else{
    plot(dirimage)
  }
}

parser <- ArgumentParser()
parser$add_argument("-dir", default= "img/glitch.jpg", help = "Local File Directory of image to augment")
#parser$add_argument("resize", type="integer", help = "Height x Width")
parser$add_argument("-H", type="integer", help = "Height x Width")
parser$add_argument("-W", type="integer", help = "Height x Width")
parser$add_argument("-grey" , type="logical", default=FALSE , help = "To grayscale an image")
parser$add_argument("-invert" ,type="integer", help = "To change the angle of the image")
parser$print_help()

args <- parser$parse_args()


augmented()
