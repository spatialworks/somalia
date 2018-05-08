################################################################################
#
# Load libraries
#
################################################################################

library(readxl)
library(stringr)
library(ckanr)

################################################################################
#
# Read data
#
################################################################################

villages <- readxl::read_excel(path = "data-raw/somaliavillages.XLSX", sheet = 1, col_types = "text")
villages <- data.frame(villages)

################################################################################
#
# Create data vectors
#
################################################################################
#
# Admin 1 List
#
admin1id    <- villages[ , 5]
admin1id    <- admin1id[1:18]

admin1name  <- villages[ , 6]
admin1name  <- admin1name[!is.na(admin1name)]

admin1pcode <- villages[ , 7]
admin1pcode <- admin1pcode[!is.na(admin1pcode)]

admin1list  <- data.frame(admin1pcode, admin1id, admin1name)
#
# Admin 2 List
#
admin2id    <- villages[ , 10]
admin2id    <- admin2id[!is.na(admin2id)]

admin1name  <- villages[ , 9]
admin1name  <- admin1name[!is.na(admin1name)]

admin2name  <- villages[ , 11]
admin2name  <- admin2name[!is.na(admin2name)]

admin2list  <- data.frame(admin1name, admin2id, admin2name)

villagelist <- merge(admin1list, admin2list, by = "admin1name")
#
# Admin 3 List
#
admin3list  <- villages[ , 13:17]
names(admin3list) <- c("admin2name", "admin3name", "admin3id", "latitude", "longitude")


villagelist <- merge(villagelist, admin3list, by = "admin2name")

somaliavillages <- villagelist[, c("admin1pcode", "admin1id", "admin1name",
                                   "admin2id", "admin2name",
                                   "admin3id", "admin3name", "latitude", "longitude")]

somaliavillages$latitude  <- as.numeric(somaliavillages$latitude)
somaliavillages$longitude <- as.numeric(somaliavillages$longitude)

villages <- somaliavillages

devtools::use_data(villages)


################################################################################
#
# Pull data Humanitarian Data exchange: https://data.humdata.org using ckanr
#
################################################################################
#
# Setup ckan
#
ckanr::ckanr_setup(url = "https://data.humdata.org")
#
# Get the available packages for Somalia
#
packages <- ckanr::package_list()

resources <- ckanr::resource_show()

ckanr::resource_search(q = "*:*")

tab <- ckanr::group_show(id = "som")


x <- ckanr::package_search(q = "*:*")

y <- ckanr::package_show(x$results[[1]])

z <- ckanr::resource_show(y$resources[[1]]$id)


som <- ckanr::group_show(id = "som")

x <- ckanr::package_show("administrative-regions-of-somalia")

y <- ckanr::resource_show(x$resources[[1]]$id)



################################################################################
#
# Livelihood zones maps
#
################################################################################
#
# Libraries for mapping
#
library(leaflet)
library(rgdal)
library(rgeos)
library(raster)
library(maps)
#
# Read map
#
somaliaLHZ2015 <- readOGR(dsn = "data-raw/SO_LHZ_2015",
                          layer = "SO_LHZ_2015",
                          verbose = FALSE)
#
#
#
devtools::use_data(somaliaLHZ2015, overwrite = TRUE)

