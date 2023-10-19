
rm(list=ls(pat="*"))     # Remove all objects

##############################################

library(circlize)
library(reshape2)
library(tidyverse)
library(ggplot2)

# OLS results:
df1<- read.table("diet_habit_pooled2.txt", head = T, sep = "\t", quote = "")


# Replace NA with small values:
df1$value[is.na(df1$value)] <- 0.000000001



########### https://jokergoo.github.io/circlize_book/book/the-chorddiagram-function.html
circos.par(gap.after = c(rep(5, nrow(df1)-1), 15, rep(5, ncol(df1)-1), 15), 
           start.degree = 167, clock.wise = TRUE, gap.degree =3)
grid.col = c("1 Telomere length" = "royalblue", "2 Phenotypic age" = "royalblue", 
             "3 GMV" = "royalblue", "4 WMV" = "royalblue",
             "01 Cooked vegetable" = "mediumseagreen", "02 Salad/raw vegetable" = "mediumseagreen", 
             "03 Fresh fruit" = "mediumseagreen", "04 Dried fruit" = "mediumseagreen", 
             "05 Bread" = "gold", "06 Cereal" = "gold", 
             "07 Oily fish" = "lightsalmon", "08 Non-oily fish" = "lightsalmon", 
             "09 Processed meat" = "coral", "10 Poultry" = "coral", "11 Beef" = "coral", 
             "12 Lamb" = "coral", "13 Pork" = "coral", 
             "14 Cheese" = "peachpuff", "15 Milk" = "peachpuff", 
             "16 Hot drink" = "lightsteelblue", "17 Coffee" = "lightsteelblue", "18 Tea" = "lightsteelblue")
cols = colorRamp2(c(-1,0,1),c("red","white","green"),transparency = 0.3)




chordDiagram(df1, grid.col = grid.col, col=cols, big.gap = 30, annotationTrack = c("name", "grid"),
             annotationTrackHeight = c(0.05, 0.01))

chordDiagram(df1, annotationTrack = NULL,
             preAllocateTracks = list(track.height = 0.3))

chordDiagram(df1, annotationTrack = NULL,
             preAllocateTracks = list(list(track.height = 0.1),
                                      list(bg.border = "black")))


# Rotate label text:
chordDiagram(df1, grid.col = grid.col, col=cols, annotationTrack = "grid", annotationTrackHeight = c(0.05, 0.01),
             preAllocateTracks = list(track.height = 0.1))
# we go back to the first track and customize sector labels
circos.track(track.index = 1, panel.fun = function(x, y) {
  circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index, cex=0.6,
              facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
}, bg.border = NA) # here set bg.border to NA is important




# Plots:
png(file="220928_chord1.png",
    width=8,height=5,units="in",res=2500)

chordDiagram(df1, grid.col = grid.col, col=cols, annotationTrack = "grid", annotationTrackHeight = c(0.05, 0.01),
             preAllocateTracks = list(track.height = 0.1))
# we go back to the first track and customize sector labels
circos.track(track.index = 1, panel.fun = function(x, y) {
  circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index, cex=0.5,
              facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.5))
}, bg.border = NA) # here set bg.border to NA is important

dev.off()



# Add scaling:
chordDiagram(df1, grid.col = grid.col, col=cols, big.gap = 30, scale = TRUE)

circos.clear()






