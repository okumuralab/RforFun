# 『Rで楽しむベイズ統計入門』コード

## 第1章 Rで遊ぶ

### 1.1 Rとは

### 1.2 簡単な計算

```
> 123 + 456
[1] 579
```

```
> 123 * 456 - 987 / (654 + 321)
[1] 56086.99
```

```
> pi          # これは円周率
[1] 3.141593
> print(pi)   # これでも同じこと
[1] 3.141593
> print(pi, digits=16) # 桁数を増やしたい
[1] 3.141592653589793
```

```
> x = 12345   # 代入
> x <- 12345  # これでも同じ
> x
[1] 12345
```

```
x = 12345
sqrt(x)
```

```
> x = 12345
> x           # 小文字
[1] 12345
> X           # 大文字
 エラー:  オブジェクト 'X' がありません
```

```
> pi          # 円周率
[1] 3.141593
> pi = 3      # いたずらをしてやろう
> pi
[1] 3
> rm(pi)      # 自分で定義したほうをrm（remove，削除）すると
> pi          # 元のpiに戻る
[1] 3.141593
```

```
> x = 5:70  # xに長いベクトル (5,6,7,8,...,70) を代入
> x         # 表示させてみる
 [1]  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21
[18] 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38
[35] 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55
[52] 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70
```

```
> x = c(3.14, 2.718, 0.577)
> x
[1] 3.140 2.718 0.577
> x + 10     # 演算は個々の要素に作用する
[1] 13.140 12.718 10.577
> x * 10     # * は掛け算の記号
[1] 31.40 27.18  5.77
> sqrt(x)    # 関数も個々の要素に作用する。sqrt()は平方根
[1] 1.7720045 1.6486358 0.7596052
> length(x)  # ベクトルの長さ
[1] 3
> sum(x)     # 和
[1] 6.435
> mean(x)    # 平均
[1] 2.145
> sd(x)      # 標準偏差
[1] 1.374223
> x[1]       # 配列の第1要素
[1] 3.14
> x[2:3]     # 配列の第2〜3要素
[1] 2.718 0.577
```

### 1.3 ヘルプと終了

```
> help.start()
```

```
> help(mean)
```

```
> ?mean
```

```
.Last = function() if (interactive()) try(savehistory(".Rhistory"))
```

```
.Last = function() if (interactive()) try(savehistory("~/.Rhistory"))
```

### 1.4 データの入力

```
> 身長 = c(168.5, 172.8, 159.0)
> 体重 = c(69.5, 75.0, 56.5)
```

```
> 体重 / (身長 / 100)^2
[1] 24.47851 25.11735 22.34880
```

```
> round(体重 / (身長 / 100)^2)
[1] 24 25 22
> round(体重 / (身長 / 100)^2, 1)
[1] 24.5 25.1 22.3
```

```
> rep(7, 10)
 [1] 7 7 7 7 7 7 7 7 7 7
> rep(c(1,2), 10)
 [1] 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1 2
```

```
> x = rep(1:5, c(2,3,4,3,2))  # 1,2,3,4,5がそれぞれ2,3,4,3,2個
> x
 [1] 1 1 2 2 2 3 3 3 3 4 4 4 5 5
> y = rep(1:5, c(0,2,4,5,3))
> y
 [1] 2 2 3 3 3 3 4 4 4 4 4 5 5 5
> table(x)     # 見やすい表にして表示
x
1 2 3 4 5 
2 3 4 3 2 
> t.test(x, y) # t検定をする
```

### 1.5 データフレーム

```
> 身長 = c(168.5, 172.8, 159.0)
> 体重 = c(69.5, 75.0, 56.5)
> X = data.frame(身長, 体重)
> X
   身長 体重
1 168.5 69.5
2 172.8 75.0
3 159.0 56.5
```

```
> row.names(X) = c("太郎", "二郎", "三郎")
```

```
> X$身長
[1] 168.5 172.8 159.0
```

```
> X[1, ]               # 行を指定
   身長 体重
1 168.5 69.5
> X[ ,1]               # 列を指定
[1] 168.5 172.8 159.0
> X[1,1]               # 行・列を指定
[1] 168.5
```

```
> X$性別=c("M", "M", "F")
> X
   身長 体重 性別
1 168.5 69.5    M
2 172.8 75.0    M
3 159.0 56.5    F
```

```
> X$BMI = round(X$体重 / (X$身長 / 100)^2)
> X
   身長 体重 性別 BMI
1 168.5 69.5    M  24
2 172.8 75.0    M  25
3 159.0 56.5    F  22
```

### 1.6 ファイルの読み書きと文字コード

```
write.csv(X, "X.csv", quote=FALSE, row.names=FALSE,
          fileEncoding="CP932", eol="\r\n")
```

```
身長,体重,性別,BMI
168.5,69.5,M,24
172.8,75,M,25
159,56.5,F,22
```

```
> Y = read.csv("X.csv", fileEncoding="CP932")
```

```
con = file("X.csv", "r", encoding="UTF-8")
X = readLines(con)
close(con)
con = file("Y.csv", "w", encoding="CP932")
writeLines(X, con, sep="\r\n")
close(con)
```

```
> X = read.csv("D:/work/X.csv")  # 絶対パス指定で読む場合 (Windows)
> X = read.csv("http://okumuralab.org/~okumura/stat/data/coal.csv") # URL指定
```

```
options(stringsAsFactors=FALSE)  # 文字列をファクターに変換しない
```

### 1.7 図の描き方

```
> x = rnorm(1000000)
```

```
> hist(x)
```

```
> hist(x, col="gray", main="ヒストグラムの例")
```

```
par(family="HiraKakuProN-W3")
```

```
par(mar=c(5,4,4,2)+0.1) # 下・左・上・右マージン
par(mgp=c(3,1,0)) # 軸マージン
par(las=0) # 軸ラベルの向き。1にするとy軸のラベルも水平になる
```

```
quartz(type="pdf", file="hist.pdf", width=7, height=4) # 7×4インチ
par(family="HiraKakuProN-W3", mgp=c(2,0.8,0), mar=c(3,3,2,2)+0.1)
x = rnorm(1000000)
hist(x, col="gray", main="ヒストグラムの例")
dev.off()
```

```
all: hist.pdf hoge.pdf fuga.pdf

.SUFFIXES: .pdf .R

.R.pdf:
        Rscript $<
```

```
SRC=$(wildcard *.R)

PDF=$(SRC:.R=.pdf)

all: $(PDF)
```

```
args = commandArgs()
basename = sub("\\.R$", "",
               sub("^--file=(.*/)?", "", args[grep("^--file=", args)]))
quartz(type="pdf", file=paste0(basename, ".pdf"), width=7, height=4)
```

```
nohup R CMD BATCH hoge.R &
```

### 1.8 パッケージの例：Excelファイルを読む

```
> install.packages("readxl")
```

```
options(repos="https://cran.ism.ac.jp")
```

```
> library(readxl)  # または library("readxl")
```

```
pkg = "readxl"
if (!require(pkg, character.only=TRUE)) {
    install.packages(pkg)
    library(pkg, character.only=TRUE)
}
```

```
x = read_excel("test.xlsx")
```

```
> names = dir(pattern="*.xlsx")
> alldata = do.call(rbind, lapply(names, read_excel))
```

```
> detach(package:readxl)
```

```
> update.packages()
```

## 第2章 統計の基礎

### 2.1 尺度水準

### 2.2 代表値

```
> X = c(0, 7, 8, 9, 100)
> mean(X)
[1] 24.8
```

```
> Y = c(0, 7, 8, NA, 0/0)
> Y
[1]   0   7   8  NA NaN
> mean(Y)
[1] NA
> mean(Y, na.rm=TRUE)  # NAもNaNも削除してくれる
[1] 5
```

```
> mean(X, trim=0.2)
[1] 8
```

```
> median(X)
[1] 8
```

### 2.3 確率変数，乱数，母集団，標本

```
> X = c(1,2,3,4,5)
> Y = c(5,3,1,8,9)
> mean(2 * X + 3 * Y)
[1] 21.6
> 2 * mean(X) + 3 * mean(Y)
[1] 21.6
```

### 2.4 分散と標準偏差

```
> X = c(1,2,3,4,5)
> Y = c(5,3,1,3,5)
> var(2 * X + 3 * Y)
[1] 35.2
> 4 * var(X) + 9 * var(Y)
[1] 35.2
```

```
> x = 1:5   # x = c(1,2,3,4,5) と同じ
```

```
> var(x)    # n-1 で割る分散
[1] 2.5
```

```
> var(c(2,3,4,5))  # 1を外す
[1] 1.666667
> var(c(1,3,4,5))  # 2を外す
[1] 2.916667
> var(c(1,2,4,5))  # 3を外す
[1] 3.333333
> var(c(1,2,3,5))  # 4を外す
[1] 2.916667
> var(c(1,2,3,4))  # 5を外す
[1] 1.666667
```

```
> mean(c(1.666667, 2.916667, 3.333333, 2.916667, 1.666667))
[1] 2.5
```

```
> varp = function(x) { var(x) * (length(x)-1) / length(x) }  # 関数を作る
> varp(1:5)  # 作った関数を使ってみる
[1] 2
> var(1:5)   # こちらはRに元からある関数
[1] 2.5
```

```
> x = 1:10
> sd(x)
[1] 3.027650
```

```
> x = 1:9
> quantile(x)  # 1 3 5 7 9
> fivenum(x)   # 1 3 5 7 9
```

```
> y = c(1, 2, 4, 8, 16, 32)
> quantile(y)  # 1 2.5 6 14 32
> fivenum(y)   # 1  2  6 16 32
```

### 2.5 中心極限定理と正規分布

```
> runif(1)
[1] 0.388267
> runif(10)
 [1] 0.2146394 0.2765450 0.5433135 0.4784538 0.8147103 0.1141375
 [7] 0.6488306 0.7947468 0.1698610 0.2440027
```

```
> X = runif(1000000)  # 百万個の乱数
> hist(X, freq=FALSE) # ヒストグラム（度数分布図）を描く
```

```
> hist(X, freq=FALSE, col="gray", breaks=50)
```

```
> X = runif(1000000) + runif(1000000)
> hist(X, freq=FALSE)
```

```
> X = runif(1000000) + runif(1000000) + runif(1000000)
> hist(X, freq=FALSE)
```

```
(1 / sqrt(2 * pi)) * exp(-x^2 / 2)
```

```
X = runif(1000000) + …中略… + runif(1000000) - 6  # 12個
hist(X, freq=FALSE)
```

```
curve(dnorm(x), add=TRUE)
```

```
> integrate(function(x){exp(-x^2/2)}, -Inf, +Inf)
2.506628 with absolute error < 0.00023
> sqrt(2 * pi)
[1] 2.506628
```

```
> pnorm(1) - pnorm(-1)
[1] 0.6826895
```

```
> 1 - 2 * pnorm(-1)
[1] 0.6826895
```

```
> 1 - 2 * pnorm(-2)
[1] 0.9544997
> 1 - 2 * pnorm(-3)
[1] 0.9973002
```

```
> qnorm(0.975)
[1] 1.959964
> qnorm(0.995)
[1] 2.575829
```

```
> x = read.csv("data/rika_hist.csv")
> n = sum(x$生徒数)
> barplot(x$生徒数/n, names.arg=x$正答数)
```

### 2.6 コーシー分布

```
curve(dnorm(x), xlim=c(-3,3), ylim=c(0,0.4), xlab="", ylab="",
      frame.plot=FALSE, yaxs="i")
curve(dcauchy(x), lwd=2, add=TRUE)
text(0.3, 0.16, "Cauchy")
text(1.2, 0.35, "Normal")
```

```
x = rcauchy(1000000)
```

### 2.7 正規分布から導かれる分布

## 第3章 2項分布，検定，信頼区間

### 3.1 2項分布

```
> factorial(10) / (factorial(3) * factorial(7))
[1] 120
> choose(10, 3)
[1] 120
```

```
> choose(10,3) * 0.4^3 * 0.6^7
[1] 0.2149908
> dbinom(3, 10, 0.4)
[1] 0.2149908
```

```
> dbinom(0:10, 10, 0.5)
 [1] 0.0009765625 0.0097656250 0.0439453125 0.1171875000
 [5] 0.2050781250 0.2460937500 0.2050781250 0.1171875000
 [9] 0.0439453125 0.0097656250 0.0009765625
```

```
barplot(dbinom(0:10,10,0.5), names.arg=0:10, las=1)
```

```
> pbinom(0:10, 10, 0.5)
 [1] 0.0009765625 0.0107421875 0.0546875000 0.1718750000
 [5] 0.3769531250 0.6230468750 0.8281250000 0.9453125000
 [9] 0.9892578125 0.9990234375 1.0000000000
```

### 3.2 統計的仮説検定の考え方

```
> binom.test(2, 10, 0.5)

        Exact binomial test

data:  2 and 10 
number of successes = 2, number of trials = 10, p-value = 0.1094
...
```

```
> p = sapply(0:10, function(x) binom.test(x, 10, 0.5)$p.value)
> q = dbinom(0:10, 10, 0.5)
> sum(q[p < 0.05])
[1] 0.02148438
```

```
function(x) binom.test(x, 10, 0.5)$p.value
```

### 3.3 統計的仮説検定に関する議論

### 3.4 多重検定

```
> x = replicate(1000000, min(runif(10)))
> mean(x < 0.05)
[1] 0.401067
```

```
> 1:5 < 3        # 1から5までの整数が3より小さいか
[1]  TRUE  TRUE FALSE FALSE FALSE
> sum(1:5 < 3)   # TRUE=1, FALSE=0として合計
[1] 2
> mean(1:5 < 3)  # TRUE=1, FALSE=0として平均
[1] 0.4
```

### 3.5 信頼区間

```
> x = (0:100) / 100   # xを0から1まで0.01刻みに増やして
> y = sapply(x, function(t) binom.test(4, 10, t)$p.value) # p値を求める
> plot(x, y, pch=16)  # 横軸x，縦軸p値でプロット
```

```
> uniroot(function(t)binom.test(4,10,t)$p.value-0.05, c(0.1,0.2))
> uniroot(function(t)binom.test(4,10,t)$p.value-0.05, c(0.6,0.8))
```

```
> x = (0:100) / 100
> y = sapply(x, function(t)binom.test(r,10,t,alternative="less")$p.value)
> points(x, y)
```

```
        Exact binomial test

data:  4 and 10
number of successes = 4, number of trials = 10, p-value = 0.7539
alternative hypothesis: true probability of success is not equal to 0.5
95 percent confidence interval:
 0.1215523 0.7376219
sample estimates:
probability of success 
                   0.4 
```

```
> library(exactci)
> binom.exact(4, 10, tsmethod="minlike")

        Exact two-sided binomial test (sum of minimum likelihood method)

data:  4 and 10
number of successes = 4, number of trials = 10, p-value = 0.7539
alternative hypothesis: true probability of success is not equal to 0.5
95 percent confidence interval:
 0.1500 0.7091
sample estimates:
probability of success 
                   0.4 
```

```
> binom.test(2, 15, 0.4)
```

```
f = function(theta) {
  x = rbinom(100000, 10, theta)
  r = sapply(x, function(u){binom.test(u,10)$conf.int})
  mean(r[1,] <= theta & theta <= r[2,])
}
```

```
CI = sapply(0:10, function(x) binom.test(x,10)$conf.int)
f = function(theta) {
  p = dbinom(0:10, 10, theta)
  sum(p * (CI[1,] <= theta & theta <= CI[2,]))
}
```

### 3.6 2項分布から正規分布へ

### 3.7 検定の例：PISAの「盗難事件」問題

```
> binom.test(508, 508+516, 0.5)

        Exact binomial test

data:  508 and 508 + 516
number of successes = 508, number of trials = 1024, p-value = 0.8269
alternative hypothesis: true probability of success is not equal to 0.5
95 percent confidence interval:
 0.4650308 0.5271792
sample estimates:
probability of success 
             0.4960938 
```

```
> pnorm(-0.25)*2
[1] 0.8025873
```

### 3.8 信頼区間の例

```
> binom.test(200, 1000)

        Exact binomial test

data:  200 and 1000 
number of successes = 200, number of trials = 1000, p-value < 2.2e-16
alternative hypothesis: true probability of success is not equal to 0.5 
95 percent confidence interval:
 0.1756206 0.2261594 
sample estimates:
probability of success 
                   0.2 
```

### 3.9 尤度と最尤法

```
logL = function(t) { 4*log(t) + 6*log(1-t) }
curve(logL(x) - logL(0.4), xlim=c(0,1))
```

```
uniroot(function(x) logL(x) - logL(0.4) + 0.5, c(0,0.4))
```

### 3.10 止め方で結果が変わる？

```
> sum(dbinom(0:2, 10, 0.5))  # 0.0546875
> pbinom(2, 10, 0.5)         # 0.0546875
```

```
> q = choose(0:9, 1) * 0.5^(1:10)
```

```
> 1 - sum(q[2:9])  # 0.01953125
```

```
> 1 - sum(dnbinom(2:9 - 2, 2, 0.5))  # 0.01953125
> 1 - pnbinom(9 - 2, 2, 0.5)         # 0.01953125
```

## 第4章 事件の起こる確率

### 4.1 富の分布

### 4.2 地震の確率

```
> 1 - 0.13^(1/30)
[1] 0.0657464
```

```
> x = c(1498, 1605, 1707, 1854)
> dx = diff(x)
> mean(dx)          # BPTのμ
[1] 118.6667
> sd(dx) / mean(dx) # BPTのα
[1] 0.2078462
> 2011 - x[4]       # 最後の地震からの年数
[1] 157
```

```
> m = 120
> a = 0.2
> bpt = function(t) { (m/(2*pi*a^2*t^3))^(1/2)*exp(-(t-m)^2/(2*a^2*m*t)) }
> integrate(bpt, 157, 187)
0.06356807 with absolute error < 7.1e-16
> integrate(bpt, 157, Inf)
0.07306916 with absolute error < 9.1e-05
> 0.06356807 / 0.07306916
[1] 0.8699713
```

```
> integrate(bpt, 157, 158)
0.004361829 with absolute error < 4.8e-17
> 0.004361829 / 0.07306916
[1] 0.05969453
```

### 4.3 「ランダムに事象が起きる」という考え方

```
plot(c(0,1200), c(0,3), type="n", axes=FALSE, xlab="", ylab="")
axis(1)
r1 = runif(17) * 1200
r2 = runif(38) * 1200
segments(r1, 0.5, r1, 1.5)
segments(r2, 2, r2, 3)
```

```
stripchart(sample(1:50, 500, replace=TRUE),
           pch=16, method="stack", axes=FALSE, at=0)
```

```
sum(10^(7:13) * exp(-10) / factorial(7:13))
```

```
ppois(13,10) - ppois(6,10)
```

```
> poisson.test(10)

        Exact Poisson test

data:  10 time base: 1
number of events = 10, time base = 1, p-value = 1.114e-07
alternative hypothesis: true event rate is not equal to 1
95 percent confidence interval:
  4.795389 18.390356
sample estimates:
event rate 
        10 
```

```
poisson.test(10, conf.level=0.6826895)
```

```
poisson.test(0, conf.level=0.6826895)
```

```
poisson.test(0)
```

```
dx = diff(x)
qqplot(qexp(ppoints(length(dx))), dx)
qqline(dx, distribution=function(p){qexp(p)})
```

### 4.4 バックグラウンドのある場合のポアソン分布

```
binom.test(100, 249, 0.5) # p-value = 0.002285 になる
binom.test(100, 248, 0.5) # p-value = 0.002767 になる
```

### 4.5 カウンタの感度

```
s = mean(x) / var(x) / m
```

```
n = length(x)
x1 = x[1:(n-1)]
x2 = x[2:n]
s = 1 / mean((x1-x2)^2 / (x1+x2)) / m
```

```
rad = read.csv("rad.csv")
mp = names(rad)[-1]  # 列名から1列目（日時）を除いた測定器名
f = function(m) {
    x = rad[,m]
    n = length(x)
    x1 = x[1:(n-1)]
    x2 = x[2:n]
    c(mean(x, na.rm=TRUE), 1 / mean((x1-x2)^2/(x1+x2), na.rm=TRUE) / 10)
}
s = sapply(mp, f)
plot(s[1,], s[2,], log="xy", xlab="μSv/h", ylab="cpm/(μSv/h)")
```

### 4.6 ポアソン分布の信頼区間とその問題点

```
> poisson.test(5)

...
95 percent confidence interval:
  1.623486 11.668332
...
```

```
> 1 - ppois(4, 1.623486)
[1] 0.02499998
> ppois(5, 11.668332)
[1] 0.025
```

```
> poisson.test(5, r=1.623486, alternative="greater")
...
number of events = 5, time base = 1, p-value = 0.025
...
> poisson.test(5, r=11.668332, alternative="less")
...
number of events = 5, time base = 1, p-value = 0.025
...
```

```
plot(NULL, xlim=c(0,20), ylim=c(0,20), xaxs="i", yaxs="i", asp=1,
     xlab=expression(italic(x)), ylab=expression(italic(λ)))
for (lambda in seq(0,20,0.1)) {
    x = qpois(c(0.025,0.975), lambda)
    segments(x[1], lambda, x[2], lambda, col="gray")
}
abline(v=5)
abline(h=1.623486)
abline(h=11.668332)
abline(h=5, lty=2)
axis(4, c(1.623486,11.668332), labels=c(1.6,11.7))
```

```
> poisson.test(7, r=3)

        Exact Poisson test

data:  7 time base: 1
number of events = 7, time base = 1, p-value = 0.03351
alternative hypothesis: true event rate is not equal to 3
95 percent confidence interval:
  2.814363 14.422675
sample estimates:
event rate 
         7 
```

```
plot(NULL, xlim=c(0,20), ylim=c(0,20), xaxs="i", yaxs="i", asp=1,
     xlab=expression(italic(x)), ylab=expression(italic(λ)))
for (lambda in seq(0,20,0.1)) {
    t = sort(dpois(0:100, lambda), decreasing=TRUE)
    s = cumsum(t)
    m = t[sum(s < 0.95) + 1]
    x = range((0:100)[dpois(0:100, lambda) >= m])
    segments(x[1], lambda, x[2], lambda, col="gray")
}
abline(v=5)
abline(h=1.9701)
abline(h=11.7992)
axis(4, c(1.9701,11.7992), labels=c("2.0","11.8"))
```

```
> install.packages("exactci")
> library(exactci)
> poisson.exact(7, r=3, tsmethod="minlike")

        Exact two-sided Poisson test (sum of minimum likelihood method)

data:  7 time base: 1
number of events = 7, time base = 1, p-value = 0.03351
alternative hypothesis: true event rate is not equal to 3
95 percent confidence interval:
  3.2853 14.3402
sample estimates:
event rate 
         7 
```

```
x = (1400:1500)/100
plot(x, sapply(x, function(x){poisson.test(7,r=x)$p.value}), type="p",
     xlab=expression(italic(λ)), ylab=expression(italic(p)))
abline(v=14.3402)
abline(h=0.05)
```

### 4.7 Feldman--Cousinsの信頼区間

```
plot(NULL, xlim=c(0,20), ylim=c(0,20), xaxs="i", yaxs="i", asp=1,
     xlab=expression(italic(x)), ylab=expression(italic(λ)))
for (lambda in seq(0,20,0.1)) {
    r = dpois(0:100, lambda) / dpois(0:100, 0:100)
    o = order(r, decreasing=TRUE)
    t = sort(dpois(0:100, lambda), decreasing=TRUE)
    s = cumsum(dpois(0:100, lambda)[o])
    m = r[o[sum(s < 0.95) + 1]]
    x = range((0:100)[r >= m])
    segments(x[1], lambda, x[2], lambda, col="gray")
}
abline(v=5)
abline(h=1.84)
abline(h=11.26)
axis(4, c(1.84,11.26), labels=c("1.8","11.3"))
```

```
plot(NULL, xlim=c(0,20), ylim=c(0,20), xaxs="i", yaxs="i", asp=1,
     xlab=expression(italic(x)), ylab=expression(italic(λ)))
for (lambda in seq(3,20,0.1)) {
    r = dpois(0:100, lambda) / dpois(0:100, c(3,3,3,3:100))
    o = order(r, decreasing=TRUE)
    t = sort(dpois(0:100, lambda), decreasing=TRUE)
    s = cumsum(dpois(0:100, lambda)[o])
    m = r[o[sum(s < 0.95) + 1]]
    x = range((0:100)[r >= m])
    segments(x[1], lambda, x[2], lambda, col="gray")
}
abline(v=5)
abline(h=3)
abline(h=11.26)
abline(h=4.63)
axis(4, c(3,4.63,11.26), labels=c("3.0","4.6","11.3"))
```

```
fcconf = function(x, b) {
    ret = c(100, 0)
    for (lambda in seq(b,10,0.001)) {
        r = dpois(0:100, lambda) / dpois(0:100, pmax(b,0:100))
        o = order(r, decreasing=TRUE)
        t = sort(dpois(0:100, lambda), decreasing=TRUE)
        s = cumsum(dpois(0:100, lambda)[o])
        m = r[o[sum(s < 0.95) + 1]]
        if (x %in% (0:100)[r >= m]) {
            ret[1] = min(ret[1], lambda-b)
            ret[2] = max(ret[2], lambda-b)
        }
    }
    ret
}
b = (0:500)/100
lambda2 = sapply(b, function(x){fcconf(0,x)})[2,]
plot(b, lambda2, type="l", xlab=expression(italic(b)),
     ylab=expression(italic(λ)[2] - italic(b)))
```

## 第5章 分割表の解析

### 5.1 分割表

### 5.2 フィッシャーの正確検定

```
> choose(4,3) * choose(6,2) / choose(10,5)
[1] 0.2380952
```

```
> fisher.test(matrix(c(3,1,2,4), nrow=2))

        Fisher's Exact Test for Count Data

data:  matrix(c(3, 1, 2, 4), nrow = 2) 
p-value = 0.5238
alternative hypothesis: true odds ratio is not equal to 1 
95 percent confidence interval:
   0.2180460 390.5629165 
sample estimates:
odds ratio 
  4.918388 
```

```
> fisher.test(matrix(c(195,123,61,144, 102,82,38,107), ncol=2))
```

```
> x = data.frame(内向=c(195,123,61,144), 外向=c(102,82,38,107))
> row.names(x) = c("A","B","AB","O")  # 計算には不要だが行に名前を付けると便利
> fisher.test(x)
```

```
> ex1 = matrix(c(6,12,12,5), nrow=2)
```

```
> library(exact2x2)
> fisher.exact(ex1)
```

### 5.3 カイ2乗検定

```
> chisq.test(matrix(c(3,1,2,4), nrow=2))

        Pearson's Chi-squared test with Yates' continuity correction

data:  matrix(c(3, 1, 2, 4), nrow = 2)
X-squared = 0.41667, df = 1, p-value = 0.5186

 警告メッセージ: 
 chisq.test(matrix(c(3, 1, 2, 4), nrow = 2)) で: 
   カイ自乗近似は不正確かもしれません 
```

```
> chisq.test(matrix(c(3,1,2,4), nrow=2), correct=FALSE)
```

### 5.4 オッズ比，相対危険度

### 5.5 相対危険度・オッズ比の求め方

```
> x = matrix(c(231,26,23036,10813), nrow=2)
> x
     [,1]  [,2]
[1,]  231 23036
[2,]   26 10813
```

```
> rownames(x) = c("喫煙", "非喫煙")
> colnames(x) = c("肺がんあり", "肺がんなし")
> x
       肺がんあり 肺がんなし
喫煙          231      23036
非喫煙         26      10813
```

```
> x = matrix(c(12,5,6,12), nrow=2)
> x
     [,1] [,2]
[1,]   12    6
[2,]    5   12
```

```
> (x[1,1]/x[1,2]) / (x[2,1]/x[2,2])
[1] 4.8
> log((x[1,1]/x[1,2]) / (x[2,1]/x[2,2]))
[1] 1.568616
> 1/x[1,1] + 1/x[1,2] + 1/x[2,1] + 1/x[2,2]
[1] 0.5333333
> pnorm(-1.568616 / sqrt(0.5333333)) * 2
[1] 0.03172043
> exp(1.568616 + qnorm(c(0.025,0.975)) * sqrt(0.5333333))
[1]  1.147127 20.084960
```

```
> library(Epi)
> twoby2(x)
2 by 2 table analysis: 
------------------------------------------------------ 
Outcome   : Col 1 
Comparing : Row 1 vs. Row 2 

      Col 1 Col 2    P(Col 1) 95% conf. interval
Row 1    12     6      0.6667    0.4288   0.8420
Row 2     5    12      0.2941    0.1280   0.5419

                                   95% conf. interval
             Relative Risk: 2.2667    1.0128   5.0730
         Sample Odds Ratio: 4.8000    1.1471  20.0850
Conditional MLE Odds Ratio: 4.5683    0.9465  25.7201
    Probability difference: 0.3725    0.0427   0.6073

             Exact P-value: 0.0437 
        Asymptotic P-value: 0.0317 
------------------------------------------------------
```

```
> library(epitools)
> oddsratio.wald(x)
$data
          Outcome
Predictor  Disease1 Disease2 Total
  Exposed1       12        6    18
  Exposed2        5       12    17
  Total          17       18    35

$measure
          odds ratio with 95% C.I.
Predictor  estimate    lower    upper
  Exposed1      1.0       NA       NA
  Exposed2      4.8 1.147127 20.08496

$p.value
          two-sided
Predictor  midp.exact fisher.exact chi.square
  Exposed1         NA           NA         NA
  Exposed2 0.03527143   0.04371017 0.02752225

$correction
[1] FALSE

attr(,"method")
[1] "Unconditional MLE & normal approximation (Wald) CI"
```

```
> oddsratio.wald(x)
  Exposed2      4.8 1.147127 20.08496
> oddsratio.midp(x)
  Exposed2 4.503795 1.105796 21.10137
> oddsratio.fisher(x)
  Exposed2 4.568253 0.9465292 25.72015
> oddsratio.small(x)
  Exposed2 3.428571 1.099686 17.37077
```

```
> library(vcd)
> oddsratio(x, log=FALSE)
[1] 4.8
```

```
> confint(oddsratio(x, log=FALSE))
          lwr      upr
[1,] 1.147127 20.08496
> summary(oddsratio(x))
     Log Odds Ratio Std. Error z value Pr(>|z|)  
[1,]         1.5686     0.7303  2.1479  0.03172 *
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```

```
> library(fmsb)
> oddsratio(12, 5, 6, 12)
           Disease Nondisease Total
Exposed         12          6    18
Nonexposed       5         12    17
Total           17         18    35

        Odds ratio estimate and its significance probability

data:  12 5 6 12
p-value = 0.02983
95 percent confidence interval:
  1.147127 20.084959
sample estimates:
[1] 4.8
```

```
> library(exact2x2)
> fisher.exact(x)

        Two-sided Fisher's Exact Test (usual method using minimum likelihood)

data:  x
p-value = 0.04371
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
  1.0905 22.9610
sample estimates:
odds ratio 
  4.568253 

> blaker.exact(x)

        Blaker's Exact Test

data:  x
p-value = 0.04371
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
  1.0905 23.6488
sample estimates:
odds ratio 
  4.568253 
```

### 5.6 ファイ係数，クラメールのVなど

```
> sqrt(chisq.test(x,correct=FALSE)$statistic / sum(x))
 X-squared 
 0.372549 
> a = x[1,1]; b = x[1,2]; c = x[2,1]; d = x[2,2]
> (a*d-b*c) / sqrt((a+b)*(c+d)*(a+c)*(b+d))
[1] 0.372549
```

```
> library(psych)
> phi(x)
[1] 0.37
> phi(x, digits=8)
[1] 0.372549
```

```
> Yule(x)
[1] 0.6551724
> (a*d-b*c) / (a*d+b*c)
[1] 0.6551724
```

### 5.7 マクネマー検定

```
> fisher.test(matrix(c(7,14,13,6), nrow=2))
```

```
> binom.test(1, 9)  # binom.test(8, 9) でも同じ

        Exact binomial test

data:  1 and 9
number of successes = 1, number of trials = 9, p-value = 0.03906
alternative hypothesis: true probability of success is not equal to 0.5
95 percent confidence interval:
 0.002809137 0.482496515
sample estimates:
probability of success 
             0.1111111 
```

```
> mcnemar.test(matrix(c(6,8,1,5), nrow=2))

        McNemar's Chi-squared test with continuity correction

data:  matrix(c(6, 8, 1, 5), nrow = 2)
McNemar's chi-squared = 4, df = 1, p-value = 0.0455
```

```
> t.test(c(rep(0,11),rep(1,8),rep(-1,1)))  # 変化なし11個，増8個，減1個
```

```
> mcnemar.exact(matrix(c(6,8,1,5), nrow=2))

        Exact McNemar test (with central confidence intervals)

data:  matrix(c(6, 8, 1, 5), nrow = 2)
b = 1, c = 8, p-value = 0.03906
alternative hypothesis: true odds ratio is not equal to 1
95 percent confidence interval:
 0.00281705 0.93235414
sample estimates:
odds ratio 
     0.125 
```

## 第6章 連続量の扱い方

### 6.1 誤差，不確かさ，検定

```
> X = c(-0.59, -0.06,  0.14, -0.52,  0.73, -0.08, -0.71, -1.73,  0.69, -1.78)
```

```
> mean(X)
[1] -0.391
> sd(X)
[1] 0.8688236
```

```
> mean(X) / sqrt(var(X) / 10)
[1] -1.423132
```

```
> 2 * pt(-1.423132, 9)
[1] 0.1884239
```

```
> qt(0.025, 9)
[1] -2.262157
> qt(0.975, 9)
[1] 2.262157
```

```
> t.test(X)

        One Sample t-test

data:  X 
t = -1.4231, df = 9, p-value = 0.1884
alternative hypothesis: true mean is not equal to 0 
95 percent confidence interval:
 -1.0125190  0.2305190 
sample estimates:
mean of x 
   -0.391 
```

### 6.2 2標本の差の$t$検定

```
> A = rep(1:5, c(2,3,4,3,2))  # A=c(1,1,2,2,2,3,3,3,3,4,4,4,5,5)と同じ
> B = rep(1:5, c(0,2,4,5,3))  # B=c(2,2,3,3,3,3,4,4,4,4,4,5,5,5)と同じ
> table(A)                    # 念のため確認
A
1 2 3 4 5 
2 3 4 3 2 
> table(B)
B
2 3 4 5 
2 4 5 3 
> t.test(A, B)                # 等分散を仮定しないt検定

        Welch Two Sample t-test

data:  A and B 
t = -1.4615, df = 24.476, p-value = 0.1566
alternative hypothesis: true difference in means is not equal to 0 
95 percent confidence interval:
 -1.5497688  0.2640545 
sample estimates:
mean of A mean of B 
 3.000000  3.642857 

> t.test(A, B, var.equal=TRUE)  # 等分散を仮定したt検定

        Two Sample t-test

data:  A and B 
t = -1.4615, df = 26, p-value = 0.1559
alternative hypothesis: true difference in means is not equal to 0 
95 percent confidence interval:
 -1.5470216  0.2613074 
sample estimates:
mean of A mean of B 
 3.000000  3.642857 
```

```
f = function() {
  x = rnorm(10, mean=0, sd=1.5)
  y = rnorm(30, mean=0, sd=1.0)
  vp = var.test(x, y)$p.value
  t.test(x, y, var.equal=(vp >= 0.05))$p.value
}
p = replicate(1000, f())
mean(p < 0.05)
```

```
ttest = function(n1, x1, s1, n2, x2, s2) {
  n = n1 + n2 - 2
  u = ((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / n
  t = (x1 - x2) / sqrt(u / n1 + u / n2)
  r = cat("Equal variance:\n\t", sep="")
  r = cat(r, "t = ", t, ", df = ", n, ",
          p = ", 2 * pt(-abs(t), n), "\n", sep="")
  t = (x1 - x2) / sqrt(s1^2 / n1 + s2^2 / n2)
  n = (s1^2 / n1 + s2^2 / n2)^2 /
      ((s1^2 / n1)^2 / (n1-1) + (s2^2 / n2)^2 / (n2-1))
  r = cat(r, "Unequal variance:\n\t", sep="")
  cat(r, "t = ", t, ", df = ", n, ", p = ", 2 * pt(-abs(t), n), "\n", sep="")
}
```

```
f = function() {
  x = sample(1:5, 14, replace=TRUE)
  y = sample(1:5, 14, replace=TRUE)
  t.test(x, y)$p.value
}
p = replicate(100000, f())
mean(p < 0.05)
```

### 6.3 一元配置分散分析

```
x = c(1,3,5,8,5,4,2)          # データ
g = factor(c(1,1,2,2,2,3,3))  # グループの分かれ方
```

```
> y = ave(x, g)
> y
[1] 2 2 6 6 6 3 3
```

```
> z = ave(x)
> z
[1] 4 4 4 4 4 4 4
```

```
> y - z
[1] -2 -2  2  2  2 -1 -1
```

```
> sum((y - z)^2)
[1] 22
```

```
> x - y
[1] -1  1 -1  2 -1  1 -1
```

```
> sum((x - y)^2)
[1] 10
```

```
> sum((x - z)^2)
[1] 32
```

```
> (sum((y-z)^2) / 2) / (sum((x-y)^2) / 4)
[1] 4.4
```

```
> 1 - pf(4.4, 2, 4)
[1] 0.09765625
```

```
> anova(lm(x ~ g))
```

```
Analysis of Variance Table

Response: x
          Df Sum Sq Mean Sq F value  Pr(>F)  
g          2   22.0    11.0     4.4 0.09766 .
Residuals  4   10.0     2.5                  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1 
```

```
> oneway.test(x ~ g, var.equal=TRUE)
```

```
> oneway.test(x ~ g)

        One-way analysis of means (not assuming equal variances)

data:  x and g 
F = 3.3913, num df = 2.0, denom df = 2.4, p-value = 0.1998
```

```
x = c(1,3,5,8,5,4,2)          # データ
g = factor(c(1,1,2,2,2,3,3))  # グループの分かれ方
ssq0 = sum((ave(x,g) - ave(x))^2) # 群間2乗和
c1 = combn(7, 3)
c2 = combn(4, 2)
n1 = ncol(c1)
n2 = ncol(c2)
ssq = numeric(0)
for (i in 1:n1) {
    a = c1[,i]
    g[a] = 1
    b = setdiff(1:7, a)
    for (j in 1:n2) {
        g[b[c2[,j]]] = 2
        g[b[-c2[,j]]] = 3
        ssq = append(ssq, sum((ave(x,g)-ave(x))^2))
    }
}
mean(ssq >= ssq0)
```

```
> kruskal.test(x ~ g)

        Kruskal-Wallis rank sum test

data:  x by g
Kruskal-Wallis chi-squared = 4.8, df = 2, p-value = 0.09072
```

## 第7章 効果量，検出力，メタアナリシス

### 7.1 効果量（effect size）

### 7.2 コーエン（Cohen）の \textit{d

```
curve(dnorm(x), lwd=2, xlim=c(-3,3),
      xlab="", ylab="", frame.plot=FALSE, yaxt="n", yaxs="i")
curve(dnorm(x,mean=0.2), lwd=2, add=TRUE)
segments(0, 0, 0, dnorm(0))
segments(0.2, 0, 0.2, dnorm(0))
```

```
cohen.d(x, y, hedges.correction=TRUE)
```

### 7.3 αとβと検出力

### 7.4 カーリー（Currie）の検出限界

### 7.5 メタアナリシス

```
install.packages("metafor") # インストール
library(metafor)            # ライブラリを読み込む
data(dat.bcg)               # 例題データ「BCGワクチンの有効性」をロードする
```

```
dat = escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
```

```
res = rma(yi, vi, data=dat)
```

```
forest(res)
```

```
forest(res, slab=paste(dat$author,dat$year,sep=", "),
       xlim=c(-16,6), at=log(c(0.05,0.25,1,4)), atransf=exp,
       ilab=cbind(dat$tpos,dat$tneg,dat$cpos,dat$cneg),
       ilab.xpos=c(-9.5,-8,-6,-4.5)+0.7, ilab.pos=c(2,2,2,2),
       cex=0.75)
text(c(-9.5,-8,-6,-4.5), 15, c("TB+","TB-","TB+","TB-"))
text(c(-8.75,-5.25), 16, c("Vaccinated","Control"))
text(-16, 15, "Author(s) and Year", pos=4)
text(6, 15, "Relative Risk [95% CI]", pos=2)
```

## 第8章 相関

### 8.1 準備体操

```
> x = rnorm(40); y = rnorm(40); plot(x, y)
```

```
> x = rnorm(40); y = rnorm(40); plot(x, y, pch=16)
```

```
> x = rnorm(40); y = rnorm(40); plot(x, y, pch=16, main=cor(x,y))
```

```
> a = rnorm(40);  b = rnorm(40);  c = rnorm(40)
> x = a + c;  y = b + c
> plot(x, y, pch=16, main=cor(x,y))
```

### 8.2 相関係数

```
組織率 = c(50, 40, 50, 50, 90, 70, 60, 30, 1, 10, 60, 10, 40)
正答率合計 = c(237.9, 238.8, 270.2, 270.1, 276.3, 259.2, 256.6,
               231.4, 259, 220.7, 242.9, 251.6, 209.4)
plot(組織率, 正答率合計)
```

```
> cor(組織率, 正答率合計)
[1] 0.4251695
```

```
> cor.test(組織率, 正答率合計)

        Pearson's product-moment correlation

data:  組織率 and 正答率合計 
t = 1.558, df = 11, p-value = 0.1475
alternative hypothesis: true correlation is not equal to 0 
95 percent confidence interval:
 -0.1643066  0.7908813 
sample estimates:
      cor 
0.4251695 
```

```
> cor(組織率, 正答率合計, method="kendall")
[1] 0.3736324
> cor(組織率, 正答率合計, method="spearman")
[1] 0.5076522
```

```
> cor.test(組織率, 正答率合計, method="kendall")

        Kendall's rank correlation tau

data:  組織率 and 正答率合計 
z = 1.7298, p-value = 0.08366
alternative hypothesis: true tau is not equal to 0 
sample estimates:
      tau 
0.3736324 

Warning message:
In cor.test.default(組織率, 正答率合計, method = "kendall") :
   タイのため正確な p 値を計算することができません 
> cor.test(組織率, 正答率合計, method="spearman")

        Spearman's rank correlation rho

data:  組織率 and 正答率合計 
S = 179.2146, p-value = 0.07656
alternative hypothesis: true rho is not equal to 0 
sample estimates:
      rho 
0.5076522 

Warning message:
In cor.test.default(組織率, 正答率合計, method = "spearman") :
   タイのため正確な p 値を計算することができません 
```

### 8.3 ピアソンの相関係数

```
> x = c(1,2,3)    # x = 1:3 でも同じ
> y = c(1,3,2)
> cor(x, y)
```

```
> x = c(1, 2, 3)  # x = 1:3 でも同じ
> y = c(1, 3, 2)
> r = cor(x, y)   # r = 0.5 になる
> n = 3
> t = r * sqrt(n-2) / sqrt(1 - r^2)  # t = 0.5773503
> 2 * pt(-t, n-2) # 0.6666667 と表示される
```

```
> cor.test(x, y)

        Pearson's product-moment correlation

data:  x and y 
t = 0.5774, df = 1, p-value = 0.6667
alternative hypothesis: true correlation is not equal to 0 
sample estimates:
cor 
0.5 
```

### 8.4 順位相関係数

```
f = function() {
    k = runif(1)
    a = runif(10);  b = runif(10)
    x = k * a + (1-k) * b;  y = k * a - (1-k) * b
    c(cor(x,y,method="kendall"), cor(x,y,method="spearman"))
}
r = replicate(1000, f())
plot(r[1,], r[2,], xlim=c(-1,1), ylim=c(-1,1), asp=1)
abline(0,1)
```

```
> t = cor(X, Y, method="kendall")
> a = replicate(10000, cor(X, sample(Y), method="kendall"))
> mean(abs(a) >= abs(t)) # 両側確率
```

```
> t
[1] 0.3736324
> mean(abs(a) >= t)
[1] 0.095084
> mean(abs(a) >= 0.3736324)
[1] 0.07212
> mean(abs(a) >= 0.3736323)
[1] 0.095084
```

```
> length(unique(a))
[1] 67
```

### 8.5 エピローグ

```
> fisher.test(matrix(c(6,2,2,5), nrow=2))
```

```
> x = read.csv("nikkyoso.csv", fileEncoding="UTF-8")
> x$日教組票 = round(x$H16参院選那谷屋正義 + x$H19参院選神本みえ子)
> plot(x$総合点, x$日教組票, pch=16, log="y", xlab="総合点", ylab="", bty="l", las=1)
> mtext("日教組票", at=c(410,52000))
> abline(v=c(476.3, 498.85))
> abline(h=c(1994, 8127.5))
```

```
> cor.test(x$総合点, x$日教組票)                    #   r=-0.17 p=0.24
> cor.test(x$総合点, x$日教組票, method="kendall")  # tau=-0.10 p=0.30
> cor.test(x$総合点, x$日教組票, method="spearman") # rho=-0.15 p=0.32
```

### 8.6 自己相関があるデータの相関係数

```
f1 = function() { x = rnorm(40); y = rnorm(40); cor(x, y) }
f2 = function() { x = cumsum(rnorm(40)); y = cumsum(rnorm(40)); cor(x, y) }
r1 = replicate(1000000, f1());  hist(r1)  # 左
r2 = replicate(1000000, f2());  hist(r2)  # 右
```

## 第9章 回帰分析

### 9.1 最小2乗法

```
x = c(1,2,3,4)
y = c(2,3,5,4)

f = function(arg) {
  a = arg[1]
  b = arg[2]
  t = a * x + b
  sum((y - t)^2)
}

optim(c(1,1), f)  # 初期値(a,b)=(1,1)から始めてfを最小化する
```

```
> optim(c(1,1), f)$par
[1] 0.7999722 1.5000885
```

```
> r = lm(y ~ x)
> summary(r)

Call:
lm(formula = y ~ x)

Residuals:
   1    2    3    4 
-0.3 -0.1  1.1 -0.7 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)
(Intercept)   1.5000     1.1619   1.291    0.326
x             0.8000     0.4243   1.886    0.200

Residual standard error: 0.9487 on 2 degrees of freedom
Multiple R-squared:   0.64,     Adjusted R-squared:   0.46 
F-statistic: 3.556 on 1 and 2 DF,  p-value: 0.2
```

### 9.2 息抜き体操

```
x = rnorm(40);  y = rnorm(40)
plot(x, y, pch=16, main=cor(x,y))
abline(lm(y ~ x))
```

```
a = rnorm(100);  b = rnorm(100);  c = rnorm(100)
x = (a + c) / sqrt(2)
y = (b + c) / sqrt(2)
plot(x, y, pch=16, xlim=c(-3,3), ylim=c(-3,3),
     asp=1)
abline(lm(y ~ x))
abline(0, 1, lty=2)
```

### 9.3 例：第五の力

```
x = c(0.94, 0.50, 0.00, -0.74, -0.86, -1.42, -1.71)
y = c(0.4, 0.4, 0.0, -0.3, -0.5, -0.7, -1.0)
e = c(0.2, 0.1, 0.2, 0.2, 0.2, 0.2, 0.2)
plot(x, y, type="p", pch=16, ylim=range(c(y-e, y+e)),
     xlab=expression(10^3 * Delta * (B/mu)),
     ylab=expression(10^8 * Delta * kappa))
arrows(x, y-e, x, y+e, length=0.03, angle=90, code=3)
```

```
> r = lm(y ~ x, weights=1/e^2)  # 誤差が一定ならば r = lm(y ~ x)
```

```
> summary(r)

Call:
lm(formula = y ~ x, weights = 1/e^2)

Weighted Residuals:
      1       2       3       4       5       6       7 
-0.9404  0.6282 -0.2603  0.3495 -0.3084  0.2882 -0.3850 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.05207    0.03867   1.347    0.236    
x            0.57022    0.04294  13.281 4.33e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 0.5992 on 5 degrees of freedom
Multiple R-squared:  0.9724,    Adjusted R-squared:  0.9669 
F-statistic: 176.4 on 1 and 5 DF,  p-value: 4.327e-05
```

```
> abline(r)
```

```
> sum((r$residuals / e)^2)
```

```
> pchisq(1.795245, df=5)
```

```
r = lm(y ~ x - 1, weights=1/e^2)
```

### 9.4 ポアソン回帰

```
f = function(arg) {
    a = arg[1]
    b = arg[2]
    lambda = a * x + b
    -sum(y * log(lambda) - lambda)
}
optim(c(1,1), f)
```

```
glm(y ~ x, family=poisson(link="identity"))
```

### 9.5 ポアソン回帰と似た方法，等価な方法

```
f = function(arg) {
    a = arg[1]
    b = arg[2]
    lambda = a * x + b
    sum((y - lambda)^2 / y)
}
optim(c(1,1), f)
```

```
lm(y ~ x, weights=1/y)
```

```
f = function(arg) {
    a = arg[1]
    b = arg[2]
    lambda = a * x + b
    sum((y - lambda)^2 / lambda)
}
optim(c(1,1), f)
```

```
w = c(1,1,1,1)    # 適当な初期値
for (i in 1:10) { # 収束するまで続ける
    r = lm(y ~ x, weights=w)
    lambda = predict(r)
    print(c(as.numeric(r$coef), -sum(y*log(lambda)-lambda)))
    w = 1 / lambda
}
```

```
weights=varPower(fixed=0.5)
```

```
library(nlme)
data = data.frame(y=y, x=x)
gnls(y ~ a * x + b, data=data,
     start=list(a=0.9,b=1.3), weights=varPower(fixed=0.5))
```

### 9.6 ポアソン回帰のあてはまりの良さ

```
> x = c(1,2,3,4)
> y = c(2,3,5,4)
> r = glm(y ~ x, family=poisson(link="identity"))
> summary(r)

Call:
glm(formula = y ~ x, family = poisson(link = "identity"))

Deviance Residuals: 
       1         2         3         4  
-0.11496  -0.03194   0.51015  -0.39066  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)
(Intercept)   1.2784     1.9766   0.647    0.518
x             0.8887     0.8141   1.092    0.275

(Dispersion parameter for poisson family taken to be 1)

    Null deviance: 1.4716  on 3  degrees of freedom
Residual deviance: 0.4271  on 2  degrees of freedom
AIC: 16.779

Number of Fisher Scoring iterations: 5
```

```
> lambda = predict(r)
> 2 * sum((y*log(y)-y) - (y*log(lambda)-lambda))
[1] 0.4270962
```

```
> 2 * sum((y*log(y)-y) - (y*log(3.5)-3.5))
[1] 1.471633
```

```
ci = sapply(1:4, function(i){poisson.test(y[i])$conf.int})
r = glm(y ~ x, family=poisson(link="identity"))
plot(x, y, type="p", pch=16, xlim=c(0,5), ylim=range(c(0,ci)))
abline(r)
arrows(x, ci[1,], x, ci[2,], length=0.05, angle=90, code=3)
```

```
2 * sum((y*log(y)-y) - (y*log(lambda)-lambda), na.rm=TRUE)
```

```
p = c(0.01, 1, 1, 0.1)
```

```
x = c(1, 2, 3, 4)
```

```
y = c(0, 12, 9, 1)
```

```
z = y / p
```

```
r1 = lm(z ~ x)
plot(x, z, type="p", pch=16, xlim=c(0.5,4.5), ylim=c(0,15))
abline(r1)
```

```
r2 = lm(z ~ x, weights=p)
abline(r2, lty=2)
```

```
q = x * p
r3 = glm(y ~ q + p - 1, family=poisson(link="identity"))
abline(r3$coef['p'], r3$coef['q'], lty=3)
```

### 9.7 ロジスティック回帰

```
set.seed(1)
x = matrix(round(rnorm(1000,mean=50,sd=10)), ncol=10)
invlogit = function(x){exp(x)/(1+exp(x))}
y = sapply(1:100, function(i){rbinom(1, 1, invlogit((x[i,]-50) %*% (1:10)/100))})
```

```
r1 = glm(y ~ x[,1]+x[,2]+x[,3]+x[,4]+x[,5]+x[,6]+x[,7]+x[,8]+x[,9]+x[,10],
         family=binomial(link="logit"))
```

```
> summary(r1)

Call:
glm(formula = y ~ x[, 1] + x[, 2] + x[, 3] + x[, 4] + x[, 5] + x[, 6] +
    x[, 7] + x[, 8] + x[, 9] + x[, 10], family = binomial(link = "logit"))

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-2.63394  -0.50453  -0.05924   0.44280   2.00046  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)    
(Intercept) -37.75406    8.42380  -4.482  7.4e-06 ***
x[, 1]        0.03587    0.03833   0.936 0.349244    
x[, 2]       -0.01386    0.03479  -0.398 0.690441    
x[, 3]        0.04029    0.02963   1.360 0.173892    
x[, 4]        0.08904    0.03645   2.443 0.014576 *  
x[, 5]        0.09239    0.03604   2.564 0.010356 *  
x[, 6]        0.11091    0.03796   2.922 0.003480 ** 
x[, 7]        0.05678    0.03159   1.798 0.072239 .  
x[, 8]        0.09457    0.03746   2.524 0.011591 *  
x[, 9]        0.15957    0.04533   3.520 0.000432 ***
x[, 10]       0.08699    0.03274   2.657 0.007889 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 138.269  on 99  degrees of freedom
Residual deviance:  69.291  on 89  degrees of freedom
AIC: 91.291

Number of Fisher Scoring iterations: 6
```

```
> step(r1)
Start:  AIC=91.29
y ~ x[, 1] + x[, 2] + x[, 3] + x[, 4] + x[, 5] + x[, 6] + x[, 
    7] + x[, 8] + x[, 9] + x[, 10]

...(中略)...

Step:  AIC=87.92
y ~ x[, 4] + x[, 5] + x[, 6] + x[, 7] + x[, 8] + x[, 9] + x[, 
    10]

...(後略)...
```

```
r = glm(y ~ x[,4] + x[,5] + x[,6] + x[,7] + x[,8] + x[,9] + x[,10],
        family=binomial(link="logit"))
summary(r)
```

```
Call:
glm(formula = y ~ x[, 4] + x[, 5] + x[, 6] + x[, 7] + x[, 8] + 
    x[, 9] + x[, 10], family = binomial(link = "logit"))

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-2.17312  -0.53009  -0.09058   0.46361   1.96882  

Coefficients:
             Estimate Std. Error z value Pr(>|z|)    
(Intercept) -32.42913    6.80960  -4.762 1.91e-06 ***
x[, 4]        0.08389    0.03498   2.398 0.016464 *  
x[, 5]        0.08887    0.03315   2.681 0.007347 ** 
x[, 6]        0.10510    0.03747   2.805 0.005035 ** 
x[, 7]        0.05809    0.02937   1.978 0.047950 *  
x[, 8]        0.08352    0.03587   2.328 0.019893 *  
x[, 9]        0.15230    0.04363   3.491 0.000482 ***
x[, 10]       0.07626    0.02950   2.585 0.009733 ** 
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 138.269  on 99  degrees of freedom
Residual deviance:  71.922  on 92  degrees of freedom
AIC: 87.922

Number of Fisher Scoring iterations: 6
```

```
plot(fitted(r), y, ylim=c(-0.2,1.2), yaxt="n")
axis(2, c(0,1))
```

```
r1 = lm(y ~ x[,1]+x[,2]+x[,3]+x[,4]+x[,5]+x[,6]+x[,7]+x[,8]+x[,9]+x[,10])
r2 = step(r1)
...
```

```
> install.packages("bestglm")
> library(bestglm)
> Xy = data.frame(x, y)
> bestglm(Xy, family=binomial(link="logit"), IC="AIC")
```

### 9.8 ROC曲線

```
> table(fitted(r) >= 0.5, y)
       y
         0  1
  FALSE 43  8
  TRUE  10 39
```

```
> ROC(fitted(r), y)
AUC = 0.9189081 th = 0.2447937 
BER = 0.1533521 OR = 62.67857 
         Actual
Predicted  0  1
    FALSE 39  2
    TRUE  14 45
```

## 第10章 ピークフィット

### 10.1 簡単な例題

```
s = function(x) { 50 * dnorm(x, mean=10, sd=3) }  # 信号
b = function(x) { 10 * exp(-x / 10) }             # バックグラウンド（ノイズ）
f = function(x) { s(x) + b(x) }
curve(f, xlim=c(1,20), ylim=c(0,11), xlab="", ylab="")
curve(s, lty=2, add=TRUE)
curve(b, lty=2, add=TRUE)
```

```
y = sapply(1:20, function(x){rpois(1,f(x))})
```

```
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
```

```
stripchart(rep(1:20,y), pch=16, method="stack", at=0, offset=0.5)
```

```
ci = sapply(1:20, function(i){poisson.test(y[i])$conf.int})
plot(1:20, y, type="p", pch=16, xlab="", ylab="", ylim=range(ci))
arrows(1:20, ci[1,], 1:20, ci[2,], length=0.03, angle=90, code=3)
curve(f, add=TRUE)
```

```
plot(1:20, y, type="p", pch=16, xlab="", ylab="", ylim=range(c(1,ci[2,])),
     log="y")
arrows(1:20, ci[1,], 1:20, ci[2,], length=0.03, angle=90, code=3)
```

```
plot(1:20, sqrt(y), type="p", pch=16, xlab="", ylab="", yaxt="n",
     ylim=sqrt(range(ci)))
arrows(1:20, sqrt(ci[1,]), 1:20, sqrt(ci[2,]), length=0.03, angle=90, code=3)
t = c(0,5,10,15,20);  axis(2, sqrt(t), t)
```

### 10.2 フィッティング

```
x = 1:20
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
d = dnorm(x, 10, 3)
e = exp(-x/10)
f = function(arg) {
  a = arg[1];  b = arg[2]
  mu = a * d + b * e
  -sum(y * log(mu) - mu)
}
optim(c(50,10), f)   # (50,10) は初期値
```

```
logL = function(a) {
  optimize(function(b){sum(y*log(a*d+b*e)-(a*d+b*e))},
           c(0,100), maximum=TRUE)$objective
}
plot(30:90, sapply(30:90,logL), type="l", xlab="a", ylab="log L(a)")
```

```
uniroot(function(a){logL1(a)-(144.5676-0.5)}, c(40,60))
uniroot(function(a){logL1(a)-(144.5676-0.5)}, c(60,80))
```

### 10.3 一般化線形モデル

```
x = 1:20
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
```

```
r = glm(y ~ dnorm(x,10,3) + exp(-x/10) - 1, family=poisson(link="identity"))
```

```
Coefficients:
                Estimate Std. Error z value Pr(>|z|)    
dnorm(x, 10, 3)   57.139     12.131   4.710 2.48e-06 ***
exp(-x/10)         9.234      1.566   5.897 3.70e-09 ***
```

```
                dnorm(x, 10, 3) exp(-x/10)
dnorm(x, 10, 3)       147.16953 -10.933472
exp(-x/10)            -10.93347   2.451703
```

### 10.4 非線形一般化線形モデル

```
x = 1:20
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
```

```
r = glm(y ~ dnorm(x,10,3) + exp(-x/10) - 1, family=poisson(link="identity"))
```

```
library(nlme)
data = data.frame(x, y)
r = gnls(y ~ a * dnorm(x,m,s) + b * exp(-x/10), data=data,
         start=list(a=50,b=10,m=10,s=3),
         weights=varPower(fixed=0.5),
         control=list(nlsTol=1e-5))
```

```
Coefficients:
     Value Std.Error   t-value p-value
a 48.76802 15.070588  3.235973  0.0052
b 10.24538  2.025268  5.058778  0.0001
m 10.19476  0.654146 15.584844  0.0000
s  2.28875  0.669822  3.416955  0.0035
```

### 10.5 度数分布を使わないフィッティング

```
x = 1:20
y = c(11,4,13,10,4,8,6,16,7,12,10,13,6,5,1,4,2,0,0,1)
```

```
z = rep(x, y)
```

```
g = function(x) { exp(-x/10) / 8.221519 }
h = function(x) { dnorm(x,10,3) / 0.9990481 }
f = function(t) { sum(log(t * g(z) + (1-t) * h(z))) }
optimize(f, c(0,1), maximum=TRUE)
```

```
t = (45:70)/100
plot(t, sapply(t,f), type="l", xlab="t", ylab="log L")
abline(h=-372.8489-0.5)
```

```
uniroot(function(t){f(t)-(-372.8489-0.5)}, c(0,0.57))
uniroot(function(t){f(t)-(-372.8489-0.5)}, c(0.57,1))
```

```
f = function(arg) {
  n1 = arg[1];  n2 = arg[2]
  return(n1 + n2 - sum(log(n1 * g(z) + n2 * h(z))))
}
optim(c(50,50), f)
```

```
m = outer(40:90, 40:90, Vectorize(function(x,y) f(c(x,y))))
contour(40:90, 40:90, -m, levels=seq(144.5676,by=-0.5,length.out=10),
        asp=1, xlab=expression(italic(ν)[1]), ylab=expression(italic(ν)[2]))
points(75.9, 57.1, pch="x")
```

```
solve(optim(c(50,50), f, hessian=TRUE)$hessian)
```

## 第11章 主成分分析と因子分析

### 11.1 多変量データ

```
> atest = read.csv("atest2015.csv", fileEncoding="UTF-8")
> names(atest)
 [1] "都道府県"  "小学国語A" "小学国語B" "小学算数A" "小学算数B" "小学理科" 
 [7] "中学国語A" "中学国語B" "中学数学A" "中学数学B" "中学理科"
> head(atest)
  都道府県 小学国語A 小学国語B 小学算数A 小学算数B 小学理科 中学国語A 中学国語B
1   北海道      68.1      63.0      72.3      42.5     59.3      75.8      65.7
2   青森県      75.1      69.8      78.5      47.4     66.3      76.0      64.8
………後略………
```

```
> chu = atest[ ,7:11]
> row.names(chu) = atest[ ,1]
> head(chu)
       中学国語A 中学国語B 中学数学A 中学数学B 中学理科
北海道      75.8      65.7      63.0      39.7     53.3
青森県      76.0      64.8      64.4      39.8     53.8
………後略………
```

```
> cor(chu)
          中学国語A 中学国語B 中学数学A 中学数学B  中学理科
中学国語A 1.0000000 0.9062628 0.8307854 0.8446749 0.8674915
中学国語B 0.9062628 1.0000000 0.7831577 0.8951718 0.9013279
中学数学A 0.8307854 0.7831577 1.0000000 0.9325483 0.8012841
中学数学B 0.8446749 0.8951718 0.9325483 1.0000000 0.8394486
中学理科  0.8674915 0.9013279 0.8012841 0.8394486 1.0000000
```

### 11.2 主成分分析

```
> r = prcomp(chu)
```

```
> chu[24,3]  # 三重県の中学数学A
[1] 64.3
> r$x[24,] %*% r$rotation[3,] + r$center[3]
     [,1]
[1,] 64.3
```

```
> par(xpd=TRUE)  # 枠からはみ出した文字が欠けないようにするオマジナイ
> biplot(prcomp(chu))
```

```
> biplot(prcomp(chu, scale=TRUE))
```

### 11.3 例：中野・西島・ゲルマンの法則

```
> Q = c(1, 0, 0, 1, 0, -1, 0, -1, -1)
> I3 = c(0.5, -0.5, 0, 1, 0, -1, 0.5, -0.5, 0)
> Y = c(1, 1, 0, 0, 0, 0, -1, -1, -2)
> prcomp(data.frame(Q, I3, Y))
Standard deviations:
[1] 1.154360e+00 7.733106e-01 1.401779e-16

Rotation:
          PC1        PC2        PC3
Q  -0.6161760 -0.4193838  0.6666667
I3 -0.2413105 -0.7052126 -0.6666667
Y  -0.7497309  0.5716576 -0.3333333
```

### 11.4 因子分析

```
> f = factanal(chu, factors=2)
> plot(NULL, xlim=c(0,1), ylim=c(0,1), xlab="因子1", ylab="因子2")
> text(f$loadings, names(chu))
> points(0, 0, pch=4)    # 原点(0,0)に×印を付けておく
```

```
> f = factanal(chu, factors=2, scores="regression")
> biplot(f$scores, f$loadings)
```

```
> x = matrix(c(1,sqrt(3)/4,1/4,0, sqrt(3)/4,1,sqrt(3)/4,1/4,
               1/4,sqrt(3)/4,1,sqrt(3)/4, 0,1/4,sqrt(3)/4,1), nrow=4)
> factanal(covmat=x, factors=2)
 factanal(covmat = x, factors = 2) でエラー: 
  2 factors are too many for 4 variables
```

### 11.5 リッカート型データ

```
data = matrix(c(4,5,6,3,2, 1,4,3,6,6), byrow=TRUE, nrow=2)
rownames(data) = c("従来型", "ICT利用")
colnames(data) = c("最悪", "悪い", "普通", "良い", "最高")
ratio = data / rowSums(data) * 100
barplot(t(ratio[2:1,]), horiz=TRUE, las=1, xlab="%")
t = ratio[1,]
mtext(colnames(data), at=cumsum(t)-t/2)
```

```
offset = -(data[,1]+data[,2]+data[,3]/2)
barplot(t(data[2:1,]), horiz=TRUE, las=1, xlab="人数", offset=offset[2:1])
t = data[1,]
mtext(colnames(data), at=cumsum(t)-t/2+offset[1])
```

```
> x = rep(1:5, c(4,5,6,3,2))
> y = rep(1:5, c(1,4,3,6,6))
> t.test(x, y)
```

### 11.6 ウィルコクソン検定（順位和検定）

```
> x = rep(1:5, c(4,5,6,3,2))
> y = rep(1:5, c(1,4,3,6,6))
> wilcox.test(x, y)

        Wilcoxon rank sum test with continuity correction

data:  x and y
W = 123, p-value = 0.03435
alternative hypothesis: true location shift is not equal to 0

 警告メッセージ: 
 wilcox.test.default(x, y) で: 
   タイがあるため、正確な p 値を計算することができません 
```

```
> wilcox.test(x, y, exact=TRUE)
```

```
> library(exactRankTests)
  Package 'exactRankTests' is no longer under development.
  Please consider using package 'coin' instead.
> wilcox.exact(x, y)

        Exact Wilcoxon rank sum test

data:  x and y
W = 123, p-value = 0.03611
alternative hypothesis: true mu is not equal to 0
```

```
library(coin)
wilcox_test(c(x,y) ~ factor(c(rep("x",length(x)),rep("y",length(y)))),
            distribution="exact")
```

```
f = function() {
  a = sample(40)
  x = a[1:20]
  y = a[21:40]
  c(t.test(x, y, var.equal=TRUE)$p.value, wilcox.test(x, y)$p.value)
}
r = replicate(1000, f())
plot(r[1,], r[2,], asp=1)
abline(0, 1)
```

### 11.7 ブルンナー・ムンツェル検定

```
> library(lawstat)
> brunner.munzel.test(x, y)
```

```
        Brunner-Munzel Test

data:  x and y
Brunner-Munzel Test Statistic = 2.3138, df = 37.759, p-value = 0.02622
95 percent confidence interval:
 0.5240416 0.8609584
sample estimates:
P(X<Y)+.5*P(X=Y) 
          0.6925 
```

### 11.8 並べ替え検定

```
> d = abs(mean(x) - mean(y))
```

```
> xy = c(x, y)
> f = function(t) { abs(mean(xy[t]) - mean(xy[-t])) }
```

```
> z = replicate(10000, f(sample(40,20)))
```

```
> mean(z >= d)
```

```
> mean(z > d)
```

```
> mean(z > d) + 0.5 * mean(z == d)
```

```
z = combn(40, 20, f)
```

### 11.9 並べ替えブルンナー・ムンツェル検定

```
> d = abs(brunner.munzel.test(x, y)$statistic)
> xy = c(x, y)
> f = function(t) { abs(brunner.munzel.test(xy[t], xy[-t])$statistic) }
> z = replicate(10000, f(sample(40,20)))
> mean(z >= d)
```

```
> mean(z > d) + 0.5 * mean(z == d)
```

### 11.10 ブートストラップ

```
> sample(x, 20, replace=TRUE)
```

```
> mean(sample(x, 20, replace=TRUE))
```

```
> b = replicate(100000, mean(sample(x, 20, replace=TRUE)))
```

```
> sd(b)
```

```
> quantile(b, c(0.025,0.975))
```

```
b = replicate(100000,
              mean(sample(x,20,replace=TRUE))-mean(sample(y,20,replace=TRUE)))
```

### 11.11 ほかの方法

```
> x = rep(1:5, c(4,5,6,3,2))
> y = rep(1:5, c(1,4,3,6,6))
> t.test(x, y)
```

```
> nx = length(x)
> ny = length(y)
> r = rank(c(x, y))
> rx = r[1:nx]
> ry = r[(nx+1):(nx+ny)]
> t.test(rx, ry)
```

```
> t.test((rx-0.5)/(nx+ny), (ry-0.5)/(nx+ny))
```

```
> t.test(qnorm((rx-0.5)/(nx+ny)), qnorm((ry-0.5)/(nx+ny)))
```

```
> fisher.test(matrix(c(15,8,5,12), nrow=2))
```

## 第12章 生存時間解析

### 12.1 プロローグ

```
> fisher.test(matrix(c(19,28,40,31), nrow=2))
```

### 12.2 生存時間解析

```
> install.packages("survival")
> library(survival)
```

```
> options(stringsAsFactors=FALSE)
> whas100 = read.csv("whas100.csv")
```

```
> whas100 = read.csv("whas100.csv", stringsAsFactors=FALSE)
```

```
> o = order(whas100$lenfol)
> head(whas100[o,])
   id  admitdate    foldate los lenfol fstat age gender      bmi
1   1  3/13/1995  3/19/1995   4      6     1  65      0 31.38134
31 31   9/3/1995   9/9/1995   4      6     1  72      0 27.97907
56 56   9/1/1997  9/15/1997  11     14     1  64      1 24.41255
85 85  12/2/1997  1/15/1998   3     44     1  71      0 23.05630
98 98 11/26/1997  1/27/1998   8     62     1  86      1 14.91878
53 53  8/20/1997 11/17/1997   3     89     1  87      1 18.77718
> tail(whas100[o,])
   id  admitdate    foldate los lenfol fstat age gender      bmi
18 18 10/30/1995   1/5/2003   9   2624     1  61      0 30.71420
27 27 10/18/1995 12/31/2002   2   2631     0  68      0 26.44693
11 11 10/11/1995 12/31/2002   6   2638     0  73      1 28.43344
16 16  10/8/1995 12/31/2002   5   2641     0  39      0 30.10881
33 33  7/22/1995 12/22/2002   8   2710     1  81      1 28.64898
10 10  7/22/1995 12/31/2002   9   2719     0  40      0 21.78971
```

```
> s = survfit(Surv(lenfol, fstat) ~ gender, data=whas100)
> plot(s)
```

```
> Surv(whas100$lenfol, whas100$fstat)
```

```
> with(whas100, Surv(lenfol, fstat))
```

```
  [1]    6   374  2421    98  1205  2065  1002  2201   189  2719+ 2638+  492 
 [13]  302  2574+ 2610+ 2641+ 1669  2624  2578+ 2595+  123  2613+  774  2012 
 [25] 2573+ 1874  2631+ 1907   538   104     6  1401  2710   841   148  2137+
 [37] 2190+ 2173+  461  2114+ 2157+ 2054+ 2124+ 2137+ 2031  2003+ 2074+  274 
 [49] 1984+ 1993+ 1939+ 1172    89   128  1939+   14  1011  1497  1929+ 2084+
 [61]  107   451  2183+ 1876+  936   363  1048  1889+ 2072+ 1879+ 1870+ 1859+
 [73] 2052+ 1846+ 2061+ 1912+ 1836+  114  1557  1278  1836+ 1916+ 1934+ 1923+
 [85]   44  1922+  274  1860+ 1806  2145+  182  2013+ 2174+ 1624   187  1883+
 [97] 1577    62  1969+ 1054 
```

```
> survdiff(Surv(lenfol, fstat) ~ gender, data=whas100)
Call:
survdiff(formula = Surv(lenfol, fstat) ~ gender, data = whas100)

          N Observed Expected (O-E)^2/E (O-E)^2/V
gender=0 65       28     34.6      1.27      3.97
gender=1 35       23     16.4      2.68      3.97

 Chisq= 4  on 1 degrees of freedom, p= 0.0463 
```

```
pchisq(survdiff(Surv(lenfol, fstat) ~ gender, data=whas100)$chisq, 1,
       lower.tail=FALSE)
```

```
f = function() {
    x = matrix(59, 59, 2)
    y = matrix(0, 59, 2)
    z = matrix(0:1, 59, 2, byrow=TRUE)
    for (i in 1:47) {
        j = sample(2, 1)
        x[i, j] = i
        y[i, j] = 1
    }
    chi2 = survdiff(Surv(as.vector(x), as.vector(y)) ~ as.vector(z))$chisq
    p1 = pchisq(chi2, 1, lower.tail=FALSE)
    p2 = fisher.test(matrix(c(sum(y[,1]), 59-sum(y[,1]), sum(y[,2]),
                              59-sum(y[,2])), nrow=2))$p.value
    c(p1, p2)
}
a = replicate(1000, f())
plot(a[1,], a[2,], xlab="log-rank test", ylab="Fisher test", asp=1)
```

```
f = function() {
    x = matrix(1, 59, 2)
    y = matrix(0, 59, 2)
    z = matrix(0:1, 59, 2, byrow=TRUE)
    for (i in 1:118) {
        if (runif(1) < 47/118) {
            x[i] = runif(1)
            y[i] = 1
        }
    }
    chi2 = survdiff(Surv(as.vector(x), as.vector(y)) ~ as.vector(z))$chisq
    p1 = pchisq(chi2, 1, lower.tail=FALSE)
    p2 = fisher.test(matrix(c(sum(y[,1]), 59-sum(y[,1]), sum(y[,2]),
                              59-sum(y[,2])), nrow=2))$p.value
    c(p1, p2)
}
a = replicate(1000, f())
plot(a[1,], a[2,], xlab="log-rank test", ylab="Fisher test", asp=1)
```

```
> a = replicate(100000, f())
> mean(a[1,] < 0.05) # ログランク検定が5%有意になる確率→ほぼ0.05
> mean(a[2,] < 0.05) # fisher.test()が5%有意になる確率→ほぼ0.03
```

