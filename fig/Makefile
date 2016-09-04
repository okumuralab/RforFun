SRC=$(wildcard *.R)

PDF=$(SRC:.R=.pdf)

all: $(PDF)

.SUFFIXES: .pdf .png .R

.R.pdf:
	Rscript $<

.R.png:
	Rscript $<
