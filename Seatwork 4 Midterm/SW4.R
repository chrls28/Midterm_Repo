library(imager)
library(magick)

#display image
mtfuji <- load.image("img/mtfuji.jpg")
plot(mtfuji)

#resizing image
mtfuji1 <- resize(mtfuji, size_x = 250, size_y = 250)

#saving resize image
save.image(im = mtfuji1,"img/mtfuji1.jpg")
plot(mtfuji1)

#magick = display image url
taal <- magick::image_read("http://www.thejunction-tagaytay.com/wp-content/uploads/2016/05/Tagaytay-Taal-Volcano.jpg")
taal

#magick = image_resize function
taal1 <- image_resize(taal, geometry_size_pixels(width = 250, height = 250, preserve_aspect = FALSE))
taal1

