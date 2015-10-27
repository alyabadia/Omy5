### This is a script to merge the different files

### Packages we need ####
rm(list=ls()) # Remove all variables from R
library(zoo) 
library(plyr)
library(gsubfn)

## Load data ####
# This onnly works in macs. For PC you have to use a different path.
w
system("ls -lt Omy5_survey/Omy5_survey_merged_data/*twocol* > Omy5_survey/Omy5_arena/twocols_filelist_latest.txt")
# load the list of files into a table
currentTable = read.table("Omy5_survey/Omy5_arena/twocols_filelist_latest.txt",as.is=TRUE)
currentTable<-currentTable[order(currentTable$V9),] # re order the table from the oldest file to the most recent one. This will matter if you keep adding files to this folder in the future
#  read all tables in the list
tables = list()
##read in data and attach dataframe to each file in list
for (i in 1:nrow(currentTable)){
  tables[[i]] = read.table(currentTable$V9[i], sep="\t",header=T)
}
## Now you have a list "tables" with 6 objects. Every object of the list is one of the data frames you want  to merge.

### Double check the loaded data ####
currentTable # the list of file that where uploaded
dim(tables[[1]]) # dimenssion of the first object of the list
head(tables[[1]]) # First couple of rows of the first data frame
Fishescolumnnameslist.df <- lapply(tables, function(x){colnames(x)});Fishescolumnnameslist.df #   check the colnames of all the objects
print(unique(sort(unlist(unique(Fishescolumnnameslist.df))))) # this function puts the list of column names in alphabetical order and lists the unique column names
colnames(tables[[1]]) ## Column names of table 1


### Select some columns ####
cols<- c("OmyY1", "OmyY1.1", "R18251", "R18251.1")  # Make a vector with the columns that you are interested
cbind(cols, cols %in%colnames(tables[[1]])) ## Check if  the table one has all the columns that you are interested


### Combine all tables ####
# Extracting columns from each dataframe only works if the column names are the same--including case!!!
markers<- lapply(tables, function(x){x[, cols]}) ## subset the columns that we need 

All <- do.call(rbind, markers) ## combine the two items in the tables list



