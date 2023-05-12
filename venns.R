library(eulerr)
library(RVenn)
library(ggvenn)
library(GGally)
library(viridis)
library(ggplot2)
library(tidyverse)
library(purrr)
library(tidyr)
library(cowplot)
library(immunarch)
library("VennDiagram") 
```{}
rep1 <- repLoad("/Users/labuser/Downloads/Run2/GE55_output/exp_rep")
rep1$meta

##for col in rep1$data 
#repOver1 <- repOverlap(rep1$data[c(1,3)], .method = "public") 
##vis (repOver1)
#shared2194alpha <- repOver1[1]
x <- 1
y <- 3
repOver2 <- repOverlap(rep1$data[c(x,y)], .method = "public") 
#vis (repOver1)
shared <- repOver2[1]

pR <- pubRep (rep1$data[c(x,y)], .verbose = FALSE, .min.samples = 2)
#vis (pR, "clonotypes")
#top (pR)
pR1 <- arrange (pR, desc(pR[4]))
target <- pR[,1]
target <- as_vector(target$CDR3.aa)
#target1 <- target [2:11]
#target1 <- c ("CAWSRQGSTDTQYF", "CSVDMGRGYEQYF", "CASSLGGAADTQYF","CASSRGQAYGYTF")

tc2 <- trackClonotypes(rep1$data[c(x,y)], target, .col = "aa")
vis (tc2)
set1 <- repExplore(rep1$data[x], .method = c('volume'), .col = "aa")
set1 <- as_vector (set1$Volume)
set2 <- repExplore(rep1$data[y], .method = c('volume'), .col = "aa")
set2 <- as_vector (set2$Volume)
names <- ("p2194-alpha")
filename <- paste ('/Users/labuser/Downloads/figs/', names, ".pdf", sep = "")
pdf (filename)
draw.pairwise.venn(set1, set2, shared, category=c("PBMC","Skin"),fill=c("Red","Yellow"), cex = 2, lwd = 1, scaled = FALSE, ext.text = FALSE, ext.percent = 10)
#vis(tc2)
title = (main=paste0(names))
dev.off()
```{}

