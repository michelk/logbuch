% viwdlog -- A wrapper progam for editing workday-log-files
% Michel Kuhlmann, <michel@kuhlmanns.info>
% April 2012


Description
===========

Creates a template of a workday-log-file and opens that file with the editor bind to `EDITOR` shell-variable.

You have to set the shell-variable: `WDLOG_DIR` with your top level directory
where the workday-log-files are located.

For example:

    export WDLOG_DIR="$HOME/logbuch"

Usage
=====

    shell> viwdlog

Value
=====
Opens an editor with the current workday-log-file


