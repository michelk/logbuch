logbuchUI <-
    function                            # ^ Provider of the logbuch user-interface
(
    logof                               # ^ logo-file
   ,title = "Logbuch"                    # ^ title of the app
   ,na = "Keine Wahl"                   # ^ no-data label
   ,prs
   ,prjNmsAssoc
)
{
    navbarPage(
        #img(src= logof, width = 40, height = 40),
        title,
        tabPanel(
            "Eval",
            sidebarLayout(
                sidebarPanel(
                    selectInput("qperson", label = h4("Mitarbeiter"),
                                choices = c(na,prs))
                   ,selectInput("qproject", label = h4("Projekt"),
                                choices = c(na,prjNmsAssoc))
                   ,dateRangeInput("qdates", label = h4("Zeitspanne"),
                                   start = "2014-01-01", end = "2014-12-31")
                   ,selectInput("qunit", label = h4("Integration"),
                                choices = list(na,"Tage" = "day", "Wochen" = "week"
                              , "Monate" = "month", "Jahre" = "year", "Total" = "total"))
                   ,checkboxInput("qsubp", label = "Details über Projektphasen")
                    ),
                mainPanel(
                    tabsetPanel(
                        id = "evalTabset",
                        tabPanel(
                            "Data",
                            dataTableOutput("query_data")
                            ),
                        tabPanel(
                            "Viz",
                            plotOutput("query_viz")
                            )
                        )
                    )
                )
            )
       ,tabPanel(
           "Zeiterfassung"
          ,sidebarLayout(
              sidebarPanel(
                  selectInput("dbprs", label = h4("Mitarbeiter"), choices = prs)
                 ,selectInput("dbprj", label = h4("Projekt"), choices = prjNmsAssoc )
                 ,uiOutput("ui_phase")
                 ,dateInput("dbdte", label = h4("Datum"))
                 ,numericInput("dbh", label = "Stunden", value = 0, min = 0, max = 24)
                 ,textInput("dbdsc", label = "Beschreibung", value = "NA")
                  ),
              mainPanel(
                  tableOutput("dbnew")
                 ,actionButton("dbsave", "Speichern")
                 ,verbatimTextOutput("dbsaver")
                  )
              )
           )
       ,tabPanel(
           "Projekte"
          ,sidebarLayout(
              sidebarPanel(
                  selectInput("pprjd", label = h4("Projekt Details")
                            , choices = prjNmsAssoc )
                  ),
              mainPanel(
                  dataTableOutput("pprj")
                 ,tableOutput("pprjdq")
                  )
              )
           )
       , windowTitle = "logbuch")
}
