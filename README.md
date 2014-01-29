# Description

Given a set of workday-record-files, the executable, `summarizeWorkHours`, --
shipped within this package -- summarizes your work-time and projects-time.
You have to have fixed directory structure. The program then creates a
couple of plots and summaries, which describe your work-time.

# Installation

Currently the program is only tested on linux; if you use windows, it is most likely that you need Cygwin; the executables is copied to /usr/local/bin

## R-package


    R> install.packages('devtools')
    R> require('devtools')
    R> install_github("logbuch", username = "michelk")

Directory structure
-------------------

    shell> mkdir logbuch # top-level directoy

The following convenction is used

    .
    ├── <year>
    │   ├── <month>
    │   │   ├── <week>
    │   │   │   ├── <date>.wdlog
    │   │   │   ├── <date>.wdlog

eg: 

    .
    ├── 2011
    │   ├── 10
    │   │   ├── 40
    │   │   │   ├── 2011-10-03.wdlog
    │   │   │   ├── 2011-10-04.wdlog
    │   │   │   ├── 2011-10-05.wdlog
    │   │   │   ├── 2011-10-06.wdlog


# Editing workday-log-files


The easiest thing is to have a shortcut on the `edit ${day-log-file}`, where
`edit` is the command, related to your favourite edit, and `${day-log-file}` is
the path to the current (today) workday-diary-file.

## Using `viwdlog`

For `vim` there is a wrapper program, `viwdlog`,  shipped with the package. Then
you have to add an entry  to your shellrc file (eg. ${HOME}/.bashrc or
${HOME}/.zshrc) with `export WDLOG_DIR=path/to/your/logbuch/dir`.

For example:

    export WDLOG_DIR=$HOME/logbuch

By using `viwdlog`, the directory structure is build accordingly.

If you use a terminal multiplexer like `screen` or `tmux` you could bind
a key-shortcut to `viwdlog`. Then hitting `Ctrl-a l` opens vim with
workday-log-file of the current day.

### Using `screen` 


Put the follwing line in your `.screenrc`
    
    bind l screen -t "vim logbuch"      9  viwdlog


### Using `tmux` 

Put the follwing lines in your `.tmux.conf`
    
    unbind l
    bind-key l new-window "viwdlog"


# Format of workday-log-files

The workday-log-files should strictly follow the follwing format:

    Date: Friday,  20 April 2012
    08.00 - 10.00 : ProjectA : Initialising -- initiated ProjectA
    10.00 - 12.00 : ProjectB : Cleanup -- cleaned up ProjectB
    13.00 - 15.00 : ProjectA : Report -- Started with report
    15.00 - 17.00 : ProjectC : BugFix -- line 34 of ProjectC fixed

Currently the last entry after `:` is ignored.

# Usage


After having installed the directory structure -- and generated some first
workday-logfiles --, you could either summarize a certain week, month or year with 

    shell> summarizeWorkHours --week <path/to/week>
    shell> summarizeWorkHours --month <path/to/month>
    shell> summarizeWorkHours --year <path/to/year>


Without any argument 

    shell> summarizeWorkHours 

The program analyses the current week, month and year.



