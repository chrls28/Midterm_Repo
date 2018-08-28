library(imager)
library(magick)

#DISPLAY IMAGE IMAGER
glitch <- load.image("img/glitch.jpg") %>% plot

abstract <- load.image("img/abstract.jpg") %>% plot

spiral <- load.image("img/spiral.jpg") %>% plot

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
invertimg <- function(im,angle){
  invimg <- imrotate(im,angle)
  invimg1 <- save.image(invimg,"img/abstractinvert.jpg")
  plot(invimg)
}
invertimg(abstract,180)
invertimg(law,180)



#library = magick web resize

#DISPLAY MAGICK
law <- magick::image_read("https://res.cloudinary.com/teepublic/image/private/s--VDfx4Cos--/t_Preview/b_rgb:191919,c_limit,f_jpg,h_630,q_90,w_630/v1516559553/production/designs/2296669_0.jpg")
law

#RESIZE MAGICK
urlimgresize <- function(img,W,H){
  img1 <- image_resize(img, geometry_size_pixels(width = W, height = H, preserve_aspect = FALSE))
  
  img1
}
urlimgresize(law,300,100)

#GRAYSCALE MAGICK
image_charcoal(law)



