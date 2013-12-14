CVaR <- function(x, probs = 0.05) mean(x[x<VaR(x, probs = probs)])
