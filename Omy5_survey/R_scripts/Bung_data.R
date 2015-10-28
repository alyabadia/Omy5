### Merge repository metadata with genotypes #####

rm(list=ls()) # Remove all
source("Omy5_survey/R_scripts/Merge_tables.R") # to run the previous code

#### Import the metadata table (repository data) ####

Meta = read.csv("Omy5_survey/twocol_data/All_Omykiss101615.csv", header=T, row.names = 1)
head(Meta)

