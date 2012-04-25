# uw-wkrpt

This is a LaTeX document class to make you life easier when writing work term
reports for the University of Waterloo.

This class was originally written by Simon Law, and is available
at his [website][1].

I have made some improvements and updates to bring this class more in line with
the current work report guidelines. If you notice any issues or inconsistencies
with the guidelines, please let me know, or send a pull request!

[1]: http://sfllaw.ca/programs/uw-wkrpt/

## LaTeX Info

If you do not know LaTeX, please learn! It is not too difficult to use, and is
really quite helpful. You can read any of the example work reports, as well as:
[A not so short introduction to LaTeX2e: or LaTeX2e in 113 minutes][2].

You can also find more information on-line.  There is an [FAQ][3] and a
[page listing documentation for beginners][4].

[2]: http://people.ee.ethz.ch/~oetiker/lshort/
[3]: http://faq.tug.org
[4]: http://www.tug.org/begin.html

## Installation

To generate the class files, simply run:

    # make

This will generate `uw-wkrpt.cls`, which you can use to write your work report.

On a Windows system, to generate the cls file:

    > latex uw-wkrpt.ins

Note that if you change any of the *.dtx files, the cls will need to be
regenerated.


To use the class, simply set the document class of a .tex file to `uw-wkrpt`, and
ensure that there's a copy of the class file in the same directory.


Alternatively, you may use uw-wkrpt's installation system.  If you are on a
Unix-like system, and have a complete TeX system, find where your texmf root is.
This should typically be `/usr/share/texmf` which implies that installing
is as easy as running:

    # make DESTDIR=/usr/share install

On some systems, PDFTeX is set to output to A4 paper, even
though we have set the default to letterpaper.  This is sad, and can be
worked around.  If you are running Debian GNU/Linux, you should run
`texconfig` and change the PAPER option in the XDVI, DVIPS, DVIPDFM, and
PDFTEX settings.  Otherwise, find the "pdftex.cfg" file which usually
lives in `/etc/texmf/pdftex/pdftex.cfg`.  Make sure it has these two
lines:

    page_width 8.5 true in
    page_height 11 true in

You will want to comment out any other instances of `page_width` and
`page_height` by using the `%` character.

## Examples

There are several examples included:

* uw-wkrpt-cecs.tex
* uw-wkrpt-ece.tex
* uw-wkrpt-math.tex
* uw-wkrpt-se.tex

## Creating a PDF from a .tex file

If you have a report.tex file, and would like to generate a PDF from it, simply
run `pdflatex`. Note that you may need to run `pdflatex` several times, to
ensure all the auxilliary files (eg table of contents) are created. You will
also have to run `bibtex` to generate the bibliography, and then run `pdflatex`
again, afterwards.

To simply this process, you may find [Latexmk][5] to be useful.

[5]: http://www.phys.psu.edu/~collins/software/latexmk-jcc/

Latexmk will run `pdflatex` and `bibtex` as many times as is necessary for you,
so you only need to call it once. See Makefile.example.

## Files

* The README.md file is the one you are reading now.
* The NEWS file is a list of interesting things that have changed since the last
  release (before this class was under version control).
* The ChangeLog file is a record of the changes made to the software (before
  this class was under version control).
* LICENSE contains a copy of the GNU General Public License.
* Makefile is the makefile for generating the uw-wkrpt class and documentation.
* uw-wkrpt.ins is the docstrip installer.
* uw-wkrpt.dtx is the docstrip document that contains the entire uw-wkrpt
  package.
* uw-wkrpt-*.tex are example documents written using uw-wkrpt.cls. 
  It illustrates the way to write a document, and tries to adhere as 
  closely to the guidelines as possible.
* uw-wkrpt.bib is the bibliography or references list that is imported 
  by the example reports.
* Makefile.example is an example makefile that demonstrates the use of Latexmk.
* don-hires.pdf is a picture of Donald E. Knuth, acquired from his 
  website and used in workreport-sample.tex.

# Other Useful Packages

You may wish to load some other useful packages to make your life
simpler, and your work report nicer.  After the `\documentclass{uw-wkrpt}`
line, just add `\usepackage{foo}`, where `foo` is the package name.

* acronym: for spelling out acronyms in full, the first time only.
* algpseudocode: for including pseudocode.
* framed: for adding frames (borders) around certain elements.
* listings: for including source code listings.
* longtable: for tabular environments that break pages.
* tabularx: for tabular environments that know how wide they are.
* ltxtable: for a merge of longtable and tabularx, which may not work.
* times, mathptm: for using the Times font in your text and math.

# Contributors

-- Simon Law <sfllaw@uwaterloo.ca>  Wed, 30 Apr 2003 19:34:41 -0400

-- Casey Banner <cccbanne@engmail.uwaterloo.ca> Sat, 16 Apr 2011 14:28:31 -0400

-- Cory Snider <corhere@gmail.com> Fri, 16 Sep 2011 01:13:02 -0400

-- Ming-Ho Yee <ming-ho.yee@uwaterloo.ca> Tue, 24 Apr 2012 20:38:12 -0400
