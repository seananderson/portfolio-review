
source("VaR.R")
source("CVaR.R")

CV <- function(x) sd(x)/abs(mean(x))

plot.sim.skew.dat <- function(n = 251, mean = 0, sd = 0.7, xi = 1, x.axis = TRUE, geo.returns = FALSE, risk.level = "Risk level") {
require(RColorBrewer)
  col <- brewer.pal(3, "Set1")
  require(fGarch)
  x <- rsnorm(n, mean = mean, sd = sd, xi = xi)
  if(geo.returns){
x<-log(x)
x<- diff(x)
  plot(x, type = "n", pch = 20, ylim = c(-1.5, 1.5), axes = FALSE, xaxs = "i", yaxs = "i")
}
else
plot((0:(length(x)-1)), x, type = "n", pch = 20, ylim = c(-2.8, 2.8), axes = FALSE, xaxs = "i", yaxs = "i")

  rect(0, min(x), n, VaR(x), col = paste(col[1], "30", sep = ""), border = FALSE)
  abline(h = CVaR(x, probs = 0.05), col = col[1], lwd = 3)

  rect(0, mean(x) - sd(x), n, mean(x) + sd(x), col = paste(col[2], "40", sep = ""), border = FALSE)
  abline(h = mean(x), col = col[2], lwd = 3, lty = 1)
  box(col = "darkgrey", lwd = 1.5)
  axis(2, col = "darkgrey")
  if(x.axis) axis(1, col = "darkgrey")
   #mtext(paste("CV = ", round(CV(x),2)), side = 1, line = -1.5, cex = 0.7, adj = 0.02)
  #mtext(paste("CV = 0.2"), side = 1, line = -1.5, cex = 0.7, adj = 0.02)

# main data:
  lines(x, pch = 20, lwd = 1, col = "#00000070")
  points(x, pch = 20, col = "#000000", cex = 0.8)

  mtext(risk.level, side = 3, line = -1.20, adj = 0.02, cex = 0.8)
}

gelman.par <- function() {
  par(mar = c(2.75, 2.75, 0.5, 0.5) + 0.1)
par(mgp = c(2, 0.6, 0)) # title and axis label distances - make them closer
par(tck = -0.012) # shorten the tick length
}

plot.skewness <- function(filename, ...) {
set.seed(29)
pdf(filename, width = 3.75, height = 4.5)
par(mfrow = c(3, 1))
par(las = 1)
gelman.par()
par(tck = -0.017)
par(mgp = c(2, 0.3, 0))
par(cex = 0.7, mar = c(0, 0, 0, 0), oma = c(2.75, 2.75, 0.5, 0.75))
plot.sim.skew.dat(xi = 10000, x.axis = FALSE, risk.level = "Low risk", ...)
plot.sim.skew.dat(xi = 1, x.axis = FALSE, risk.level = "Medium risk",  ...)
plot.sim.skew.dat(xi = 0.0001, x.axis = TRUE, risk.level = "High risk", ...)
par(xpd = NA)
mtext("Time", side = 1, line = 1.5, outer = T, cex = 0.8)
par(las = 0)
mtext("Returns", side = 2, line = 1.5, outer = T, cex = 0.8)
par(las = 1)
par(xpd = FALSE)
dev.off()
}

plot.skewness("skewness-abundance.pdf")
#plot.skewness("skewness-georeturns2.pdf", geo.returns = TRUE)



