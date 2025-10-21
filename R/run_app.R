#' Launch the Shiny app
#'
#' This launches the interactive Shiny application included in the haiDash package.
#'
#' @return Invisible NULL; runs the app for its side-effect.
#' @export
run_app <- function() {
  app_dir <- system.file("app", package = "haiDash")
  if (app_dir == "") {
    stop("App folder not found. Try reinstalling the package.", call. = FALSE)
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
