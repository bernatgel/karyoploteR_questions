library(karyoploteR) 


vcf.data <- read.table("file.vcf", header=TRUE)
vars <- toGRanges(vcf.data[,c(1,2,2,4,5)])
vars

library(VariantAnnotation)

readVcf(file = "file.vcf", genome = "hg19")
