library (argparse)
library (imager)

parser <- ArgumentParser()
parser$add_argument("-dir", type="character", default= "img/glitch.jpg", help = "Local File Directory of image to augment")

parser$print_help()

args <- parser$parse_args()

if ( args$dir) { 
  dirimage <- function(img){
    load.image(img) %>% plot
  }
}