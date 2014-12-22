runLogbuchApp <-
    function                            # ^ run the logbuch server
(
    app # ^ either a directory with the application or list with ui and server
   ,port = 3333           # ^ port to listen to
   ,host =                # ^ if "127.0.0.1" only visible on localhost
       c("127.0.0.1","0.0.0.0")[1]
   ,project_csv = NULL                  # ^ filepath to csv with project-data
   ,staff_csv = NULL                    # ^ filepath to csv with staff-data
   ,data_sources = NULL                 # ^ filepaths to data sources to use
   ,logo_img = NULL                     # ^ filepath to logo
)
{
    runApp(app, port = port, launch.browser = FALSE, host = host)
}
