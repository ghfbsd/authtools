# authtools
Various tools for authoring publications in scholarly journals

peps.rb - Homebrew formula to fix PEPS LaTeX templates so that natbib
   \cite{} commands may be used for in-text citations.
   
   Usage:
      brew tap ghfbsd/authtools git://github.com/ghfbsd/authtools
      brew install peps
   
   Templates are installed in /usr/local/opt/peps/share/peps/.
   To test, copy them to a private directory and run LaTeX:

   cp /usr/local/opt/peps/share/peps/{peps-art.bst,peps_article.bib,pepsart.cls,peps_template_Research_Methodology.tex} .
   pdflatex peps_template_Research_Methodology.tex
   bibtex peps_template_Research_Methodology
   pdflatex peps_template_Research_Methodology.tex
   pdflatex peps_template_Research_Methodology.tex
   # PDF will be in peps_template_Research_Methodology.pdf
