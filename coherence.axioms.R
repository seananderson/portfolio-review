# ====================================================================
# Created by:    Sean Anderson, sean@seananderson.ca
# Created:       Apr 27, 2011
# Last modified: Apr 28, 2011
# Purpose:       demonstrate hte axioms of coherence
# ====================================================================

plot.coherence.eg <- function(d1, d2, d3 = NULL, padding = 1.05, lty1 = 1, lty2 = 2, lty3 = 2, col1 = "red", col2 = "blue", col3 = "blue", axiom = "axiom", lwd1 = 1, lwd2 = 1.5, lwd3 = 1.5) {
  if(!is.null(d3)) data <- c(d1, d2, d3)
  else data <- c(d1, d2)
  plot(d1, type = "n", ylim = c(min(data)*padding, max(data)*padding*1.4), axes = F)
  box(col = "darkgrey", lwd = 1.5)
  #abline(h = 0, col = "grey", lwd = 1.5)
  lines(d1,  lty = lty1, col = col1, lwd = lwd1)
  #points(d1,  col = col1,cex = 0.9, pch = 20)
  lines(d2,  lty = lty2, col = col2, lwd = lwd2)
  #points(d2,  col = col2,cex = 0.9, pch = 20)
  if(!is.null(d3))
  {lines(d3,  lty = lty3, col = col3, lwd = lwd3)
  #points(d3,  col = col3,cex = 0.9, pch = 20)
  }
  mtext(axiom, side = 3, line = -1.40, adj = 0.03, cex = 0.8)
}

library(fGarch)
set.seed(1)
x<-rsnorm(50, mean = 0, sd = 1, xi = 0.1)
y<-rsnorm(50, mean = 3, sd = 1, xi = 0.1)


library(RColorBrewer)
  col <- brewer.pal(3, "Set1")
pdf("coherence-axioms.pdf", width = 3.75, height = 4.6)
par(mfrow = c(4, 1))
par(cex = 0.6)
gelman.par()
#par(bg = "#00000010")
par(mar = c(0,0,0,0), oma = c(2.3, 2.3, 0.5, 0.5))
plot.coherence.eg(x, y,axiom =  "Monotonicity", col1 = col[1], col2 = col[2])
plot.coherence.eg(x, y, .5*x+.5*y, lty1 = 1, lty2 = 1, lwd2 = 1, axiom = "Sub-additivity", col1 = col[1], col2 = "darkgrey", col3 = col[2])
plot.coherence.eg(x*2+0.1, x, axiom = "Positive homogeneity", col1 = col[1], col2 = col[2])
plot.coherence.eg(x, x+2, axiom = "Translational invariance", col1 = col[1], col2 = col[2])
mtext("Time", side = 1, outer = T, line = 0.6, cex = 0.8)
mtext("Returns", side = 2, outer = T, line = 0.6, cex = 0.8)
dev.off()
