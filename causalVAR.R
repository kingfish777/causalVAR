library(dplyr)
library(vars)
library(rcausal)
library(plm)
library(tidyverse)
# note that you can also include "structured data" - these can be age range, gender, ethnicity, which allele an individual carries

# read tab delimited data into data frame
dat <- as.data.frame(read_tsv("paneldata.tsv"))

# transform datframe into paneldata object
pdat <- pdata.frame(dat, index = c("visit", "patient"))

# extract the residuals (error) from the SVAR model of the paneldata (pdat) object)
tetrad.input <- residuals(VAR(pdat[,3:7]))

tetrad.output <- rcausal::pc(tetrad.input)
#print results
print(tetrad.output)


