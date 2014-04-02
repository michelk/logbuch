--- 
title: summarizeWorkHours -- A program to summarize workday diaries
toc: yes
categories: r package executable workday diary
...

Description
===========
This program facilitates the summary of workday-diary-files. 

For workday-diary-files the follwing structure is used:

Usage
=====

    summarizeWorkHours [-[-help|h]] [-[-week|w]] [-[-month|m]] [-[-year|y]]
        -h|--help     Getting help
        -w|--week     Directoy of week to summarize
        -m|--month    Directoy of month to summarize
        -y|--year     Directoy of month to summarize

Examples
--------

After having installed the directory structure -- and generated some first
workday-logfiles --, you could either summarize a certain week, month or year with 

    shell> summarizeWorkHours --week <path/to/week>
    shell> summarizeWorkHours --month <path/to/month>
    shell> summarizeWorkHours --year <path/to/year>


Without any argument 

    shell> summarizeWorkHours 

The program analyses the current week, month and year.

Value
=====
No value returned; instead, a couple of figures and summary files are generated
within the given directories.

