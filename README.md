# uw-wkrpt

This is a LaTeX document class to make you life easier when writing work term reports for the University of Waterloo.

This class was originally written by Simon Law, and was available at: http://www.eng.uwaterloo.ca/~sfllaw/programs/uw-wkrpt/. It is now also available at: http://sfllaw.ca/programs/uw-wkrpt/

I have made some improvements and updates to bring this class more in line with the current work report guidelines. If you notice any issues or inconsistencies with the guidlines, please let me know, or send a pull request!

Please read INSTALL.md for installation/usage instructions.

# LaTeX Info

If you do not know LaTeX, please learn! It is not too
difficult to use, and is really quite helpful. You can read the
workreport-sample.pdf file included in this tarball, as well as:
"A not so short introduction to LaTeX2e: or LaTeX2e in 113 minutes": http://people.ee.ethz.ch/~oetiker/lshort/

You can also find more information on-line.  There is a FAQ
at: http://faq.tug.org and an page listing documentation for beginners
at: http://www.tug.org/begin.html

# Installation

To generate the class files, simply run:

    # make

This will generate uw-wkrpt.cls, which you can use to write your work report.

On a Windows system, to generate the cls file:

    > latex uw-wkrpt.ins

Note that if you change any of the *.dtx files, the cls will need to be regenerated.


uw-wkrpt now has an installation system.  If you are on a Unix-like
system, and have a complete TeX system, find where your texmf root is.
This should typically be /usr/share/texmf which implies that installing
is as easy as running:

    # make DESTDIR=/usr/share install

On some systems, PDFTeX is set to output to A4 paper, even
though we have set the default to letterpaper.  This is sad, and can be
worked around.  If you are running Debian GNU/Linux, you should run
texconfig and change the PAPER option in the XDVI, DVIPS, DVIPDFM, and
PDFTEX settings.  Otherwise, find the "pdftex.cfg" file which usually
lives in /etc/texmf/pdftex/pdftex.cfg.  Make sure it has these two
lines:

    page_width 8.5 true in
    page_height 11 true in

You will want to comment out any other instances of page_width and
page_height by using the % character.

# Examples

There are several examples included:

* uw-wkrpt-cecs.tex
* uw-wkrpt-ece.tex
* uw-wkrpt-math.tex
* uw-wkrpt-se.tex

# Files

* The README.md file is the one you are reading now.
* The NEWS file is a list of interesting things that have changed since the last release (before this class was under version control).
* The INSTALL.md file tells you how to install and use this document class.
* The ChangeLog file is a record of the changes made to the software (before this class was under version control).
* LICENSE contains a copy of the GNU General Public License.
* uw-wkrpt.ins is the docstrip installer.  Please see the INSTALL file.
* uw-wkrpt.dtx is the docstrip document that contains the entire uw-wkrpt package.
* uw-wkrpt-*.tex are example documents written using uw-wkrpt.cls. 
  It illustrates the way to write a document, and tries to adhere as 
  closely to the guidelines as possible.
* uw-wkrpt.bib is the bibliography or references list that is imported 
  by the example reports.
* don-hires.pdf is a picture of Donald E. Knuth, acquired from his 
  website and used in workreport-sample.tex.

# Other Useful Packages

You may wish to load some other useful packages to make your life
simpler, and your work report nicer.  After the ``\documentclass{uw-wkrpt}''
line, just add ``\usepackage{foo}'', where ``foo'' is the package name.

* acronym: for spelling out acronyms in full, the first time only.
* longtable: for tabular environments that break pages.
* tabularx: for tabular environments that know how wide they are.
* ltxtable: for a merge of longtable and tabularx, which may not work.
* times, mathptm: For using the Times font in your text and math.

-- Simon Law <sfllaw@uwaterloo.ca>  Wed, 30 Apr 2003 19:34:41 -0400
-- Casey Banner <cccbanne@engmail.uwaterloo.ca> Sat, 16 Apr 2011 14:28:31 -0400
