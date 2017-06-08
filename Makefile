PY=python
PANDOC=pandoc
OUTPUTFILE=paper

BASEDIR=.
INPUTDIR=$(BASEDIR)/source
OUTPUTDIR=$(BASEDIR)/output
STYLEDIR=$(BASEDIR)/style
BIBDIR=$(BASEDIR)/bib

BIBFILE=$(BIBDIR)/IEEEabrv,$(BIBDIR)/papers

# Default target
all: pdf

# Main pdf target: first compile tex, then pdf
pdf: tex
	cd "$(OUTPUTDIR)" && arara -v "$(OUTPUTFILE)".tex

# Tex target use biblatex to generate bib entries - usenix mod
tex:
	pandoc $(INPUTDIR)/*.md \
	$(STYLEDIR)/metadata.yaml \
	-o "$(OUTPUTDIR)/$(OUTPUTFILE).tex" \
	-H "$(STYLEDIR)/preamble.tex" \
	--include-after-body "$(STYLEDIR)/postamble.tex" \
	--template="$(STYLEDIR)/template.tex" \
	-S \
	-N \
	--wrap=preserve \
	-F pandoc-crossref \
	--natbib \
	-V biblio-files="$(BIBFILE)" \
	--latex-engine=pdflatex 
	sed -i 's/\\cite[t,p]{/\\cite{/g' "$(OUTPUTDIR)/$(OUTPUTFILE).tex" 
	sed -i 's/{natbib}/{cite}/' "$(OUTPUTDIR)/$(OUTPUTFILE).tex"	
	
clean:
	cd "$(OUTPUTDIR)" && latexmk -C

OS = $(shell uname -s)
ifeq ($(strip $(OS)),Linux)
	PDF_VIEW = xdg-open
else
	PDF_VIEW = open -a /Applications/Preview.app
endif

view: 
	$(PDF_VIEW) "$(OUTPUTDIR)/$(OUTPUTFILE).pdf" &

.PHONY: pdf tex view
