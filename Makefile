LATEX=pdflatex --interaction=batchmode --shell-escape
BIBTEX=bibtex
DVIPS=dvips
PS2PDF=ps2pdf

all: dissertation.pdf

# dissertation.pdf: dissertation.ps
# 	$(PS2PDF) -dEmbedAllFonts=true dissertation.ps test.pdf
# 	ps2pdf13 -dPDFSETTINGS=/prepress test.pdf dissertation.pdf
# 	rm -f test.pdf

# dissertation.ps: dissertation.dvi
# 	$(DVIPS) -Pdownload35 -ta4 dissertation.dvi

#dissertation.dvi: dissertation.tex dissertation.bib

dissertation.pdf: dissertation.tex titlepage.tex declaration.tex abstract.tex
	$(LATEX) dissertation
#       $(BIBTEX) dissertation
	$(LATEX) dissertation
	$(LATEX) dissertation

clean:
	$(RM) -f dissertation.pdf dissertation.ps dissertation.dvi 
	$(RM) -f *.log *.aux *.toc *.bbl *.lot *.lof *.fls *.fdb_latexmk *.synctex.gz

count:
	@texcount -1 -utf8 -sum -inc dissertation.tex

count-all:
	@texcount -utf8 -sum -inc dissertation.tex

upload:
	scp dissertation.pdf ahb36@ely.cl.cam.ac.uk:~/public_html
