## Makefile - Makefile for the uw-wkrpt package.
## Copyright (C) 2003  Simon Law
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
##

# Set the package name
PACKAGE = uw-wkrpt

# Use pdfLaTeX for best results
LATEX = pdflatex
LATEX2DVI = $(LATEX) \\pdfoutput=0 \\input
LATEX2PDF = $(LATEX) \\pdfoutput=1 \\input

# MakeIndex parameters
MAKEINDEX = makeindex
GIND = gind.ist
GGLO = gglo.ist

# Bibliography
BIBTEX = bibtex

# Texi2DVI knows most about compilation
TEXI2DVI = LATEX="$(LATEX2DVI)" texi2dvi -l latex
TEXI2PDF = PDFLATEX="$(LATEX2PDF)" texi2dvi -l latex -p


# Installation
INSTALL = /usr/bin/install -c
INSTALL_DATA = $(INSTALL) -m 644
DESTDIR = .
TDSFORMAT = latex/

# Shell
RM = rm -f

TEXFILES=\
         $(PACKAGE)*.aux\
         $(PACKAGE)*.bbl\
         $(PACKAGE)*.blg\
         $(PACKAGE)*.cls\
         $(PACKAGE)*.drv\
         $(PACKAGE)*.dvi\
         $(PACKAGE)*.glo\
         $(PACKAGE)*.gls\
         $(PACKAGE)*.idx\
         $(PACKAGE)*.ilg\
         $(PACKAGE)*.ind\
         $(PACKAGE)*.lof\
         $(PACKAGE)*.lot\
         $(PACKAGE)*.log\
         $(PACKAGE)*.pdf\
         $(PACKAGE)*.sty\
         $(PACKAGE)*.toc

.PHONY : all examples install uninstall dvi pdf examples-dvi examples-pdf clean

all : $(PACKAGE).cls $(PACKAGE).dvi $(PACKAGE).pdf ;

examples : examples-dvi examples-pdf ;

install : all examples
	$(INSTALL) -d $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)
	$(INSTALL) -d $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)
	$(INSTALL) -d $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/examples
	$(INSTALL_DATA) $(PACKAGE).cls $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)/
	$(INSTALL_DATA) $(PACKAGE).dvi $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/
	$(INSTALL_DATA) $(PACKAGE).pdf $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/
	$(INSTALL_DATA) $(PACKAGE)-*.tex $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/examples
	$(INSTALL_DATA) $(PACKAGE)-*.dvi $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/examples
	$(INSTALL_DATA) $(PACKAGE)-*.pdf $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/examples

uninstall :
	$(RM) $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)/$(PACKAGE).cls
	$(RM) $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/$(PACKAGE).dvi
	$(RM) $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/$(PACKAGE).pdf
	$(RM) -r $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)/examples
	-rmdir -p $(DESTDIR)/texmf/doc/$(TDSFORMAT)/$(PACKAGE)
	-rmdir -p $(DESTDIR)/texmf/tex/$(TDSFORMAT)/$(PACKAGE)

dvi : $(PACKAGE).dvi ;

examples-dvi : $(PACKAGE).cls    \
               $(PACKAGE)-cecs.dvi \
	       $(PACKAGE)-ece.dvi  \
	       $(PACKAGE)-math.dvi \
	       $(PACKAGE)-se.dvi   ;

pdf : $(PACKAGE).pdf ;

examples-pdf : $(PACKAGE).cls    \
               $(PACKAGE)-cecs.pdf \
	       $(PACKAGE)-ece.pdf  \
	       $(PACKAGE)-math.pdf \
	       $(PACKAGE)-se.pdf   ;

%.cls : %.ins %.dtx
	$(LATEX) $<

$(PACKAGE)-%.dvi : $(PACKAGE)-%.tex $(PACKAGE).cls don-hires.eps
	$(TEXI2DVI) $<

%.dvi : %.tex $(PACKAGE).cls
	$(TEXI2DVI) $<

%.pdf : %.tex $(PACKAGE).cls
	$(TEXI2PDF) $<

$(PACKAGE).dvi : $(PACKAGE).dtx $(PACKAGE).cls
	$(TEXI2DVI) $<
	$(MAKEINDEX) -s $(GIND) $(PACKAGE).idx
	$(MAKEINDEX) -s $(GGLO) -o $(PACKAGE).gls $(PACKAGE).glo
	$(LATEX2DVI) $<
	$(LATEX2DVI) $<

$(PACKAGE).pdf : $(PACKAGE).dtx $(PACKAGE).cls
	$(TEXI2PDF) $<
	$(MAKEINDEX) -s $(GIND) $(PACKAGE).idx
	$(MAKEINDEX) -s $(GGLO) -o $(PACKAGE).gls $(PACKAGE).glo
	$(LATEX2PDF) $<
	$(LATEX2PDF) $<

don-hires.eps : don-hires.pdf
	pdf2ps $< $@

don-hires.pdf : ;

clean :
	$(RM) $(TEXFILES) uw-ece-workreport.cls uw-ece-workreport.log don-hires.eps
