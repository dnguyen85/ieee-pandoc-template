PY=python
PANDOC=pandoc
OUTPUTFILE=linkpursuit

BASEDIR=.
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
STYLEDIR=$(BASEDIR)/style
BIBDIR=$(BASEDIR)/bib

BIBFILE=$(BIBDIR)/Paper_Refworks-2017-pimrc_2017.bib,$(BIBDIR)/anton.bib

# Default target
all: pdf

# Main pdf target: first compile tex, then pdf
pdf: tex
	cd "$(OUTPUTDIR)" && arara -v "$(OUTPUTFILE)".tex

# Tex target use biblatex to generate bib entries - usenix mod
tex:
	pandoc $(INPUTDIR)/*.md \
	$(INPUTDIR)/metadata.yaml \
	-o "$(OUTPUTDIR)/$(OUTPUTFILE).tex" \
	-H "$(STYLEDIR)/preamble.tex" \
	--template="$(STYLEDIR)/template.tex" \
	-S \
	-N \
	--wrap=preserve \
	-F pandoc-crossref \
	--biblatex \
	-V biblio-files="$(BIBFILE)" \
	--latex-engine=pdflatex 
	
clean:
	cd "$(OUTPUTDIR)" && latexmk -C

.PHONY: pdf tex
