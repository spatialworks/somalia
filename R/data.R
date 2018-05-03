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

