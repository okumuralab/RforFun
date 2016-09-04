ROC = function(score, actual, add=FALSE,
               col="black", col.area="", type="l", pch=16) {
  o = order(score, decreasing=TRUE)
  fp = tp = fp_prev = tp_prev = 0
  nF = sum(actual == FALSE)
  nT = sum(actual == TRUE)
  score_prev = -Inf
  ber_min = Inf
  area = 0
  rx = ry = numeric(length(o))
  n = 0
  for (i in seq_along(o)) {
    j = o[i]
    if (score[j] != score_prev) {
      area = area + (fp - fp_prev) * (tp + tp_prev) / 2
      n = n + 1
      rx[n] = fp/nF
      ry[n] = tp/nT
      ber = (fp/nF + 1 - tp/nT)/2
      if (ber < ber_min) {
        ber_min = ber
        th = score_prev
        rx_best = fp/nF
        ry_best = tp/nT
      }
      score_prev = score[j]
      fp_prev = fp
      tp_prev = tp
    }
    if (actual[j] == TRUE) {
      tp = tp + 1
    } else {
      fp = fp + 1
    }
  }
  area = area + (fp - fp_prev) * (tp + tp_prev) / 2
  n = n + 1
  rx[n] = fp/nF  # = 1
  ry[n] = tp/nT  # = 1
  if (!add) {
    plot(NULL, xlim=c(0,1), ylim=c(0,1), asp=1,
         xlab="False Positive", ylab="True Positive",
         xaxs="i", yaxs="i")
    abline(h=(1:9)/10, v=(1:9)/10, col=gray(0.9))
    abline(0, 1, col=gray(0.4))
    abline(h=0:1, v=0:1)
  }
  t = (rx_best + ry_best)/2
  abline(ry_best-rx_best, 1, col=gray(0.8))
  lines(c(rx_best, t), c(ry_best, t), col=gray(0.8))
  if (col.area != "") {
    polygon(c(rx[1:n],1), c(ry[1:n],0), col=col.area)
  }
  lines(rx[1:n], ry[1:n], type=type, lwd=2, col=col, pch=pch, xpd=TRUE)
  cat("AUC =", area/(nF*nT), "th =", th, "\n")
  cat("BER =", (rx_best + (1-ry_best))/2,
      "OR =", (ry_best/(1-ry_best))/(rx_best/(1-rx_best)), "\n")
  print(table(score >= th, actual, dnn=c("Predicted","Actual")))
  invisible(list(rx=rx, ry=ry, AUC=area/(nF*nT), th=th))
}
