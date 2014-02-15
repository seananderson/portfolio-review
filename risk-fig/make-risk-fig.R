library(dplyr)

axis.col <- "grey30"
line.col <- "grey50"
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
  abline(h = cvar(x, probs = 0.05), col = cvar_col, lwd = 3)
  rect(0, mean(x) - sd(x), n, mean(x) + sd(x), col = sd_col, border = FALSE)
  abline(h = mean(x), col = mean_col, lwd = 3, lty = 1)
  box(col = line.col, lwd = 1)
  lines(x, pch = 20, lwd = 1.2, col = "grey35")
  #points(x, pch = 20, col = "#000000", cex = 0.4)
  mtext(risk.level, side = 3, line = -1.20, adj = 0.02, cex = 0.8, col = axis.col)
}

pdf("risk-fig.pdf", width = 7.0, height = 4.5)
# setup panel layout:
split.screen(c(1, 2))
split.screen(c(3, 1), screen = 1)
split.screen(c(2, 1), screen = 2)

#col <- RColorBrewer::brewer.pal(4, "Dark2")[c(1, 4, 3)]
#col <- c(col, "#9FD4C4") # VaR; a lighter version of CVaR colour
#col <- gg_color_hue(3)[c(1, 3, 2)]
col <- RColorBrewer::brewer.pal(6, "Paired")
var_col <- col[5]
cvar_col <- col[6]
mean_col <- col[2]
sd_col <- col[1]
semidev_col <- col[3]

left_par <- function() {
  par(las = 1)
  par(tck = -0.017)
  par(mgp = c(2, 0.4, 0))
  par(cex = 0.7, mar = c(0, 0, 0, 3), oma = c(6, 2.5, 2, 1))
}

right_par <- function() {
  par(las = 1)
  par(tck = -0.017)
  par(mgp = c(2, 0.4, 0))
  par(cex = 0.7, mar = c(0, 1.5, 0, 0), oma = c(6, 2.5, 2, 1))
}

# Downside risk vs. symmetric variability simulation panel:
set.seed(140)
screen(3);left_par()
plot_sim_skew(xi = 10000, x.axis = FALSE, risk.level = "(a) Low risk")
mtext("Simulated time series - same CV, different risk", side = 3, line = 0.5, outer = FALSE, cex = 0.8, col = axis.col)
screen(4);left_par()
plot_sim_skew(xi = 1, x.axis = FALSE, risk.level = "(b) Medium risk")
screen(5);left_par()
plot_sim_skew(xi = 0.0001, x.axis = TRUE, risk.level = "(c) High risk")
par(xpd = NA)
mtext("Time", side = 1, line = 1.0, outer = FALSE, cex = 0.8, col = axis.col)
par(las = 0)
mtext("Abundance or growth rate", side = 2, line = 1.0, outer = T, cex = 0.8, col = axis.col)
par(las = 1)
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

screen(7);right_par()
plot(1, 1, type = "n", xlim = c(c(1, nrow(fr_risk)) + c(-0.1, 0.1)), ylim
  = c(0, 1), yaxs = "i", xaxs = "i", xlab = "", ylab = "",
  xaxt = "n", axes = F)
axis(2, col = line.col, col.axis = axis.col)
box(col = "grey40", lwd = 1)

#col <- c("#000000", col)
lty <- rep(1, 99)
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
  #points(1:nrow(fr_risk), fr_risk[,column_i], col = colour, pch = 20,
    #cex = 1.4)
}
par(las = 2)
axis(1, at = 1:nrow(fr_risk), labels = rownames(fr_risk), col = line.col, mgp = c(2, 0.5, 0), cex.axis = 1.1, col.axis = axis.col)
legend_order <- c(1, 2, 3, 4)
legend(3, 1.02, risk_types_pretty[legend_order], col = colours_[legend_order], lwd = lwd[legend_order], lty = lty[legend_order], bty = "n",
  cex = 1, text.col = axis.col)
mtext("Relative risk or variability", side = 2, cex = 0.8, las = 0, line = 2.1, col = axis.col)
mtext("(e)", side = 3, adj = 0.01, col = axis.col, cex = 0.8, las = 0, line = -1.2)
par(xpd = NA)

mtext("<Insert map here>", side = 3, line = 6, las = 0, cex = 0.8, col = axis.col)
mtext("(d)", side = 3, adj = 0.01, col = axis.col, cex = 0.8, las = 0, line = 11)

screen(6);right_par()
mtext("Fraser River sockeye salmon", side = 3, line = 0.5, outer = FALSE, cex = 0.8, col = axis.col)

close.screen(all.screens = TRUE)

dev.off()

#fr_agg <- summarise(group_by(ungroup(fr), brood_year),
  #total_returns = sum(returns),
  #total_spawners = sum(spawners),
  #total_log_spr = log(total_spawners/total_returns))
#fr_agg <- na.omit(dplyr::mutate(fr_agg, spr_diff = c(NA, diff(total_log_spr))))
#port_mean <- mean(fr_agg$spr_

########################################################################
#### fix from here down:
#fig.letter("a", brackets = F, cex = 1, adj = 0.02)
# risk.by.stock <- apply(fr.risk[,-1], 2, mean)
# risk.by.stock <- apply(fr.risk[,-1], 2, quantile)
# se.by.stock <- apply(fr.risk[,-1], 2, se)
# fr.agg <- ddply(fr, "BY", summarize, log.SR = log(sum(S)/sum(R)))
# risk.agg <- data.frame(CVaR = abs(CVaR(diff(fr.agg[,2]))), VaR = abs(VaR(diff(fr.agg[,2]))), Semideviation = semideviation(diff(fr.agg[,2])), CV = CV(diff(fr.agg[,2])))
# risk.by.stock.scaled <- adply(risk.by.stock, 1, function(x) x/risk.agg)
# risk.agg.scaled <- risk.agg/risk.agg
#
# temp <- risk.by.stock.scaled[3,-1] # for ordering
#
# risk.by.stock.scaled <- risk.by.stock.scaled[,-1][,order(temp)]
# risk.agg.scaled <- risk.agg.scaled[order(temp)]
# row.names(risk.agg) <- NULL
