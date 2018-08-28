library(imager)
library(magick)

#display image
glitch <- load.image("img/glitch.jpg") %>% plot

abstract <- load.image("img/abstract.jpg") %>% plot

spiral <- load.image("img/spiral.jpg") %>% plot

#library = imager resize image local
resizeimg <- function(img,height,width){
imgrsze <- resize(img, size_x = height, size_y = width)
save.image(im = imgrsze,"img/glitchresize.jpg")
plot(imgrsze)
}

#glitch
resizeimg(glitch,250,250)


#saving resize image
#save.image(im = mtfuji1,"img/mtfuji1.jpg")
#plot(mtfuji1)


#library = magick web resize
urlimgresize <- function(img,W,H){
img1 <- image_resize(img, geometry_size_pixels(width = W, height = H, preserve_aspect = FALSE))
img1
}
#display urlimg to ressize
urlimg <- magick::image_read("http://informationcommunicationtechnology.com/wp-content/uploads/2018/06/Abstract.jpg")
urlimg
#funtion to resize urlimg
urlimgresize(urlimg,300,50)



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

#grayimg url




#library = magick invertion of img local
invertimg <- function(im,angle){
  invimg <- imrotate(im,angle)
  invimg1 <- save.image(invimg,"img/abstractinvert.jpg")
  plot(invimg)
}
invertimg(abstract,180)
