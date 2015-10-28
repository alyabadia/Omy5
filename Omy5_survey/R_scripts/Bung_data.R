### Merge repository metadata with genotypes #####

rm(list=ls()) # Remove all
source("Omy5_survey/R_scripts/Combine_chipruns.R") # to run the previous code

#### Import the metadata table (repository data) ####

Meta = read.csv("Omy5_survey/twocol_data/All_Omykiss101615.csv", header=T, row.names = 1)
head(Meta)

Omy5survey_merged <- merge(All_genos,Meta,by=0,all.x=TRUE) # merge by row names (by=0 or by="row.names")
Omy5survey_merged[is.na(Omy5survey_merged)] <- 0 # # replace NA values


