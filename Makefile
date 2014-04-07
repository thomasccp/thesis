# set latexfile to the name of the main file without the .tex
latexfile = thesis

TEX = latex -shell-escape

pdf : $(latexfile).pdf

$(latexfile).pdf : $(latexfile).ps
	ps2pdf -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress $(latexfile).ps $(latexfile).pdf
	rm -f $(latexfile).ps
	rm -f *~

$(latexfile).ps : $(latexfile).dvi
	dvips -Ppdf -G0 $(latexfile)

$(latexfile).dvi : $(latexfile).tex $(latexfile).bbl
	$(TEX) $(latexfile)
	$(TEX) $(latexfile)

$(latexfile).bbl : $(latexfile).aux
	bibtex $(latexfile).aux

$(latexfile).aux : $(latexfile).tex myrefs.bbl
	$(TEX) $(latexfile).tex

myrefs.bbl : myrefs.aux
	bibtex myrefs.aux

myrefs.aux : myrefs.tex
	$(TEX) myrefs.tex

read:
	evince $(latexfile).pdf &

clean:
	rm -f $(latexfile).dvi $(latexfile).ps $(latexfile).pdf $(latexfile).toc $(latexfile).lof $(latexfile).lot $(latexfile).out $(latexfile)*.aux $(latexfile)*.bbl $(latexfile)*.blg $(latexfile)*.log *~
	rm -f myrefs.dvi myrefs.aux myrefs.bbl myrefs.blg myrefs.log *~
	
