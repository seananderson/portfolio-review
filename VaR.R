VaR <- function(x, probs = 0.05) quantile(x,probs=probs, na.rm = TRUE)
