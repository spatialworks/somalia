## load library
if(!require(devtools)) install.packages("devtools")
if(!require(mali)) install_github("validmeasures/somalia")
if(!require(gadmr)) install_github("SpatialWorks/gadmr")

if(!require(rgdal)) install.pacakges("rgdal")
if(!require(rgeos)) install.packages("rgeos")

country_border <- gadmr::get_map(format = "gpkg", country = "SOM", layer = 0)

png(filename = "inst/figures/somalia.png", width = 2, height = 2, units = "in", res = 300)

par(mar = c(0,0,0,0), pty = "s", bg = NA)

plot(country_border, border = "#D84942", col = "#D77C79", lwd = 1)

dev.off()
