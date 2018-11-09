################################################################################
#
#' somalia
#'
#' Datasets for Use in Designing Surveys in Somalia
#'
#' Designing surveys require relevant datasets to be used as basis for
#' sample size calculations, sampling design, survey planning/logistics and
#' survey implementation. These include datasets on population, lists of sampling
#' clusters, map datasets for spatial sampling, and previous survey datasets that
#' can be used for estimating indicator variance and design effects. This package
#' contains relevant datasets for use in designing surveys in Somalia.
#'
#' @docType package
#' @name somalia
#'
#
################################################################################
NULL


################################################################################
#
#' villages
#'
#' List of villages in Somalia with corresponding GPS coordinates.
#'
#' @format A data frame with 9 columns and 9782 rows:
#' \describe{
#' \item{\code{admin1pcode}}{Administrative level 1 postal code}
#' \item{\code{admin1id}}{Administrative level 1 unique identifier}
#' \item{\code{admin1name}}{Administrative level 1 name}
#' \item{\code{admin2id}}{Administrative level 2 unique identifier}
#' \item{\code{admin2name}}{Administrative level 2 name}
#' \item{\code{admin3id}}{Administrative level 3 unique identifier}
#' \item{\code{admin3name}}{Administrative level 3 name}
#' \item{\code{latitude}}{Latitude coordinate in GPS format}
#' \item{\code{longitude}}{Longitude coordinate in GPS format}
#' }
#'
#' @source UNICEF Somalia
#
################################################################################
"villages"


################################################################################
#
#' lhz2015
#'
#' Livelihood zones map of Somalia (2015)
#'
#' @format A SpatialPolygonsDataFrame with 19 features:
#' \describe{
#' \item{\code{COUNTRY}}{2-digit ISO country code (SO)}
#' \item{\code{LZNUM}}{Livelihood zone unique identifier}
#' \item{\code{LZCODE}}{Livelihood zone code}
#' \item{\code{LZNAME}}{Livelihood name}
#' \item{\code{CLASS}}{Livelihood zone classification}
#' }
#'
#' @source FEWS-NET
#'
#
################################################################################
"lhz2015"


################################################################################
#
#' region_map
#'
#' Administrative Level 1 (Region) map of Somalia
#'
#' @format A SpatialPolygonsDataFrame with 18 features:
#' \describe{
#' \item{\code{OBJECTID}}{Object identifier}
#' \item{\code{admin1Name}}{Name of administrative level 1 (region)}
#' \item{\code{admin1Pcod}}{Postal code of administrative level 1 (region)}
#' \item{\code{admin1RefN}}{Reference name of administrative level 1 (region)}
#' \item{\code{admin1AltN}}{Alternative name of administrative level 1 (region)}
#' \item{\code{admin1Al_1}}{Alternative name of administrative level 1 (region)}
#' \item{\code{admin0Name}}{Country (administrative level 0) name}
#' \item{\code{admin0Pcod}}{Country (administrative level 1) code}
#' \item{\code{date}}{Date map was poduced}
#' \item{\code{validOn}}{Date map was last validated}
#' \item{\code{validTo}}{Date map is valid up to}
#' \item{\code{Shape_Leng}}{Lenght of shape}
#' \item{\code{Shape_Area}}{Shape of area}
#' }
#'
#' @source Humanitarian Data Exchange <https://data.humdata.org/dataset/somalia-administrative-boundaries>
#
################################################################################
"region_map"


################################################################################
#
#' district_map
#'
#' Administrative Level 2 (District) map of Somalia
#'
#' @format A SpatialPolygonsDataFrame with 74 features:
#' \describe{
#' \item{\code{OBJECTID}}{Object identifier}
#' \item{\code{admin2Name}}{Name of administrative level 2 (district)}
#' \item{\code{admin2Pcode}}{Postal code of administrative level 2 (district)}
#' \item{\code{admin2RefN}}{Reference name of administrative level 2 (district)}
#' \item{\code{admin2AltN}}{Alternative name of administrative level 2 (district)}
#' \item{\code{admin2Al_1}}{Alternative name of administrative level 2 (district)}
#' \item{\code{admin1Name}}{Name of administrative level 1 (region)}
#' \item{\code{admin1Pcod}}{Postal code of administrative level 1 (region)}
#' \item{\code{admin0Name}}{Country (administrative level 0) name}
#' \item{\code{admin0Pcod}}{Country (administrative level 1) code}
#' \item{\code{date}}{Date map was poduced}
#' \item{\code{validOn}}{Date map was last validated}
#' \item{\code{validTo}}{Date map is valid up to}
#' \item{\code{Shape_Leng}}{Length of shape}
#' \item{\code{Shape_Area}}{Area of shape}
#' }
#'
#' @source Humanitarian Data Exchange <https://data.humdata.org/dataset/somalia-administrative-boundaries>
#
################################################################################
"district_map"

