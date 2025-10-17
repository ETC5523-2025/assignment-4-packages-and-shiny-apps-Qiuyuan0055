#' HAI cases (Germany, PPS 2011)
#'
#' Tidy counts of healthcare-associated infections (HAIs) in Germany.
#' Created from \code{BHAI::num_hai_patients}.
#'
#' @format A tibble with 5 rows and 3 variables:
#' \describe{
#'   \item{infection}{Character, infection type: HAP, SSI, BSI, UTI, CDI}
#'   \item{cases}{Integer, number of cases}
#'   \item{country}{Character, always "Germany"}
#' }
#' @source Zacher et al. (2019), via the BHAI package.
#' @examples
#' data(hai_clean)
#' head(hai_clean)
"hai_clean"
