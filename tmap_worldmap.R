library(tmap)

data(World, land)

worldmap <- tm_shape(land, projection="eck4") +
  tm_raster("elevation", breaks=c(-Inf, 250, 500, 1000, 1500, 2000, 2500, 3000, 4000, Inf),  
            palette = terrain.colors(9), title="Elevation", auto.palette.mapping=FALSE) +
  tm_shape(World) +
  tm_borders("grey20") +
  tm_grid(projection="longlat", labels.size = .5) +
  tm_text("name", size="AREA") +
  tm_compass(position = c(.65, .15), color.light = "grey90") +
  tm_credits("Eckert IV projection", position = c(.85, 0)) +
  tm_style_classic(inner.margins=c(.04,.03, .02, .01), legend.position = c("left", "bottom"), 
                   legend.frame = TRUE, bg.color="lightblue", legend.bg.color="lightblue", 
                   earth.boundary = TRUE, space.color="grey90")
worldmap

tiff("worldmap.tif", res = 300, height = 7.5, width = 13.33, unit = "in", compression = "lzw")
worldmap
dev.off()