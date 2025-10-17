#' Summarise HAI counts and shares
#'
#' Compute total case counts by infection type and the share of the total.
#'
#' @param .data A data.frame/tibble with at least columns `infection` and `cases`
#'   (e.g. [haiDash::hai_clean]).
#' @return A tibble with columns `infection`, `cases`, and `share`.
#' @examples
#' # summarise_hai(haiDash::hai_clean)
#' @export
#' @importFrom dplyr group_by summarise mutate
summarise_hai <- function(.data) {

  stopifnot(all(c("infection", "cases") %in% names(.data)))

  out <- dplyr::summarise(
    dplyr::group_by(.data, .data$infection),
    cases   = sum(.data$cases, na.rm = TRUE),
    .groups = "drop"
  )

  dplyr::mutate(out, share = .data$cases / sum(.data$cases))
}
