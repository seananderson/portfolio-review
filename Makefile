all:	ms

ms:
	pandoc -S --no-wrap --bibliography=jshort.bib --bibliography=ms.bib --natbib ms.md -o ms.tex
	perl -p -i -e "s/Fig. /Fig.~/g" ms.tex
	perl -p -i -e "s/Figs. /Figs.~/g" ms.tex
	perl -p -i -e "s/e\.g\. /e\.g\.~/g" ms.tex
	perl -p -i -e "s/i\.e\. /i\.e\.~/g" ms.tex
	#perl -p -i -e "s/\\\section/\\\section\*/g" ms.tex
	#perl -p -i -e "s/\\\subsection/\\\subsection\*/g" ms.tex
	xelatex Anderson-etal-ecological-portfolios

bib:
	extract_bib ms.md > ms.bib
	bibtex  Anderson-etal-ecological-portfolios
	xelatex Anderson-etal-ecological-portfolios
	xelatex Anderson-etal-ecological-portfolios

clean:
	rm *.aux
	rm *.bbl
	rm *.blg
