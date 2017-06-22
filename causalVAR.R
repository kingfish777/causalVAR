library(dplyr)
library(vars)
library(rcausal)
library(plm)
library(tidyverse)
# note that you can also include "structured data" - these can be age range, gender, ethnicity, which allele an individual carries
dat <- as.data.frame(read_tsv("/Users/smalec/Downloads/fake_panel_data.csv"))
pdat <- pdata.frame(dat, index = c("visit", "patient"))

tetrad.input <- residuals(VAR(pdat[,3:7]))
pcmax(tetrad.input)
