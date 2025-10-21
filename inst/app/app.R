# inst/app/app.R
library(shiny)
library(dplyr)
library(ggplot2)
library(scales)

if (!exists("hai_clean", inherits = FALSE)) {
  if (requireNamespace("haiDash", quietly = TRUE)) {
    data("hai_clean", package = "haiDash", envir = environment())
  }
}
if (!exists("summarise_hai", inherits = FALSE)) {
  if (requireNamespace("haiDash", quietly = TRUE)) {
    summarise_hai <- get("summarise_hai", envir = asNamespace("haiDash"))
  }
}

ui <- fluidPage(
  titlePanel("HAI PPS Explorer (Germany, 2011)"),
  sidebarLayout(
    sidebarPanel(
      selectInput("focus", "Highlight infection",
                  choices = c("All", "HAP", "SSI", "BSI", "UTI", "CDI"),
                  selected = "All"),
      checkboxInput("show_share", "Show share of total", TRUE)
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Overview", plotOutput("barplot", height = 360), br(), tableOutput("tbl")),
        tabPanel("About",
                 p("Data: BHAI::num_hai_patients (PPS 2011, Germany)"),
                 p("Use the controls to explore counts or shares by infection type."))
      )
    )
  )
)

server <- function(input, output, session) {
  data <- reactive(hai_clean)
  summariser <- reactive(summarise_hai)

  output$barplot <- renderPlot({
    df <- summariser()(data())
    req(all(c("infection", "cases", "share") %in% names(df)))

    df <- df %>% mutate(highlight = if (input$focus == "All") TRUE else infection == input$focus)
    yvar <- if (input$show_share) "share" else "cases"

    ggplot(df, aes(infection, .data[[yvar]], fill = highlight)) +
      geom_col() +
      scale_y_continuous(labels = if (input$show_share) percent_format() else label_comma()) +
      guides(fill = "none") +
      labs(x = NULL, y = if (input$show_share) "Share of total" else "Cases") +
      theme_minimal(base_size = 12)
  })

  output$tbl <- renderTable({
    summariser()(data()) %>% arrange(desc(cases)) %>% mutate(share = percent(share))
  })
}

shinyApp(ui, server)
