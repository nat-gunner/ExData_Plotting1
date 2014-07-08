## Introduction

Set your working directory to the directory where you've saved the data set ("household_power_consumption.txt") and the R files (plot1.R, plot2.R, plot3.R, and plot4.R)

## Running the scripts

Each R script creates a function that will read the data and create the png files with the appropriate plots.  The functions are named according to the script that creates them.  For example, plot1.R creates a function called "plot1()", plot2.R creates a function "plot2()", etc. 

Load the scripts with the source command, then run the function corresponding to the plot you wish to create.

For example, running "plot1()" will input the data set and create a file in your working directory called "plot1.png" that contains the first plot.

You do not have to specify the data set, the function will automatically input it.