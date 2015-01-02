logbuchServer <-
    function                            # ^ Provider of the logbuch server
(
   WD_CSV                               # ^ filepath to wdlog-data
  ,DB_CSV                               # ^ filepath to www-csv-data
  ,PRJ_CSV                              # ^ filepath to project-data
)
{
    function(input,output, session){
        datasetInput <- reactive({
            readWdlogCsv(WD_CSV)
        })
        activeData <- reactive({
            dd <- datasetInput()
            subsetAndIntegrate(
                dd ,input$qperson ,input$qproject ,input$qdates[1]
               ,input$qdates[2] ,input$qunit, input$qsubp, na)
        })
        output$query_viz <- renderPlot({
            tt <- activeData()
            plotAggregatedData(tt)
        })

        ## * Database
        dbData <- reactive({
            nn <- function(x) !is.null(x)
            cnd <-
                nn(input$dbprs) && nn(input$dbprj) && nn(input$dbsprj) &&
                    nn(input$dbh) && nn(input$dbdsc)
            if (cnd)
                data.frame(Mitarbeiter  = input$dbprs
                          ,Projekt      = input$dbprj
                          ,Phase        = input$dbsprj
                          ,Stunden      = input$dbh
                          ,Beschreibung = input$dbdsc
                          ,Datum        = as.character(input$dbdte)
                           )
            else
                NULL
        })

        output$query_data <- renderDataTable({
            activeData()
        }, options=list(pageLength=10))

        output$dbnew <- renderTable({
            dbData()
        })
        output$dbsaver <- renderPrint({
            input$dbsave
            dd <- isolate(dbData())
            write.table(dd, DB_CSV, sep = ";", col.names = F, row.names = F, append = TRUE)
            readCsv(DB_CSV)
        })
        output$ui_phase <- renderUI({
            if (is.null(input$dbprj))
                return()
            subprjs <- sprj[[input$dbprj]]
            selectInput("dbsprj", label = h4("Projektphase"),
                        choices = {if (is.null(subprjs)) na else as.character(subprjs$Phase)})
        })

        ## * Project
        prjData <- reactive({
            readCsv(PRJ_CSV)
        })
        prjDetails <- reactive({
            readSubPrjFs(PRJ_DIR)
        })
        output$pprj <- renderDataTable({
            transform(prjData(), Id = as.character(Id))
        }, options=list(pageLength=10))

        output$pprjdq <- renderTable({
            prjDetails()[[input$pprjd]]
        })
    }
}                                       # ^ function suitable for the server.R app
