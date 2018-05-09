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
names(admin3list) <- c("admin2name", "admin3name", "admin3id", "longitude", "latitude")


villagelist <- merge(villagelist, admin3list, by = "admin2name")

somaliavillages <- villagelist[, c("admin1pcode", "admin1id", "admin1name",
                                   "admin2id", "admin2name",
                                   "admin3id", "admin3name", "longitude", "latitude")]

somaliavillages$latitude  <- as.numeric(somaliavillages$latitude)
somaliavillages$longitude <- as.numeric(somaliavillages$longitude)

#somaliavillages$latitude[somaliavillages$latitude < 10] <- somaliavillages$longitude[somaliavillages$latitude < 10]
#somaliavillages$longitude[somaliavillages$longitude > 10] <- somaliavillages$latitude[somaliavillages$longitude > 10]

villages <- somaliavillages

longitude <- ifelse(villages$longitude < 20, villages$latitude, villages$longitude)
latitude  <- ifelse(villages$latitude > 40, villages$longitude, villages$latitude)

villages$latitude <- latitude
villages$longitude <- longitude

devtools::use_data(villages, overwrite = TRUE)


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
lhz2015 <- readOGR(dsn = "data-raw/SO_LHZ_2015",
                   layer = "SO_LHZ_2015",
                   verbose = FALSE)
#
#
#
lhz2015$LZNAME <- str_replace(lhz2015$LZNAME, " – ", " ")
lhz2015$LZNAME <- str_replace(lhz2015$LZNAME, "  ", " ")
#
#
#
devtools::use_data(lhz2015, overwrite = TRUE)


################################################################################
#
# Pull data Humanitarian Data exchange: https://data.humdata.org using ckanr
#
################################################################################
#
# Setup ckan
#
ckanr::ckanr_setup(url = "https://data.humdata.org")

som <- ckanr::group_show(id = "som")

x <- ckanr::package_show("administrative-regions-of-somalia")

y <- ckanr::resource_show(x$resources[[1]]$id)

download.file(url = y$url, destfile = "data-raw/somalia_admin.zip")

unzip("data-raw/somalia_admin.zip", exdir = "data-raw")


################################################################################
#
# Administrative boundary maps
#
################################################################################
#
# Read region map
#
region_map <- readOGR(dsn = "data-raw/som_admbnda_adm1_undp",
                      layer = "Som_Admbnda_Adm1_UNDP",
                      verbose = FALSE)
devtools::use_data(region_map, overwrite = TRUE)
#
# Read district map
#
district_map <- readOGR(dsn = "data-raw/som_admbnda_adm2_undp",
                        layer = "Som_Admbnda_Adm2_UNDP",
                        verbose = FALSE)
devtools::use_data(district_map, overwrite = TRUE)











