all:	ms

ms:
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	perl -p -i -e "s/Figure /Figure~/g" ms.tex
	perl -p -i -e "s/Fig\. /Fig.~/g" ms.tex
	perl -p -i -e "s/vs\. /vs.~/g" ms.tex
	perl -p -i -e "s/Table /Table~/g" ms.tex
	perl -p -i -e "s/Figs\. /Figs.~/g" ms.tex
	perl -p -i -e "s/e\.g\. /e\.g\.~/g" ms.tex
	perl -p -i -e "s/i\.e\. /i\.e\.~/g" ms.tex
	latexmk anderson-etal-ecological-portfolios


bib:
	./extract_bib ms.md > ms.bib
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	perl -p -i -e "s/Figure /Figure~/g" ms.tex
	perl -p -i -e "s/Fig\. /Fig.~/g" ms.tex
	perl -p -i -e "s/vs\. /vs.~/g" ms.tex
	perl -p -i -e "s/Table /Table~/g" ms.tex
	perl -p -i -e "s/Figs\. /Figs.~/g" ms.tex
	perl -p -i -e "s/e\.g\. /e\.g\.~/g" ms.tex
	perl -p -i -e "s/i\.e\. /i\.e\.~/g" ms.tex
	latexmk anderson-etal-ecological-portfolios
	cp anderson-etal-ecological-portfolios.pdf ~/Dropbox/Public/

rtf:
	latex2rtf anderson-etal-ecological-portfolios.tex
	cp anderson-etal-ecological-portfolios.rtf ~/Dropbox/Public/

clean:
	latexmk -c anderson-etal-ecological-portfolios
