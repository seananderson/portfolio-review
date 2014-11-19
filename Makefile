all: ms.tex anderson-etal-ecological-portfolios.pdf

ms.tex: ms.md ~/Dropbox/tex/ref3.bib ~/Dropbox/tex/jshort.bib
	pandoc -S --no-wrap --bibliography=/~/Dropbox/tex/jshort.bib --bibliography=~/Dropbox/tex/ref3.bib --natbib $< -o $@
	perl -p -i -e "s/Figure /Figure~/g" ms.tex
	perl -p -i -e "s/Fig\. /Fig.~/g" ms.tex
	perl -p -i -e "s/vs\. /vs.~/g" ms.tex
	perl -p -i -e "s/Table /Table~/g" ms.tex
	perl -p -i -e "s/Figs\. /Figs.~/g" ms.tex

anderson-etal-ecological-portfolios.pdf: anderson-etal-ecological-portfolios.tex ms.md ms.tex figs.tex theory-table.tex data-table.tex mmm-traits.pdf efficient-frontier-fig.pdf salmon-portfolios-bw.pdf risk-fig/risk-fig-bw.pdf
	latexmk $<

clean:
	latexmk -c anderson-etal-ecological-portfolios
