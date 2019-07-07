class Peps < Formula
  desc "LaTeX templates for submission to PEPS enabling use of natbib citations"
  homepage "https://progearthplanetsci.springeropen.com/submission-guidelines"
  url "http://progearthplanetsci.org/docs/peps_template_Research_Methodology.zip"
  sha256 "a79db0aff0cd1a3ecae68f2566962aae3bf4dbd08bb55711bae8c0f96890c778"

  # Why don't these work?  Oh well...
  # depends_on cask: "mactex" => :optional
  # depends_on cask: "mactex-no-gui" => :optional

  patch :p0, :DATA

  def install
    pkgshare.install "peps-art.bst", "peps_article.bib", "pepsart.cls",
                     "peps_template_Research_Methodology.pdf",
                     "peps_template_Research_Methodology.tex"
  end

  def caveats; <<~EOS
    PEPS templates installed in #{opt_pkgshare}/ as

    peps_template_Research_Methodology.tex, peps-art.bst,
    peps_article.bib, and pepsart.cls

    and output peps_template_Research_Methodology.pdf
  EOS
  end

  test do
    # Checks that file is in expected place
    # assert_predicate "#{opt_pkgshare}/peps-art.bst", :exist?,
    #    "peps-art.bst file should exist"
    assert_equal "yes",
       shell_output("test -f #{opt_pkgshare}/peps-art.bst && echo yes").strip,
       "PEPS missing file(s)"
  end
end
__END__
diff -u peps_article-orig.bib peps_article.bib
--- peps_article-orig.bib	2019-07-07 10:08:44.000000000 +0100
+++ peps_article.bib	2019-07-07 10:04:23.000000000 +0100
@@ -2,6 +2,7 @@
 %
 %  An example of bibtex entries.
 %  Entries taken from BMC instructions for authors page.
+@settings{settings,options="nameyear",author="ignore",title="ignore"}


 @article{blank,
diff -u peps-art-orig.bst peps-art.bst
--- peps-art-orig.bst	2018-07-09 18:02:12.000000000 +0100
+++ peps-art.bst	2019-07-05 14:19:29.000000000 +0100
@@ -2168,6 +2168,8 @@
   end.element
 }

+FUNCTION {settings} { }
+
 FUNCTION {default.type} { unpublished }

 MACRO {jan} {"January"}

diff -u peps_template_Research_Methodology-orig.tex peps_template_Research_Methodology.tex
--- peps_template_Research_Methodology-orig.tex	2018-07-09 18:02:12.000000000 +0100
+++ peps_template_Research_Methodology.tex	2019-07-06 15:20:05.000000000 +0100
@@ -44,6 +44,8 @@
 
 %%% loading packages, author definitions
 
+\PassOptionsToPackage{round,authoryear}{natbib}
+
 %\documentclass[twocolumn]{bmcart}% uncomment this for twocolumn layout and comment line below
 \documentclass{pepsart}
 
@@ -54,6 +56,7 @@
 %\usepackage[applemac]{inputenc} %applemac support if unicode package fails
 %\usepackage[latin1]{inputenc} %UNIX support if unicode package fails
 \usepackage{wasysym}
+\usepackage{natbib}
 
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
@@ -258,6 +261,7 @@
 %%  \nocite{smith,marg,hunn,advi,koha,mouse} %%
 %%                                           %%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+\nocite{settings}
 \nocite{smi1999}
 \nocite{smi1999b}
 \nocite{sli2000a}
@@ -301,6 +305,13 @@
 This should explain the background to the article, its aims, a summary of a 
 search of the existing literature and the issue under discussion, and may 
 also be broken into subsections with short, informative headings.
+Include citations by using the usual natbib
+package commands \cite[e.g.][]{smi1999}.
+It is also possible to separate author names from the year, like in
+\cite{bro2001}, and to even make them part of the sentence, such
+as \citeauthor{bro2001}'s \citeyearpar{bro2001}, might have done in their
+publication.
+Multiple citations are simple \citep{bro2001,smi1999}.
 
 \subsection*{Subsection ABC}%Sub-heading for section
 
