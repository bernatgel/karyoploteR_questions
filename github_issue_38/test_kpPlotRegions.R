library(karyoploteR)
library(rtracklayer)


mint.genome <- toGRanges(data.frame(chr=c("scaffold1_length_46699537", "scaffold2_length_45526029", "scaffold3_length_45460755", "scaffold4_length_44284954", "scaffold5_length_43231337", "scaffold6_length_37537474", "scaffold7_length_36621300", "scaffold8_length_36842082", "scaffold9_length_33738042", "scaffold10_length_33088173", "scaffold11_length_29943784", "scaffold12_length_29660084"),
                                    start = c(1,1,1,1,1,1,1,1,1,1,1,1), end=c(46699537, 45526029, 45460755, 44284954, 43231337, 37537474, 36621300, 36842082, 33738042, 33088173, 29943784, 29660084)))
class(mint.genome)
kp <- plotKaryotype(genome = mint.genome, ideogram.plotter = NULL, plot.type=2)
kpAddCytobandsAsLine(kp)

gff.file <- import.gff("Mlong585_v3.01_Rgenes2.txt")
gff.file <- import.gff("Mlong585_v3.01_Rgenes2.gff")

?import.gff

genes <- gff.file[gff.file$type=="gene"]

kpPlotRegions(kp, data = genes)
kpPlotRegions(kp, data=genes[strand(genes)=="+"], avoid.overlapping = FALSE, col="deepskyblue")

seqlevels(genes)
seqlevels(mint.genome)
