# set latexfile to the name of the main file without the .tex
latexfile = thesis

TEX = latex -shell-escape

$(latexfile).pdf : $(latexfile).ps
	ps2pdf -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress $(latexfile).ps $(latexfile).pdf
	rm -f $(latexfile).ps
	rm -f *~

pdf : $(latexfile).pdf

$(latexfile).ps : $(latexfile).dvi
	dvips -Ppdf -G0 $(latexfile)

ps : $(latexfile).ps 

# reruns latex if needed.  to get rid of this capability, delete the
# three lines after the rule.  Delete .bbl dependency if not using
# BibTeX references.
# idea from http://ctan.unsw.edu.au/help/uk-tex-faq/Makefile
$(latexfile).dvi : $(latexfile).tex $(latexfile).bbl
	while ($(TEX) $(latexfile) ; \
	grep -q "Rerun to get cross" $(latexfile).log ) do true ; \
	done

$(latexfile).bbl : $(latexfile).aux
	bibtex $(latexfile).aux

$(latexfile).aux : $(latexfile).tex
	$(TEX) $(latexfile).tex

$(latexfile).tar.gz : $(figures) $(latexfile).tex $(referencefile).bib
	tar -czvf $(latexfile).tar.gz $^

tarball: $(latexfile).tar.gz

read:
	evince $(latexfile).pdf &

clean:
	rm -f $(latexfile).dvi $(latexfile).ps $(latexfile).pdf *~
	
deref:
	rm $(latexfile).bbl $(latexfile).aux
