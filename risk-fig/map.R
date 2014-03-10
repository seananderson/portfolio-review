
library(maptools)

fraser <- maptools::readShapePoly("map-data/Fraser_WS.shp")
bc_limit <- maptools::readShapePoly("map-data/BC_limit.shp")
tribs <- maptools::readShapePoly("map-data/Tribs.shp")

BC.lim <- readOGR(dsn="map-data", layer="BC_limit")
Fraser.WS <- readOGR(dsn="map-data", layer="Fraser_WS")
Tribs <- readOGR(dsn="map-data", layer="Tribs")
