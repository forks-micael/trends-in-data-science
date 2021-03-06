# 00_LibrariesAndPackages.R
# Author: Alan Chalk / Tony Ward
# Date: 17 January 2017

# Purpose: Clear environments.  Set directory strings for later use.  
#          Install and / or load libraries

# Contents:
#   1. Clear workspace
#   2. Define directories
#   3. Installs and Loads Standard Packages
#   4. Installs and Loads Packages from specific repos
#   5. Save session info and garbage collect

# Notes:
#   1. This is TEMPLATE code.  However we do not expect any changes or choices to be made
#      other than the package to be loaded      

#-----------------------------------------------------------------------
#   3. LOAD PACKAGES
#   If needed install packages first
# http://stackoverflow.com/questions/9341635/check-for-installed-packages-before-running-install-packages

pkgInstall <- function(x)
{ 
  if (!(x %in% rownames(installed.packages())))
  {
    install.packages(x,dep=TRUE)
  }
  
} 

packagesToLoad <- c(
  # DATA MANIPULATION
  "data.table",
  'plyr', 
  'dplyr', 
  'reshape2',
  'slam',
  'zoo',
  'glue',
  'Matrix',
  
  # VISUALISATION AND EDA
  'ggplot2',
  'wordcloud2',
 
  # SUPERVISED LEARNING
  "earth",
  "glmnet",

  # PARALLEL PROCESSING
  'parallel',
  'doSNOW',

  # TEXT ANALYTICS
  'tm', # Framework for text mining.
  'topicmodels',
  'jsonlite',
  'LDAvis',
  'servr',
  "tidytext"
  
)

# Installs packages if they are not installed
sapply(packagesToLoad, pkgInstall)

# Loads packages
sapply(packagesToLoad, require, character.only = TRUE, quietly = TRUE,
       warn.conflicts = FALSE)

#-----------------------------------------------------------------------
#   5. Load Functions

# identify all scripts containing functions stored in code directory
functionNames <- list.files(dirRCode,
                            pattern = "^fn")
functionPaths <- paste(dirRCode, functionNames, sep = "/")
 
# # source functions
sapply(functionPaths, source)
#-----------------------------------------------------------------------
#   6. Save session information

# Set time zone
Sys.setenv(TZ = "Europe/London")
Sys.getenv("TZ")

rm(pkgInstall, packagesToLoad, functionPaths)

gc()