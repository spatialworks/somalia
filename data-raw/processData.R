################################################################################
#
# Load libraries
#
################################################################################

library(readxl)
library(stringr)

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


