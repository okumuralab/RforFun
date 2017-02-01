# 共立出版『Rで楽しむ統計』サポートページ

とりあえず，code，data，figにコード例，データ，図のRソースとMakefileを置いておきます。

## リンク

* 共立出版の[『Rで楽しむ統計』のページ](http://www.kyoritsu-pub.co.jp/bookdetail/9784320112414)
* 共立出版の[「Wonderful R」シリーズのページ](http://www.kyoritsu-pub.co.jp/series/205/)

## Errata

* p.152 間違いではないですが，下から10行・9行のコードがやや不自然でした。次のようにするほうが素直かもしれません。
```
m = outer(40:90, 40:90, Vectorize(function(x,y) f(c(x,y))))
```
* p.155 下から4行目：都道府県iの「点数」→都道府県iの科目jの「点数」
