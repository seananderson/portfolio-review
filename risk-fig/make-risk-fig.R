library(dplyr)
library(PBSmapping)

axis.col <- "grey30"
line.col <- "grey65"
# Some variance and risk metrics:

# Variance at Risk:
var_ <- function(x, probs = 0.05) quantile(x,probs=probs)
# Conditional Value at Risk:
cvar <- function(x, probs = 0.05) mean(x[x<var_(x, probs = probs)])
# Coefficient of Variation:
cv <- function(x) sd(x)/abs(mean(x))
# Semideviation:
semideviation <- function(x) {
  x.low <- x[x < mean(x)]
  n <- length(x)
  sqrt(sum((x.low - mean(x))^2)/n)
}
#' ggplot2-like colour scale in HCL space
#'
#' @param n Number of colours to return.
#' @param hue_min Minimum hue value in the range [0,360]
#' @param hue_max Maximum hue value in the range [0,360]
#' @param l Luminance in the range [0,100]
#' @param c Chroma of the colour.
#' @details See the \code{hcl} function for details.
#' @examples
#' gg_color_hue(10)
#'
gg_color_hue <- function(n, hue_min = 10, hue_max = 280, l = 62, c = 100) {
  hues = seq(hue_min, hue_max, length=n+1)
  hcl(h=hues, l=l, c=c)[1:n]
}


# A function to plot skew-normal data:
# (imports rsnorm() from the fGarch package)
plot_sim_skew <- function(n = 165, mean = 0, sd = 0.7, xi = 1,
  x.axis = TRUE, risk.level = "Risk level") {
  x <- fGarch::rsnorm(n, mean = mean, sd = sd, xi = xi)
  plot((0:(length(x)-1)), x, type = "n", pch = 20, ylim = c(-3.0, 3.0),
    axes = FALSE, xaxs = "i", yaxs = "i")
  rect(0, min(x), n, var_(x), col = var_col, border = FALSE)
  abline(h = cvar(x, probs = 0.05), col = cvar_col, lwd = 3, lty = 1)
  rect(0, mean(x) - sd(x), n, mean(x) + sd(x), col = sd_col, border = FALSE)
  abline(h = mean(x), col = mean_col, lwd = 2.5, lty = 2)
  box(col = line.col, lwd = 1)
  lines(x, pch = 20, lwd = 1.2, col = "grey35")
  #points(x, pch = 20, col = "#000000", cex = 0.4)
  mtext(risk.level, side = 3, line = -1.20, adj = 0.02, cex = 0.8, col = axis.col)
}

pdf("risk-fig-bw.pdf", width = 7.0, height = 5.4)
# setup panel layout:
split.screen(c(1, 2))
split.screen(c(3, 1), screen = 1)
split.screen(c(2, 1), screen = 2)

#### colour version:
#col <- RColorBrewer::brewer.pal(4, "Dark2")[c(1, 4, 3)]
#col <- c(col, "#9FD4C4") # VaR; a lighter version of CVaR colour
#col <- gg_color_hue(3)[c(1, 3, 2)]
col <- RColorBrewer::brewer.pal(6, "Paired")
var_col <- col[5]
cvar_col <- col[6]
mean_col <- col[2]
sd_col <- col[1]
semidev_col <- col[3]

#### black and white version:
var_col <- "#D9D9D9"
cvar_col <- "#212121"
mean_col <- "#212121"
sd_col <- "#D9D9D9"
semidev_col <- "#797979"

left_par <- function() {
  par(las = 1)
  par(tck = -0.017)
  par(mgp = c(2, 0.4, 0))
  par(cex = 0.7, mar = c(0, 0, 0, 3), oma = c(10, 3.0, 2, 1))
}

right_par <- function() {
  par(las = 1)
  par(tck = -0.017)
  par(mgp = c(2, 0.4, 0))
  par(cex = 0.7, mar = c(0, 1.5, .3, 0), oma = c(10, 3.0, 1.7, 1))
}

# Downside risk vs. symmetric variability simulation panel:
set.seed(2)
screen(3);left_par()
plot_sim_skew(xi = 0.0001, x.axis = TRUE, risk.level = "(a) High risk")
mtext("Simulated time series; same CV, different risk", side = 3, line = 0.5, outer = FALSE, cex = 0.8, col = axis.col)
par(las = 1)
par(xpd = NA)
text(162, 0.7, expression(sigma), pos = 4, cex = 1.1, col = axis.col)
text(162, -0.1, expression(mu), pos = 4, cex = 1.1, col = axis.col)
text(162, -1.4, "VaR", pos = 4, cex = 1.1, col = axis.col)
text(162, -2.2, "CVaR", pos = 4, cex = 1.1, col = axis.col)
par(xpd = FALSE)
screen(4);left_par()
plot_sim_skew(xi = 1, x.axis = FALSE, risk.level = "(b) Medium risk")
screen(5);left_par()
plot_sim_skew(xi = 10000, x.axis = FALSE, risk.level = "(c) Low risk")
par(xpd = NA)
mtext("Time", side = 1, line = 0.6, outer = FALSE, cex = 0.8, col = axis.col)
par(las = 0)
mtext("Abundance or growth rate", side = 2, line = 0.5, outer = T, cex = 0.8, col = axis.col, adj = 0.5)


par(xpd = FALSE)

# Fraser River downside risk vs. symmetric variability panel
so <- read.table("Dorner_etal_2008_sockeye_salmon.tsv", comment = "#",
  sep = "\t", header = TRUE)
names(so) <- tolower(names(so))
so <- subset(so, !is.na(returns))
so <- tbl_df(so)
# spr = spawners per recruit:
so <- dplyr::mutate(group_by(so, stock), spr = log(returns/spawners))
fr <- dplyr::filter(so, region == "Fraser")
fr <- dplyr::mutate(group_by(fr, stock), spr_diff = c(NA, diff(spr)))
fr <- dplyr::filter(fr, !is.na(spr_diff))
frr <- dplyr::summarise(group_by(fr, stock),
  cvar          = abs(cvar(spr_diff, probs = .1)),
  var_          = abs(var_(spr_diff, probs  = .1)),
  semideviation = semideviation(spr_diff),
  cv            = cv(spr_diff))

frr_rel <- data.frame(stock = frr[,1],
  apply(frr[ , -1], 2, function(x) x/max(x)))
fr_risk <- dplyr::arrange(frr_rel, cvar)
row.names(fr_risk) <- fr_risk$stock
fr_risk$stock <- NULL
fr_risk$stock_id <- 1:nrow(fr_risk)
fr_risk$stock <- row.names(fr_risk)



## bring in map data
library(maps)
library(maptools)
library(rgdal)
library(raster)

# BC.lim <- readOGR(dsn="map-data", layer="BC_limit")
# Fraser.WS <- readOGR(dsn="map-data", layer="Fraser_WS")
# Tribs <- readOGR(dsn="map-data", layer="Tribs")
# saveRDS(Tribs, file = "Tribs.rds")
# saveRDS(BC.lim, file = "BC.lim.rds")
# saveRDS(Fraser.WS, file = "Fraser.WS.rds")
#
          Tribs <- readRDS("Tribs.rds")
          Fraser.WS <- readRDS("Fraser.WS.rds")
          BC.lim <- readRDS("BC.lim.rds")


sl <- read.csv("fraser-locations.csv", stringsAsFactors = FALSE, header = TRUE, strip.white = TRUE)

convert_dec <- function(x){
  x2 <- as.numeric(strsplit(x, " ")[[1]])
  x2[1] + x2[2]/60 + x2[3]/3600
}

sl$lat <- sapply(sl$lat, convert_dec)
sl$long <- sapply(sl$long, convert_dec)
sl$long <- -1 * sl$long

sl <- plyr::join(sl, fr_risk, by = "stock")

# move Cultus up a tiny bit to get on map:
sl[sl$stock == "Cultus", "lat"] <- sl[sl$stock == "Cultus", "lat"] + 0.1
sl[sl$stock == "Cultus", "long"] <- sl[sl$stock == "Cultus", "long"] + -0.2

# separate early and late stuart so they both show up:
sl[sl$stock == "Early Stuart", "lat"] <- sl[sl$stock == "Early Stuart", "lat"] - 0.5
sl[sl$stock == "Early Stuart", "long"] <- sl[sl$stock == "Early Stuart", "long"] + 0.2

# move birken over a bit to the left to make room:
sl[sl$stock == "Birken", "long"] <- sl[sl$stock == "Birken", "long"] - 0.2

# move Portage over a bit to the right to make room:
sl[sl$stock == "Portage", "long"] <- sl[sl$stock == "Portage", "long"] + 0.2

# fix Seymour co-ordinates, these ones are from Google Maps:
sl[sl$stock == "Seymour", "long"] <- -122.948
sl[sl$stock == "Seymour", "long"] <- sl[sl$stock == "Seymour", "long"] - 0.3
sl[sl$stock == "Seymour", "lat"] <- 49.372

# birken = birkenhead

sl[sl$stock == "Birken", "stock"] <- "Birkenhead"
fr_risk[fr_risk$stock == "Birken", "stock"] <- "Birkenhead"

coordinates(sl) <- c("long", "lat")
proj4string(sl) <- "+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs +towgs84=0,0,0"

trib_col <- "grey25"

Tribs.5 <- subset(Tribs, STRMRDR >4)
Tribs.6 <- subset(Tribs, STRMRDR >5)
Tribs.7 <- subset(Tribs, STRMRDR >6)
Tribs.8 <- subset(Tribs, STRMRDR >7)
Tribs.9 <- subset(Tribs, STRMRDR >8)

screen(7);right_par()
plot(1, 1, type = "n", xlim = c(c(1, nrow(fr_risk)) + c(-0.1, 0.1)), ylim
  = c(0, 1), yaxs = "i", xaxs = "i", xlab = "", ylab = "",
  xaxt = "n", axes = F)
axis(2, col = line.col, col.axis = axis.col)
box(col = line.col, lwd = 1)

lty <- c(5, 3, 1, 1)
lwd <- rep(2.4, 99)

risk_types <- c("cv", "semideviation", "var_","cvar")
risk_types_pretty <- c("CV", "Semideviation", "VaR", "CVaR")
colours_ <- c(sd_col, semidev_col, var_col, cvar_col)
i <- 0
for(ii in risk_types) {
  i <- i + 1
  if(ii == "cvar") colour <- cvar_col
  if(ii == "cv") colour <- sd_col
  if(ii == "semideviation") colour <- semidev_col
  if(ii == "var_") colour <- var_col
  column_i <- which(ii == names(fr_risk))
  lines(1:nrow(fr_risk), fr_risk[,column_i], col = colour,
    lwd = lwd[i], lty = lty[i])
}
par(las = 2)

fr_risk_labels <- fr_risk$stock
fr_risk_labels[10:length(fr_risk_labels)] <- paste0(fr_risk_labels[10:length(fr_risk_labels)], "  ")

axis(1, at = 1:nrow(fr_risk), labels = fr_risk_labels, col = line.col, mgp = c(2, 1.3, 0), cex.axis = 1, col.axis = axis.col)
axis(1, at = 1:nrow(fr_risk), labels = fr_risk$stock_id, mgp = c(2, 0.5, 0), cex.axis = 1, col.axis = "grey70", tick = FALSE)
legend_order <- c(1, 2, 3, 4)

# label lines:
text(5, 0.34, "CV", col = axis.col, cex = 1.05)
text(8, 0.4, "VaR", col = axis.col, cex = 1.05)
text(4.8, 0.67, "Semideviation", col = axis.col, cex = 1.05)
text(10.4, 0.64, "CVaR", col = axis.col, cex = 1.05)

mtext("Scaled risk or variability", side = 2, cex = 0.8, las = 0, line = 2.1, col = axis.col)
mtext("(e)", side = 3, adj = 0.01, col = axis.col, cex = 0.8, las = 0, line = -1.2)
par(xpd = NA)

start_pos <- -0.25
start_x <- -16.8
line_space <- 0.1
table_cex <- 1.15
table_col <- axis.col
text(start_x, start_pos - line_space, "CV: standard deviation divided by the mean", pos = 4, cex = table_cex, col = table_col)
text(start_x, start_pos - 2*line_space, "VaR: value at a given percentile of loss", pos = 4, cex = table_cex, col = table_col)
text(start_x, start_pos - 3*line_space, "CVaR: mean value below the VaR", pos = 4, cex = table_cex, col = table_col)
text(start_x, start_pos - 4*line_space, "Semideviation: standard deviation of values below the mean", pos = 4, cex = table_cex, col = table_col)



screen(6);right_par()
plot(BC.lim, xlim=c(-124, -122), ylim=c(49.15,55.9), axes = FALSE, las = 1,
  bty = "n", lwd=0.5, col = "grey75", border = FALSE)
rect(-122, 51, -116, 57, col = "grey75", border = FALSE)

plot(Fraser.WS, col="grey55", add=TRUE, lwd = 0.5, border = FALSE)
    plot(Tribs.6, axes=TRUE, add=TRUE, lwd=0.45, col = trib_col)
    plot(Tribs.7, axes=TRUE, add=TRUE, lwd=0.75, col = trib_col)
    plot(Tribs.8, axes=TRUE, add=TRUE, lwd=1, col = trib_col)
    plot(Tribs.9, axes=TRUE, add=TRUE, lwd=1.25, col = trib_col)

text(sl, labels = sl$stock_id, pos = 4, cex = 0.9, col = "white")

mtext("Fraser River sockeye salmon stocks", side = 3, line = 0.5, outer = FALSE, cex = 0.8, col = axis.col)
mtext("(d)", side = 3, adj = 0, col = axis.col, cex = 0.8, las = 0, line = -1.2)

par(bg = "white", fig = c(0.845, 0.9845, 0.73, 0.9615), new = TRUE, mar = c(0,0,0,0), oma = c(0,0,0,0))
data(worldLL)
PBSmapping::plotMap(worldLL, xlim = c(190,312), ylim = c(13,86.5), col = "grey75", border = NA, tckMinor = 0, axes = FALSE, lwd=0.1, xlab = "", ylab = "")
rect(360-135, 49.15, 360-118, 54.7, lwd = 0.8, border = "grey10")
box(col = line.col, lwd = 0.8)




close.screen(all.screens = TRUE)

dev.off()
