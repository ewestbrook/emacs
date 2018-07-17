;;; ox-ewmd.el --- Material Design HTML Back-End for Org

;; Copyright (C) 2011-2014 Free Software Foundation, Inc.
;; Copyright (C) 2016 Brandon van Beekum
;; Copyright (C) 2018 Eric Westbrook

;; Author: Carsten Dominik <carsten at orgmode dot org>
;;         Jambunathan K <kjambunathan at gmail dot com>
;;         Brandon van Beekum <marsmining at gmail dot com>
;;         Eric Westbrook <ewmd@westbrook.io>
;; URL: https://git.westbrook.io/eric/ox-ewmd
;; Keywords: org, html, publish, material, design
;; Version: 1.1.1

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This library implements an HTML back-end for exporting org-mode
;; docs as HTML compatible with Twitter Bootstrap and Material Design. Use the function
;; `org-ewmd-export-to-html` to export an org file. For publishing
;; use the function `org-ewmd-publish-to-html`.

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;;; Dependencies

(require 'ox-twbs)


;;; Function Declarations

;;; Define Back-End

(org-export-define-backend 'ewmd
  '((bold . org-ewmd-bold)
    (center-block . org-ewmd-center-block)
    (clock . org-ewmd-clock)
    (code . org-ewmd-code)
    (drawer . org-ewmd-drawer)
    (dynamic-block . org-ewmd-dynamic-block)
    (entity . org-ewmd-entity)
    (example-block . org-ewmd-example-block)
    (export-block . org-ewmd-export-block)
    (export-snippet . org-ewmd-export-snippet)
    (fixed-width . org-ewmd-fixed-width)
    (footnote-definition . org-ewmd-footnote-definition)
    (footnote-reference . org-ewmd-footnote-reference)
    (headline . org-ewmd-headline)
    (horizontal-rule . org-ewmd-horizontal-rule)
    (inline-src-block . org-ewmd-inline-src-block)
    (inlinetask . org-ewmd-inlinetask)
    (inner-template . org-ewmd-inner-template)
    (italic . org-ewmd-italic)
    (item . org-ewmd-item)
    (keyword . org-ewmd-keyword)
    (latex-environment . org-ewmd-latex-environment)
    (latex-fragment . org-ewmd-latex-fragment)
    (line-break . org-ewmd-line-break)
    (link . org-ewmd-link)
    (paragraph . org-ewmd-paragraph)
    (plain-list . org-ewmd-plain-list)
    (plain-text . org-ewmd-plain-text)
    (planning . org-ewmd-planning)
    (property-drawer . org-ewmd-property-drawer)
    (quote-block . org-ewmd-quote-block)
    (quote-section . org-ewmd-quote-section)
    (radio-target . org-ewmd-radio-target)
    (section . org-ewmd-section)
    (special-block . org-ewmd-special-block)
    (src-block . org-ewmd-src-block)
    (statistics-cookie . org-ewmd-statistics-cookie)
    (strike-through . org-ewmd-strike-through)
    (subscript . org-ewmd-subscript)
    (superscript . org-ewmd-superscript)
    (table . org-ewmd-table)
    (table-cell . org-ewmd-table-cell)
    (table-row . org-ewmd-table-row)
    (target . org-ewmd-target)
    (template . org-ewmd-template)
    (timestamp . org-ewmd-timestamp)
    (underline . org-ewmd-underline)
    (verbatim . org-ewmd-verbatim)
    (verse-block . org-ewmd-verse-block))
  :filters-alist '((:filter-final-output . org-ewmd-final-function))
  :menu-entry
  '(?w "Export to EWMD HTML"
       ((?H "As HTML buffer" org-ewmd-export-as-html)
        (?h "As HTML file" org-ewmd-export-to-html)
        (?o "As HTML file and open"
            (lambda (a s v b)
              (if a (org-ewmd-export-to-html t s v b)
                (org-open-file (org-ewmd-export-to-html nil s v b)))))))
  :options-alist
  '((:html-extension nil nil org-ewmd-extension)
    (:html-link-org-files-as-html nil nil org-ewmd-link-org-files-as-html)
    (:html-container "HTML_CONTAINER" nil org-ewmd-container-element)
    (:html-link-use-abs-url nil "html-link-use-abs-url" org-ewmd-link-use-abs-url)
    (:html-link-home "HTML_LINK_HOME" nil org-ewmd-link-home)
    (:html-link-up "HTML_LINK_UP" nil org-ewmd-link-up)
    (:html-mathjax "HTML_MATHJAX" nil "" space)
    (:html-mathjax-options nil nil org-ewmd-mathjax-options)
    (:html-mathjax-template nil nil org-ewmd-mathjax-template)
    (:html-postamble nil "html-postamble" org-ewmd-postamble)
    (:html-preamble nil "html-preamble" org-ewmd-preamble)
    (:html-head "HTML_HEAD" nil org-ewmd-head newline)
    (:html-head-extra "HTML_HEAD_EXTRA" nil org-ewmd-head-extra newline)
    (:html-head-include-default-style nil "html-style" org-ewmd-head-include-default-style)
    (:html-head-include-scripts nil "html-scripts" org-ewmd-head-include-scripts)
    (:html-table-attributes nil nil org-ewmd-table-default-attributes)
    (:html-table-row-tags nil nil org-ewmd-table-row-tags)
    (:html-inline-images nil nil org-ewmd-inline-images)
    (:html-inline-image-rules nil nil org-ewmd-inline-image-rules)
    ;; Redefine regular options.
    (:creator "CREATOR" nil org-ewmd-creator-string)
    (:with-latex nil "tex" org-ewmd-with-latex)
    (:with-toc nil nil 2)
    (:with-creator nil nil t)
    (:section-numbers nil nil t)
    ;; Extra Options
    (:gid nil "gid" nil)
    (:with-headline-numbers nil "whn" t)
    (:with-toc-todo-keywords nil "toc-todo" nil)
    (:with-toc-tags nil "toc-tag" nil)
    ;; Retrieve LaTeX header for fragments.
    (:latex-header "LATEX_HEADER" nil nil newline)))


;;; Internal Variables

(defvar org-ewmd-format-table-no-css)
(defvar htmlize-buffer-places)  ; from htmlize.el

(defvar org-ewmd--pre/postamble-class ""
  "CSS class used for pre/postamble")

(defconst org-ewmd-special-string-regexps
  '(("\\\\-" . "&#x00ad;")              ; shy
    ("---\\([^-]\\)" . "&#x2014;\\1")   ; mdash
    ("--\\([^-]\\)" . "&#x2013;\\1")    ; ndash
    ("\\.\\.\\." . "&#x2026;"))         ; hellip
  "Regular expressions for special string conversion.")

(defconst org-ewmd-scripts
  "<script type=\"text/javascript\">
$(function() {
    'use strict';

    $('.bs-docs-sidebar li').first().addClass('active');

    $(document.body).scrollspy({target: '.bs-docs-sidebar'});

    $('.bs-docs-sidebar').affix();
});
</script>"
  "Basic JavaScript that is needed by HTML files produced by Org mode.")

(defconst org-ewmd-style-default
  "<style type=\"text/css\">
/* org mode styles on top of ewmd */

html {
    position: relative;
    min-height: 100%;
}

body {
    font-size: 18px;
    margin-bottom: 105px;
}

footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    height: 101px;
    background-color: #f5f5f5;
}

footer > div {
    padding: 10px;
}

footer p {
    margin: 0 0 5px;
    text-align: center;
    font-size: 16px;
}

#table-of-contents {
    margin-top: 20px;
    margin-bottom: 20px;
}

blockquote p {
    font-size: 18px;
}

pre {
    font-size: 16px;
}

.footpara {
    display: inline-block;
}

figcaption {
  font-size: 16px;
  color: #666;
  font-style: italic;
  padding-bottom: 15px;
}

/* from ewmd docs */

.bs-docs-sidebar.affix {
    position: static;
}
@media (min-width: 768px) {
    .bs-docs-sidebar {
        padding-left: 20px;
    }
}

/* All levels of nav */
.bs-docs-sidebar .nav > li > a {
    display: block;
    padding: 4px 20px;
    font-size: 14px;
    font-weight: 500;
    color: #999;
}
.bs-docs-sidebar .nav > li > a:hover,
.bs-docs-sidebar .nav > li > a:focus {
    padding-left: 19px;
    color: #A1283B;
    text-decoration: none;
    background-color: transparent;
    border-left: 1px solid #A1283B;
}
.bs-docs-sidebar .nav > .active > a,
.bs-docs-sidebar .nav > .active:hover > a,
.bs-docs-sidebar .nav > .active:focus > a {
    padding-left: 18px;
    font-weight: bold;
    color: #A1283B;
    background-color: transparent;
    border-left: 2px solid #A1283B;
}

/* Nav: second level (shown on .active) */
.bs-docs-sidebar .nav .nav {
    display: none; /* Hide by default, but at >768px, show it */
    padding-bottom: 10px;
}
.bs-docs-sidebar .nav .nav > li > a {
    padding-top: 1px;
    padding-bottom: 1px;
    padding-left: 30px;
    font-size: 12px;
    font-weight: normal;
}
.bs-docs-sidebar .nav .nav > li > a:hover,
.bs-docs-sidebar .nav .nav > li > a:focus {
    padding-left: 29px;
}
.bs-docs-sidebar .nav .nav > .active > a,
.bs-docs-sidebar .nav .nav > .active:hover > a,
.bs-docs-sidebar .nav .nav > .active:focus > a {
    padding-left: 28px;
    font-weight: 500;
}

/* Nav: third level (shown on .active) */
.bs-docs-sidebar .nav .nav .nav {
    padding-bottom: 10px;
}
.bs-docs-sidebar .nav .nav .nav > li > a {
    padding-top: 1px;
    padding-bottom: 1px;
    padding-left: 40px;
    font-size: 12px;
    font-weight: normal;
}
.bs-docs-sidebar .nav .nav .nav > li > a:hover,
.bs-docs-sidebar .nav .nav .nav > li > a:focus {
    padding-left: 39px;
}
.bs-docs-sidebar .nav .nav .nav > .active > a,
.bs-docs-sidebar .nav .nav .nav > .active:hover > a,
.bs-docs-sidebar .nav .nav .nav > .active:focus > a {
    padding-left: 38px;
    font-weight: 500;
}

/* Show and affix the side nav when space allows it */
@media (min-width: 992px) {
    .bs-docs-sidebar .nav > .active > ul {
        display: block;
    }
    /* Widen the fixed sidebar */
    .bs-docs-sidebar.affix,
    .bs-docs-sidebar.affix-bottom {
        width: 213px;
    }
    .bs-docs-sidebar.affix {
        position: fixed; /* Undo the static from mobile first approach */
        top: 20px;
    }
    .bs-docs-sidebar.affix-bottom {
        position: absolute; /* Undo the static from mobile first approach */
    }
    .bs-docs-sidebar.affix .bs-docs-sidenav,.bs-docs-sidebar.affix-bottom .bs-docs-sidenav {
        margin-top: 0;
        margin-bottom: 0
    }
}
@media (min-width: 1200px) {
    /* Widen the fixed sidebar again */
    .bs-docs-sidebar.affix-bottom,
    .bs-docs-sidebar.affix {
        width: 263px;
    }
}
</style>"
  "The default style specification for exported HTML files.
You can use `org-ewmd-head' and `org-ewmd-head-extra' to add to
this style.  If you don't want to include this default style,
customize `org-ewmd-head-include-default-style'.")


;;; User Configuration Variables

(defgroup org-export-ewmd nil
  "Options for exporting Org mode files to HTML."
  :tag "Org Export HTML"
  :group 'org-export)

;;;; Bold, etc.

(defcustom org-ewmd-text-markup-alist
  '((bold . "<b>%s</b>")
    (code . "<code>%s</code>")
    (italic . "<i>%s</i>")
    (strike-through . "<del>%s</del>")
    (underline . "<span class=\"underline\">%s</span>")
    (verbatim . "<code>%s</code>"))
  "Alist of HTML expressions to convert text markup.

The key must be a symbol among `bold', `code', `italic',
`strike-through', `underline' and `verbatim'.  The value is
a formatting string to wrap fontified text with.

If no association can be found for a given markup, text will be
returned as-is."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type '(alist :key-type (symbol :tag "Markup type")
                :value-type (string :tag "Format string"))
  :options '(bold code italic strike-through underline verbatim))

(defcustom org-ewmd-indent nil
  "Non-nil means to indent the generated HTML.
Warning: non-nil may break indentation of source code blocks."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'boolean)

(defcustom org-ewmd-use-unicode-chars nil
  "Non-nil means to use unicode characters instead of HTML entities."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'boolean)

;;;; Drawers

(defcustom org-ewmd-format-drawer-function
  (lambda (name contents) contents)
  "Function called to format a drawer in HTML code.

The function must accept two parameters:
  NAME      the drawer name, like \"LOGBOOK\"
  CONTENTS  the contents of the drawer.

The function should return the string to be exported.

For example, the variable could be set to the following function
in order to mimic default behaviour:

The default value simply returns the value of CONTENTS."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'function)

;;;; Footnotes

(defcustom org-ewmd-footnotes-section "<div id=\"footnotes\">
<h2 class=\"footnotes\">%s: </h2>
<div id=\"text-footnotes\">
%s
</div>
</div>"
  "Format for the footnotes section.
Should contain a two instances of %s.  The first will be replaced with the
language-specific word for \"Footnotes\", the second one will be replaced
by the footnotes themselves."
  :group 'org-export-ewmd
  :type 'string)

(defcustom org-ewmd-footnote-format "<sup>%s</sup>"
  "The format for the footnote reference.
%s will be replaced by the footnote reference itself."
  :group 'org-export-ewmd
  :type 'string)

(defcustom org-ewmd-footnote-separator "<sup>, </sup>"
  "Text used to separate footnotes."
  :group 'org-export-ewmd
  :type 'string)

;;;; Headline

(defcustom org-ewmd-toplevel-hlevel 2
  "The <H> level for level 1 headings in HTML export.
This is also important for the classes that will be wrapped around headlines
and outline structure.  If this variable is 1, the top-level headlines will
be <h1>, and the corresponding classes will be outline-1, section-number-1,
and outline-text-1.  If this is 2, all of these will get a 2 instead.
The default for this variable is 2, because we use <h1> for formatting the
document title."
  :group 'org-export-ewmd
  :type 'integer)

(defcustom org-ewmd-format-headline-function 'ignore
  "Function to format headline text.

This function will be called with 5 arguments:
TODO      the todo keyword (string or nil).
TODO-TYPE the type of todo (symbol: `todo', `done', nil)
PRIORITY  the priority of the headline (integer or nil)
TEXT      the main headline text (string).
TAGS      the tags (string or nil).

The function result will be used in the section format string."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'function)

;;;; HTML-specific

(defcustom org-ewmd-allow-name-attribute-in-anchors t
  "When nil, do not set \"name\" attribute in anchors.
By default, anchors are formatted with both \"id\" and \"name\"
attributes, when appropriate."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'boolean)

;;;; Inlinetasks

(defcustom org-ewmd-format-inlinetask-function 'ignore
  "Function called to format an inlinetask in HTML code.

The function must accept six parameters:
  TODO      the todo keyword, as a string
  TODO-TYPE the todo type, a symbol among `todo', `done' and nil.
  PRIORITY  the inlinetask priority, as a string
  NAME      the inlinetask name, as a string.
  TAGS      the inlinetask tags, as a list of strings.
  CONTENTS  the contents of the inlinetask, as a string.

The function should return the string to be exported."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'function)

;;;; LaTeX

(defcustom org-ewmd-with-latex org-export-with-latex
  "Non-nil means process LaTeX math snippets.

When set, the exporter will process LaTeX environments and
fragments.

This option can also be set with the +OPTIONS line,
e.g. \"tex:mathjax\".  Allowed values are:

nil            Ignore math snippets.
`verbatim'     Keep everything in verbatim
`dvipng'       Process the LaTeX fragments to images.  This will also
               include processing of non-math environments.
`imagemagick'  Convert the LaTeX fragments to pdf files and use
               imagemagick to convert pdf files to png files.
`mathjax'      Do MathJax preprocessing and arrange for MathJax.js to
               be loaded.
t              Synonym for `mathjax'."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type '(choice
          (const :tag "Do not process math in any way" nil)
          (const :tag "Use dvipng to make images" dvipng)
          (const :tag "Use imagemagick to make images" imagemagick)
          (const :tag "Use MathJax to display math" mathjax)
          (const :tag "Leave math verbatim" verbatim)))

;;;; Links :: Generic

(defcustom org-ewmd-link-org-files-as-html t
  "Non-nil means make file links to `file.org' point to `file.html'.
When `org-mode' is exporting an `org-mode' file to HTML, links to
non-html files are directly put into a href tag in HTML.
However, links to other Org-mode files (recognized by the
extension `.org.) should become links to the corresponding html
file, assuming that the linked `org-mode' file will also be
converted to HTML.
When nil, the links still point to the plain `.org' file."
  :group 'org-export-ewmd
  :type 'boolean)

;;;; Links :: Inline images

(defcustom org-ewmd-inline-images t
  "Non-nil means inline images into exported HTML pages.
This is done using an <img> tag.  When nil, an anchor with href is used to
link to the image."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.1")
  :type 'boolean)

(defcustom org-ewmd-inline-image-rules
  '(("file" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'")
    ("http" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'")
    ("https" . "\\.\\(jpeg\\|jpg\\|png\\|gif\\|svg\\)\\'"))
  "Rules characterizing image files that can be inlined into HTML.
A rule consists in an association whose key is the type of link
to consider, and value is a regexp that will be matched against
link's path."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type '(alist :key-type (string :tag "Type")
                :value-type (regexp :tag "Path")))

;;;; Plain Text

(defcustom org-ewmd-protect-char-alist
  '(("&" . "&amp;")
    ("<" . "&lt;")
    (">" . "&gt;"))
  "Alist of characters to be converted by `org-ewmd-protect'."
  :group 'org-export-ewmd
  :type '(repeat (cons (string :tag "Character")
                       (string :tag "HTML equivalent"))))

;;;; Src Block

(defcustom org-ewmd-htmlize-output-type 'inline-css
  "Output type to be used by htmlize when formatting code snippets.
Choices are `css', to export the CSS selectors only, or `inline-css', to
export the CSS attribute values inline in the HTML.  We use as default
`inline-css', in order to make the resulting HTML self-containing.

However, this will fail when using Emacs in batch mode for export, because
then no rich font definitions are in place.  It will also not be good if
people with different Emacs setup contribute HTML files to a website,
because the fonts will represent the individual setups.  In these cases,
it is much better to let Org/Htmlize assign classes only, and to use
a style file to define the look of these classes.
To get a start for your css file, start Emacs session and make sure that
all the faces you are interested in are defined, for example by loading files
in all modes you want.  Then, use the command
\\[org-ewmd-htmlize-generate-css] to extract class definitions."
  :group 'org-export-ewmd
  :type '(choice (const css) (const inline-css)))

(defcustom org-ewmd-htmlize-font-prefix "org-"
  "The prefix for CSS class names for htmlize font specifications."
  :group 'org-export-ewmd
  :type 'string)

;;;; Table

(defcustom org-ewmd-table-default-attributes
  '(:class "table table-striped table-bordered table-hover table-condensed")
  "Default attributes and values which will be used in table tags.
This is a plist where attributes are symbols, starting with
colons, and values are strings."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type '(plist :key-type (symbol :tag "Property")
                :value-type (string :tag "Value")))

(defcustom org-ewmd-table-header-tags '("<th scope=\"%s\"%s>" . "</th>")
  "The opening tag for table header fields.
This is customizable so that alignment options can be specified.
The first %s will be filled with the scope of the field, either row or col.
The second %s will be replaced by a style entry to align the field.
See also the variable `org-ewmd-table-use-header-tags-for-first-column'.
See also the variable `org-ewmd-table-align-individual-fields'."
  :group 'org-export-ewmd
  :type '(cons (string :tag "Opening tag") (string :tag "Closing tag")))

(defcustom org-ewmd-table-data-tags '("<td%s>" . "</td>")
  "The opening tag for table data fields.
This is customizable so that alignment options can be specified.
The first %s will be filled with the scope of the field, either row or col.
The second %s will be replaced by a style entry to align the field.
See also the variable `org-ewmd-table-align-individual-fields'."
  :group 'org-export-ewmd
  :type '(cons (string :tag "Opening tag") (string :tag "Closing tag")))

(defcustom org-ewmd-table-row-tags '("<tr>" . "</tr>")
  "The opening and ending tags for table rows.
This is customizable so that alignment options can be specified.
Instead of strings, these can be Lisp forms that will be
evaluated for each row in order to construct the table row tags.

During evaluation, these variables will be dynamically bound so that
you can reuse them:

       `row-number': row number (0 is the first row)
  `rowgroup-number': group number of current row
 `start-rowgroup-p': non-nil means the row starts a group
   `end-rowgroup-p': non-nil means the row ends a group
        `top-row-p': non-nil means this is the top row
     `bottom-row-p': non-nil means this is the bottom row

For example:

\(setq org-ewmd-table-row-tags
      (cons '(cond (top-row-p \"<tr class=\\\"tr-top\\\">\")
                   (bottom-row-p \"<tr class=\\\"tr-bottom\\\">\")
                   (t (if (= (mod row-number 2) 1)
                          \"<tr class=\\\"tr-odd\\\">\"
                        \"<tr class=\\\"tr-even\\\">\")))
            \"</tr>\"))

will use the \"tr-top\" and \"tr-bottom\" classes for the top row
and the bottom row, and otherwise alternate between \"tr-odd\" and
\"tr-even\" for odd and even rows."
  :group 'org-export-ewmd
  :type '(cons
          (choice :tag "Opening tag"
                  (string :tag "Specify")
                  (sexp))
          (choice :tag "Closing tag"
                  (string :tag "Specify")
                  (sexp))))

(defcustom org-ewmd-table-align-individual-fields t
  "Non-nil means attach style attributes for alignment to each table field.
When nil, alignment will only be specified in the column tags, but this
is ignored by some browsers (like Firefox, Safari).  Opera does it right
though."
  :group 'org-export-ewmd
  :type 'boolean)

(defcustom org-ewmd-table-use-header-tags-for-first-column nil
  "Non-nil means format column one in tables with header tags.
When nil, also column one will use data tags."
  :group 'org-export-ewmd
  :type 'boolean)

(defcustom org-ewmd-table-caption-above t
  "When non-nil, place caption string at the beginning of the table.
Otherwise, place it near the end."
  :group 'org-export-ewmd
  :type 'boolean)

;;;; Tags

(defcustom org-ewmd-tag-class "badge"
  "Class name for tags."
  :group 'org-export-ewmd
  :type 'string)

(defcustom org-ewmd-tag-class-prefix ""
  "Prefix to class names for TODO keywords.
Each tag gets a class given by the tag itself, with this prefix.
The default prefix is empty because it is nice to just use the keyword
as a class name.  But if you get into conflicts with other, existing
CSS classes, then this prefix can be very useful."
  :group 'org-export-ewmd
  :type 'string)

;;;; Template :: Generic

(defcustom org-ewmd-extension "html"
  "The extension for exported HTML files."
  :group 'org-export-ewmd
  :type 'string)

(defcustom org-ewmd-coding-system 'utf-8
  "Coding system for HTML export.
Use utf-8 as the default value."
  :group 'org-export-html
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'coding-system)

(defcustom org-ewmd-container-element "div"
  "HTML element to use for wrapping top level sections.
Can be set with the in-buffer HTML_CONTAINER property or for
publishing, with :html-container."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'string)

(defcustom org-ewmd-divs
  '((preamble  "div" "preamble")
    (content   "div" "content" "container")
    (postamble "footer" "postamble"))
  "Alist of the three section elements for HTML export.
The car of each entry is one of 'preamble, 'content or 'postamble.
The cdrs of each entry are the ELEMENT_TYPE and ID for each
section of the exported document.

Note that changing the default will prevent you from using
org-info.js for your website."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type '(list :greedy t
               (list :tag "Preamble"
                     (const :format "" preamble)
                     (string :tag "element") (string :tag "     id"))
               (list :tag "Content"
                     (const :format "" content)
                     (string :tag "element") (string :tag "     id"))
               (list :tag "Postamble" (const :format "" postamble)
                     (string :tag "     id") (string :tag "element"))))

(defcustom org-ewmd-metadata-timestamp-format "%Y-%m-%d %a %H:%M"
  "Format used for timestamps in preamble, postamble and metadata.
See `format-time-string' for more information on its components."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'string)

;;;; Template :: Mathjax

(defcustom org-ewmd-mathjax-options
  '((path  "https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS_SVG")
    (scale "100")
    (dscale "100")
    (align "center")
    (indent "2em")
    (messages "none"))
  "Options for MathJax setup.

path        The path where to find MathJax
scale       Scaling for the HTML-CSS backend, omit percentage symbol
dscale      Scaling for displayed math, omit percentage symbol
align       How to align display math: left, center, or right
indent      If align is not center, how far from the left/right side?
messages    Should display messages in corner?

You can also customize this for each buffer, using something like

#+HTML_MATHJAX: scale:110 dscale:190 align:left messages:none"
  :group 'org-export-ewmd
  :type '(list :greedy t
               (list :tag "path   (the path from where to load MathJax.js)"
                     (const :format "       " path) (string))
               (list :tag "scale  (scaling for math)"
                     (const :format "       " scale) (string))
               (list :tag "dscale  (scaling for the displayed math)"
                     (const :format "       " scale) (string))
               (list :tag "align  (alignment of displayed equations)"
                     (const :format "       " align) (string))
               (list :tag "indent (indentation with left or right alignment)"
                     (const :format "       " indent) (string))
               (list :tag "messages (show pocessing messages in corner)"
                     (const :format "       " messages)
                     (choice (const "none")
                             (const "simple")))))

(defcustom org-ewmd-mathjax-template
  "
<script type=\"text/x-mathjax-config\">
MathJax.Hub.Config({
  displayAlign: \"%ALIGN\",
  displayIndent: \"%INDENT\",
  messageStyle: \"%MESSAGES\",
  \"HTML-CSS\": {
    scale: %SCALE,
    styles: {
      \".MathJax_Display\": {
        \"font-size\": \"%DSCALE%\"
      }
    }
  },
  \"SVG\": {
    scale: %SCALE,
    styles: {
      \".MathJax_SVG_Display\": {
        \"font-size\": \"%DSCALE%\",
        \"margin-left\": \"-2.281em\"
      }
    }
  }
});
</script>
<script type=\"text/javascript\" src=\"%PATH\"></script>"
  "The MathJax setup for HTML files."
  :group 'org-export-ewmd
  :type 'string)

;;;; Template :: Postamble

(defcustom org-ewmd-postamble 'auto
  "Non-nil means insert a postamble in HTML export.

When set to 'auto, check against the
`org-export-with-author/email/creator/date' variables to set the
content of the postamble.  When set to a string, use this string
as the postamble.  When t, insert a string as defined by the
formatting string in `org-ewmd-postamble-format'.

When set to a function, apply this function and insert the
returned string.  The function takes the property list of export
options as its only argument.

Setting :html-postamble in publishing projects will take
precedence over this variable."
  :group 'org-export-ewmd
  :type '(choice (const :tag "No postamble" nil)
                 (const :tag "Auto postamble" auto)
                 (const :tag "Default formatting string" t)
                 (string :tag "Custom formatting string")
                 (function :tag "Function (must return a string)")))

(defcustom org-ewmd-postamble-format
  '(("en" "<p class=\"author\">Author: %a (%e)</p>
<p class=\"date\">Date: %d</p>
<p class=\"creator\">%c</p>"))
  "Alist of languages and format strings for the HTML postamble.

The first element of each list is the language code, as used for
the LANGUAGE keyword.  See `org-export-default-language'.

The second element of each list is a format string to format the
postamble itself.  This format string can contain these elements:

  %t stands for the title.
  %a stands for the author's name.
  %e stands for the author's email.
  %d stands for the date.
  %c will be replaced by `org-ewmd-creator-string'.
  %v will be replaced by `org-ewmd-validation-link'.
  %T will be replaced by the export time.
  %C will be replaced by the last modification time.

If you need to use a \"%\" character, you need to escape it
like that: \"%%\"."
  :group 'org-export-ewmd
  :type '(repeat
          (list (string :tag "Language")
                (string :tag "Format string"))))

(defcustom org-ewmd-validation-link
  "<a href=\"http://validator.w3.org/check?uri=referer\">Validate</a>"
  "Link to HTML validation service."
  :group 'org-export-ewmd
  :type 'string)

(defcustom org-ewmd-creator-string
  (format "<a href=\"http://www.gnu.org/software/emacs/\">Emacs</a> %s (<a href=\"http://orgmode.org\">Org-mode</a> %s)"
          emacs-version
          (if (fboundp 'org-version) (org-version) "unknown version"))
  "Information about the creator of the HTML document.
This option can also be set on with the CREATOR keyword."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type '(string :tag "Creator string"))

;;;; Template :: Preamble

(defcustom org-ewmd-preamble t
  "Non-nil means insert a preamble in HTML export.

When t, insert a string as defined by the formatting string in
`org-ewmd-preamble-format'.  When set to a string, use this
formatting string instead (see `org-ewmd-postamble-format' for an
example of such a formatting string).

When set to a function, apply this function and insert the
returned string.  The function takes the property list of export
options as its only argument.

Setting :html-preamble in publishing projects will take
precedence over this variable."
  :group 'org-export-ewmd
  :type '(choice (const :tag "No preamble" nil)
                 (const :tag "Default preamble" t)
                 (string :tag "Custom formatting string")
                 (function :tag "Function (must return a string)")))

(defcustom org-ewmd-preamble-format '(("en" ""))
  "Alist of languages and format strings for the HTML preamble.

The first element of each list is the language code, as used for
the LANGUAGE keyword.  See `org-export-default-language'.

The second element of each list is a format string to format the
preamble itself.  This format string can contain these elements:

  %t stands for the title.
  %a stands for the author's name.
  %e stands for the author's email.
  %d stands for the date.
  %c will be replaced by `org-ewmd-creator-string'.
  %v will be replaced by `org-ewmd-validation-link'.
  %T will be replaced by the export time.
  %C will be replaced by the last modification time.

If you need to use a \"%\" character, you need to escape it
like that: \"%%\".

See the default value of `org-ewmd-postamble-format' for an
example."
  :group 'org-export-ewmd
  :type '(repeat
          (list (string :tag "Language")
                (string :tag "Format string"))))

(defcustom org-ewmd-link-up ""
  "Where should the \"UP\" link of exported HTML pages lead?"
  :group 'org-export-ewmd
  :type '(string :tag "File or URL"))

(defcustom org-ewmd-link-home ""
  "Where should the \"HOME\" link of exported HTML pages lead?"
  :group 'org-export-ewmd
  :type '(string :tag "File or URL"))

(defcustom org-ewmd-link-use-abs-url nil
  "Should we prepend relative links with HTML_LINK_HOME?"
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.1")
  :type 'boolean)

(defcustom org-ewmd-home/up-format
  "<div id=\"org-div-home-and-up\">
 <a accesskey=\"h\" href=\"%s\"> UP </a>
 |
 <a accesskey=\"H\" href=\"%s\"> HOME </a>
</div>"
  "Snippet used to insert the HOME and UP links.
This is a format string, the first %s will receive the UP link,
the second the HOME link.  If both `org-ewmd-link-up' and
`org-ewmd-link-home' are empty, the entire snippet will be
ignored."
  :group 'org-export-ewmd
  :type 'string)

;;;; Template :: Scripts

(define-obsolete-variable-alias
  'org-ewmd-style-include-scripts 'org-ewmd-head-include-scripts "24.4")
(defcustom org-ewmd-head-include-scripts t
  "Non-nil means include the JavaScript snippets in exported HTML files.
The actual script is defined in `org-ewmd-scripts' and should
not be modified."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'boolean)

;;;; Template :: Styles

(define-obsolete-variable-alias
  'org-ewmd-style-include-default 'org-ewmd-head-include-default-style "24.4")
(defcustom org-ewmd-head-include-default-style t
  "Non-nil means include the default style in exported HTML files.
The actual style is defined in `org-ewmd-style-default' and
should not be modified.  Use `org-ewmd-head' to use your own
style information."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'boolean)
;;;###autoload
(put 'org-ewmd-head-include-default-style 'safe-local-variable 'booleanp)

(define-obsolete-variable-alias 'org-ewmd-style 'org-ewmd-head "24.4")
(defcustom org-ewmd-head "
<link rel=\"stylesheet\" href=\"/c/bootstrap-min.css\">
<script src=\"/j/jquery-min.js\"></script>
<script src=\"/j/bootstrap-min.js\"></script>"
  "Org-wide head definitions for exported HTML files.

As the value of this option simply gets inserted into the HTML
<head> header, you can use it to add any arbitrary text to the
header.

You can set this on a per-file basis using #+HTML_HEAD:,
or for publication projects using the :html-head property."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'string)
;;;###autoload
(put 'org-ewmd-head 'safe-local-variable 'stringp)

(defcustom org-ewmd-head-extra ""
  "More head information to add in the HTML output.

You can set this on a per-file basis using #+HTML_HEAD_EXTRA:,
or for publication projects using the :html-head-extra property."
  :group 'org-export-ewmd
  :version "24.4"
  :package-version '(Org . "8.0")
  :type 'string)
;;;###autoload
(put 'org-ewmd-head-extra 'safe-local-variable 'stringp)

;;;; Todos

(defcustom org-ewmd-todo-kwd-class-prefix ""
  "Prefix to class names for TODO keywords.
Each TODO keyword gets a class given by the keyword itself, with this prefix.
The default prefix is empty because it is nice to just use the keyword
as a class name.  But if you get into conflicts with other, existing
CSS classes, then this prefix can be very useful."
  :group 'org-export-ewmd
  :type 'string)

(defcustom org-ewmd-todo-kwd-class-undone "label-primary"
  "Class name for TODO keywords which are not done.
Traditionally this was not configurable, and was the value 'todo'."
  :group 'org-export-ewmd
  :type 'string)

(defcustom org-ewmd-todo-kwd-class-done "label-default"
  "Class name for TODO keywords which are done.
Traditionally this was not configurable, and was the value 'done'."
  :group 'org-export-ewmd
  :type 'string)

;;;; Google Analytics

(defcustom org-ewmd-google-analytics "
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', '%s', 'auto');
  ga('send', 'pageview');

</script>\n"
  "Snippet used to insert the Google Analytics tracking code.
This is a format string, the %s will be replaced with the value
set using the :gid keyword."
  :group 'org-export-ewmd
  :type 'string)


;;; Internal Functions

(defun org-ewmd-close-tag (tag attr info)
  (concat "<" tag " " attr ">"))

(defun org-ewmd--make-attribute-string (attributes)
  "Return a list of attributes, as a string.
ATTRIBUTES is a plist where values are either strings or nil. An
attributes with a nil value will be omitted from the result."
  (let (output)
    (dolist (item attributes (mapconcat 'identity (nreverse output) " "))
      (cond ((null item) (pop output))
            ((symbolp item) (push (substring (symbol-name item) 1) output))
            (t (let ((key (car output))
                     (value (replace-regexp-in-string
                             "\"" "&quot;" (org-ewmd-encode-plain-text item))))
                 (setcar output (format "%s=\"%s\"" key value))))))))

(defun org-ewmd--wrap-image (contents info &optional caption label)
  "Wrap CONTENTS string within an appropriate environment for images.
INFO is a plist used as a communication channel.  When optional
arguments CAPTION and LABEL are given, use them for caption and
\"id\" attribute."
  (format "\n<figure%s>%s%s\n</figure>"
          ;; ID.
          (if (not (org-string-nw-p label)) ""
            (format " id=\"%s\"" label))
          ;; Contents.
          (format "\n<p>%s</p>" contents)
          ;; Caption.
          (if (not (org-string-nw-p caption)) ""
            (format "\n<figcaption>%s</figcaption>" caption))))

(defun org-ewmd--format-image (source attributes info)
  "Return \"img\" tag with given SOURCE and ATTRIBUTES.
SOURCE is a string specifying the location of the image.
ATTRIBUTES is a plist, as returned by
`org-export-read-attribute'.  INFO is a plist used as
a communication channel."
  (org-ewmd-close-tag
   "img"
   (org-ewmd--make-attribute-string
    (org-combine-plists
     (list :src source
           :class "img-responsive"
           :alt (if (string-match-p "^ltxpng/" source)
                    (org-ewmd-encode-plain-text
                     (org-find-text-property-in-string 'org-latex-src source))
                  (file-name-nondirectory source)))
     attributes))
   info))

(defun org-ewmd--textarea-block (element)
  "Transcode ELEMENT into a textarea block.
ELEMENT is either a src block or an example block."
  (let* ((code (car (org-export-unravel-code element)))
         (attr (org-export-read-attribute :attr_html element)))
    (format "<p>\n<textarea cols=\"%s\" rows=\"%s\">\n%s</textarea>\n</p>"
            (or (plist-get attr :width) 80)
            (or (plist-get attr :height) (org-count-lines code))
            code)))

(defun org-ewmd--has-caption-p (element &optional info)
  "Non-nil when ELEMENT has a caption affiliated keyword.
INFO is a plist used as a communication channel.  This function
is meant to be used as a predicate for `org-export-get-ordinal' or
a value to `org-ewmd-standalone-image-predicate'."
  (org-element-property :caption element))

;;;; Table

(defun org-ewmd-htmlize-region-for-paste (beg end)
  "Convert the region between BEG and END to HTML, using htmlize.el.
This is much like `htmlize-region-for-paste', only that it uses
the settings define in the org-... variables."
  (let* ((htmlize-output-type org-ewmd-htmlize-output-type)
         (htmlize-css-name-prefix org-ewmd-htmlize-font-prefix)
         (htmlbuf (htmlize-region beg end)))
    (unwind-protect
        (with-current-buffer htmlbuf
          (buffer-substring (plist-get htmlize-buffer-places 'content-start)
                            (plist-get htmlize-buffer-places 'content-end)))
      (kill-buffer htmlbuf))))

;;;###autoload
(defun org-ewmd-htmlize-generate-css ()
  "Create the CSS for all font definitions in the current Emacs session.
Use this to create face definitions in your CSS style file that can then
be used by code snippets transformed by htmlize.
This command just produces a buffer that contains class definitions for all
faces used in the current Emacs session.  You can copy and paste the ones you
need into your CSS file.

If you then set `org-ewmd-htmlize-output-type' to `css', calls
to the function `org-ewmd-htmlize-region-for-paste' will
produce code that uses these same face definitions."
  (interactive)
  (require 'htmlize)
  (and (get-buffer "*html*") (kill-buffer "*html*"))
  (with-temp-buffer
    (let ((fl (face-list))
          (htmlize-css-name-prefix "org-")
          (htmlize-output-type 'css)
          f i)
      (while (setq f (pop fl)
                   i (and f (face-attribute f :inherit)))
        (when (and (symbolp f) (or (not i) (not (listp i))))
          (insert (org-add-props (copy-sequence "1") nil 'face f))))
      (htmlize-region (point-min) (point-max))))
  (org-pop-to-buffer-same-window "*html*")
  (goto-char (point-min))
  (if (re-search-forward "<style" nil t)
      (delete-region (point-min) (match-beginning 0)))
  (if (re-search-forward "</style>" nil t)
      (delete-region (1+ (match-end 0)) (point-max)))
  (beginning-of-line 1)
  (if (looking-at " +") (replace-match ""))
  (goto-char (point-min)))

(defun org-ewmd--make-string (n string)
  "Build a string by concatenating N times STRING."
  (let (out) (dotimes (i n out) (setq out (concat string out)))))

(defun org-ewmd-fix-class-name (kwd)    ; audit callers of this function
  "Turn todo keyword KWD into a valid class name.
Replaces invalid characters with \"_\"."
  (save-match-data
    (while (string-match "[^a-zA-Z0-9_]" kwd)
      (setq kwd (replace-match "_" t t kwd))))
  kwd)

(defun org-ewmd-format-footnote-reference (n def refcnt)
  "Format footnote reference N with definition DEF into HTML."
  (let ((extra (if (= refcnt 1) "" (format ".%d"  refcnt))))
    (format org-ewmd-footnote-format
            (let* ((id (format "fnr.%s%s" n extra))
                   (href (format " href=\"#fn.%s\"" n))
                   (attributes (concat " class=\"footref\"" href)))
              (org-ewmd--anchor id n attributes)))))

(defun org-ewmd-format-footnotes-section (section-name definitions)
  "Format footnotes section SECTION-NAME."
  (if (not definitions) ""
    (format org-ewmd-footnotes-section section-name definitions)))

(defun org-ewmd-format-footnote-definition (fn)
  "Format the footnote definition FN."
  (let ((n (car fn)) (def (cdr fn)))
    (format
     "<div class=\"footdef\">%s %s</div>\n"
     (format org-ewmd-footnote-format
             (let* ((id (format "fn.%s" n))
                    (href (format " href=\"#fnr.%s\"" n))
                    (attributes (concat " class=\"footnum\"" href)))
               (org-ewmd--anchor id n attributes)))
     def)))

(defun org-ewmd-collect-footnote-definitions (info)
  "Signature change underneath us, released maybe with 8.3 commit URL at:
http://orgmode.org/w/?p=org-mode.git;a=commit;h=014de0a532cbc60987d09d6040ed46195cffdf12
Try the old 2-arity and if fails, try the new single-arity."
  (with-no-warnings
    (condition-case nil
        (org-export-collect-footnote-definitions
         (plist-get info :parse-tree) info)
      (error (org-export-collect-footnote-definitions info)))))

(defun org-ewmd-footnote-section (info)
  "Format the footnote section.
INFO is a plist used as a communication channel."
  (let* ((fn-alist (org-ewmd-collect-footnote-definitions info))
         (fn-alist
          (loop for (n type raw) in fn-alist collect
                (cons n (if (eq (org-element-type raw) 'org-data)
                            (org-trim (org-export-data raw info))
                          (org-trim (org-export-data raw info)))))))
    (when fn-alist
      (org-ewmd-format-footnotes-section
       (org-ewmd--translate "Footnotes" info)
       (format
        "\n%s\n"
        (mapconcat 'org-ewmd-format-footnote-definition fn-alist "\n"))))))


;;; Template

(defun org-ewmd--build-meta-info (info)
  "Return meta tags for exported document.
INFO is a plist used as a communication channel."
  (let ((protect-string
         (lambda (str)
           (replace-regexp-in-string
            "\"" "&quot;" (org-ewmd-encode-plain-text str))))
        (title (org-export-data (plist-get info :title) info))
        (author (and (plist-get info :with-author)
                     (let ((auth (plist-get info :author)))
                       (and auth
                            ;; Return raw Org syntax, skipping non
                            ;; exportable objects.
                            (org-element-interpret-data
                             (org-element-map auth
                                 (cons 'plain-text org-element-all-objects)
                               'identity info))))))
        (description (plist-get info :description))
        (keywords (plist-get info :keywords))
        (charset (or (and org-ewmd-coding-system
                          (fboundp 'coding-system-get)
                          (coding-system-get org-ewmd-coding-system
                                             'mime-charset))
                     "iso-8859-1")))
    (concat
     (format "<title>%s</title>\n" title)
     (when (plist-get info :time-stamp-file)
       (format-time-string
        (concat "<!-- " org-ewmd-metadata-timestamp-format " -->\n")))
     (format
      (org-ewmd-close-tag "meta" "charset=\"%s\"" info)
      charset) "\n"
      "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
      "\n"
      (org-ewmd-close-tag "meta" "name=\"generator\" content=\"Org-mode\"" info)
      "\n"
      (and (org-string-nw-p author)
           (concat
            (org-ewmd-close-tag "meta"
                                (format "name=\"author\" content=\"%s\""
                                        (funcall protect-string author))
                                info)
            "\n"))
      (and (org-string-nw-p description)
           (concat
            (org-ewmd-close-tag "meta"
                                (format "name=\"description\" content=\"%s\"\n"
                                        (funcall protect-string description))
                                info)
            "\n"))
      (and (org-string-nw-p keywords)
           (concat
            (org-ewmd-close-tag "meta"
                                (format "name=\"keywords\" content=\"%s\""
                                        (funcall protect-string keywords))
                                info)
            "\n")))))

(defun org-ewmd--build-head (info)
  "Return information for the <head>..</head> of the HTML output.
INFO is a plist used as a communication channel."
  (org-element-normalize-string
   (concat
    (org-element-normalize-string (plist-get info :html-head))
    (when (and (plist-get info :html-htmlized-css-url)
               (eq org-ewmd-htmlize-output-type 'css))
      (org-ewmd-close-tag "link"
                          (format " rel=\"stylesheet\" href=\"%s\" type=\"text/css\""
                                  (plist-get info :html-htmlized-css-url))
                          info))
    (when (plist-get info :html-head-include-default-style)
      (org-element-normalize-string org-ewmd-style-default))
    (when (not (plist-get info :html-postamble))
      "<style>body { margin-bottom: 0px; }</style>")
    (when (plist-get info :html-head-include-scripts) org-ewmd-scripts)
    (org-element-normalize-string (plist-get info :html-head-extra)))))

(defun org-ewmd--build-mathjax-config (info)
  "Insert the user setup into the mathjax template.
INFO is a plist used as a communication channel."
  (when (and (memq (plist-get info :with-latex) '(mathjax t))
             (org-element-map (plist-get info :parse-tree)
                 '(latex-fragment latex-environment) 'identity info t))
    (let ((template (plist-get info :html-mathjax-template))
          (options (plist-get info :html-mathjax-options))
          (in-buffer (or (plist-get info :html-mathjax) "")))
      (dolist (e options (org-element-normalize-string template))
        (let ((name (car e))
              (val (nth 1 e)))
          (when (string-match (concat "\\<" (symbol-name name) ":") in-buffer)
            (setq val
                  (car (read-from-string (substring in-buffer (match-end 0))))))
          (unless (stringp val) (setq val (format "%s" val)))
          (while (string-match (concat "%" (upcase (symbol-name name)))
                               template)
            (setq template (replace-match val t t template))))))))

(defun org-ewmd-format-spec (info)
  "Return format specification for elements that can be
used in the preamble or postamble."
  `((?t . ,(org-export-data (plist-get info :title) info))
    (?d . ,(org-export-data (org-export-get-date info) info))
    (?T . ,(format-time-string org-ewmd-metadata-timestamp-format))
    (?a . ,(org-export-data (plist-get info :author) info))
    (?e . ,(mapconcat
            (lambda (e)
              (format "<a href=\"mailto:%s\">%s</a>" e e))
            (split-string (plist-get info :email)  ",+ *")
            ", "))
    (?c . ,(plist-get info :creator))
    (?C . ,(let ((file (plist-get info :input-file)))
             (format-time-string org-ewmd-metadata-timestamp-format
                                 (if file (nth 5 (file-attributes file))
                                   (current-time)))))
    (?v . ,(or org-ewmd-validation-link ""))))

(defun org-ewmd--build-pre/postamble (type info)
  "Return document preamble or postamble as a string, or nil.
TYPE is either 'preamble or 'postamble, INFO is a plist used as a
communication channel."
  (let ((section (plist-get info (intern (format ":html-%s" type))))
        (spec (org-ewmd-format-spec info)))
    (when section
      (let ((section-contents
             (if (functionp section) (funcall section info)
               (cond
                ((stringp section) (format-spec section spec))
                ((eq section 'auto)
                 (let ((date (cdr (assq ?d spec)))
                       (author (cdr (assq ?a spec)))
                       (email (cdr (assq ?e spec)))
                       (creator (cdr (assq ?c spec)))
                       (timestamp (cdr (assq ?T spec)))
                       (validation-link (cdr (assq ?v spec))))
                   (concat
                    "<div>"
                    (when (and (plist-get info :with-date)
                               (org-string-nw-p date))
                      (format "<p class=\"date\">%s: %s</p>\n"
                              (org-ewmd--translate "Date" info)
                              date))
                    (when (and (plist-get info :with-author)
                               (org-string-nw-p author))
                      (format "<p class=\"author\">%s: %s</p>\n"
                              (org-ewmd--translate "Author" info)
                              author))
                    (when (and (plist-get info :with-email)
                               (org-string-nw-p email))
                      (format "<p class=\"email\">%s: %s</p>\n"
                              (org-ewmd--translate "Email" info)
                              email))
                    (when (plist-get info :time-stamp-file)
                      (format
                       "<p class=\"date\">%s: %s</p>\n"
                       (org-ewmd--translate "Created" info)
                       (format-time-string org-ewmd-metadata-timestamp-format)))
                    (when (plist-get info :with-creator)
                      (format "<p class=\"creator\">%s</p>\n" creator))
                    "</div>")))
                (t (format-spec
                    (or (cadr (assoc
                               (plist-get info :language)
                               (eval (intern
                                      (format "org-ewmd-%s-format" type)))))
                        (cadr
                         (assoc
                          "en"
                          (eval
                           (intern (format "org-ewmd-%s-format" type))))))
                    spec))))))
        (when (org-string-nw-p section-contents)
          (concat
           (format "<%s id=\"%s\" class=\"%s\">\n"
                   (nth 1 (assq type org-ewmd-divs))
                   (nth 2 (assq type org-ewmd-divs))
                   org-ewmd--pre/postamble-class)
           (org-element-normalize-string section-contents)
           (format "</%s>\n" (nth 1 (assq type org-ewmd-divs)))))))))

(defun org-ewmd-inner-template (contents info)
  "Return body of document string after HTML conversion.
CONTENTS is the transcoded contents string.  INFO is a plist
holding export options."
  (concat
   ;; Document contents.
   contents
   ;; Footnotes section.
   (org-ewmd-footnote-section info)))

(defun org-ewmd-template (contents info)
  "Return complete document string after HTML conversion.
CONTENTS is the transcoded contents string.  INFO is a plist
holding export options."
  (concat
   "<!doctype html>\n"
   (format "<html lang=\"%s\">\n" (plist-get info :language))
   "<head>\n"
   (org-ewmd--build-meta-info info)
   (org-ewmd--build-head info)
   (org-ewmd--build-mathjax-config info)
   "</head>\n"
   "<body>\n"
   (let ((link-up (org-trim (plist-get info :html-link-up)))
         (link-home (org-trim (plist-get info :html-link-home))))
     (unless (and (string= link-up "") (string= link-home ""))
       (format org-ewmd-home/up-format
               (or link-up link-home)
               (or link-home link-up))))
   ;; Preamble.
   (org-ewmd--build-pre/postamble 'preamble info)
   ;; Document contents.
   (format "<%s id=\"%s\" class=\"%s\">\n"
           (nth 1 (assq 'content org-ewmd-divs))
           (nth 2 (assq 'content org-ewmd-divs))
           (nth 3 (assq 'content org-ewmd-divs)))
   ;; Main doc body ewmd row
   "<div class=\"row\">"
   (if (plist-get info :with-toc) "<div class=\"col-md-9\">"
     "<div class=\"col-md-12\">")
   ;; Document title.
   (let ((title (plist-get info :title)))
     (format "<h1 class=\"title\">%s</h1>\n" (org-export-data (or title "") info)))
   contents
   "</div>"
   ;; Table of contents.
   (let ((depth (plist-get info :with-toc)))
     (when depth
       (concat
        "<div class=\"col-md-3\">"
        (org-ewmd-toc depth info)
        "</div>")))
   "</div>"
   (format "</%s>\n"
           (nth 1 (assq 'content org-ewmd-divs)))
   ;; Postamble.
   (org-ewmd--build-pre/postamble 'postamble info)
   ;; Google Analytics
   (let ((gid (plist-get info :gid)))
     (when gid
       (format org-ewmd-google-analytics gid)))
   ;; Closing document.
   "</body>\n</html>"))

(defun org-ewmd--translate (s info)
  "Translate string S according to specified language.
INFO is a plist used as a communication channel."
  (org-export-translate s :html info))

;;;; Anchor

(defun org-ewmd--anchor (&optional id desc attributes)
  "Format a HTML anchor."
  (let* ((name (and org-ewmd-allow-name-attribute-in-anchors id))
         (attributes (concat (and id (format " id=\"%s\"" id))
                             (and name (format " name=\"%s\"" name))
                             attributes)))
    (format "<a%s>%s</a>" attributes (or desc ""))))

;;;; Todo

(defun org-ewmd--todo (todo)
  "Format TODO keywords into HTML."
  (when todo
    (let* ((is-done (member todo org-done-keywords))
           (class (if is-done org-ewmd-todo-kwd-class-done
                    org-ewmd-todo-kwd-class-undone))
           (is-label (string-prefix-p "label-" class)))
      (format "<span class=\"%s%s %s%s\">%s</span>"
              (if is-label "label " "")
              class
              org-ewmd-todo-kwd-class-prefix (org-ewmd-fix-class-name todo)
              todo))))

;;;; Tags

(defun org-ewmd--tags (tags)
  "Format TAGS into HTML."
  (when tags
    (format "<span class=\"tag\">%s</span>"
            (mapconcat
             (lambda (tag)
               (format "<span class=\"%s %s\">%s</span>"
                       org-ewmd-tag-class
                       (concat org-ewmd-tag-class-prefix
                               (org-ewmd-fix-class-name tag))
                       tag))
             tags "&#xa0;"))))

;;;; Headline

(defun* org-ewmd-format-headline
    (todo todo-type priority text tags
          &key level section-number headline-label &allow-other-keys)
  "Format a headline in HTML."
  (let ((section-number
         (when section-number
           (format "<span class=\"section-number-%d\">%s</span> "
                   level section-number)))
        (todo (org-ewmd--todo todo))
        (tags (org-ewmd--tags tags)))
    (concat section-number todo (and todo " ") text
            (and tags "&#xa0;&#xa0;&#xa0;") tags)))

;;;; Src Code

(defun org-ewmd-fontify-code (code lang)
  "Color CODE with htmlize library.
CODE is a string representing the source code to colorize.  LANG
is the language used for CODE, as a string, or nil."
  (when code
    (cond
     ;; Case 1: No lang.  Possibly an example block.
     ((not lang)
      ;; Simple transcoding.
      (org-ewmd-encode-plain-text code))
     ;; Case 2: No htmlize or an inferior version of htmlize
     ((not (and (require 'htmlize nil t) (fboundp 'htmlize-region-for-paste)))
      ;; Emit a warning.
      (message "Cannot fontify src block (htmlize.el >= 1.34 required)")
      ;; Simple transcoding.
      (org-ewmd-encode-plain-text code))
     (t
      ;; Map language
      (setq lang (or (assoc-default lang org-src-lang-modes) lang))
      (let* ((lang-mode (and lang (intern (format "%s-mode" lang)))))
        (cond
         ;; Case 1: Language is not associated with any Emacs mode
         ((not (functionp lang-mode))
          ;; Simple transcoding.
          (org-ewmd-encode-plain-text code))
         ;; Case 2: Default.  Fontify code.
         (t
          ;; htmlize
          (setq code (with-temp-buffer
                       ;; Switch to language-specific mode.
                       (funcall lang-mode)
                       (insert code)
                       ;; Fontify buffer.
                       (font-lock-fontify-buffer)
                       ;; Remove formatting on newline characters.
                       (save-excursion
                         (let ((beg (point-min))
                               (end (point-max)))
                           (goto-char beg)
                           (while (progn (end-of-line) (< (point) end))
                             (put-text-property (point) (1+ (point)) 'face nil)
                             (forward-char 1))))
                       (org-src-mode)
                       (set-buffer-modified-p nil)
                       ;; Htmlize region.
                       (org-ewmd-htmlize-region-for-paste
                        (point-min) (point-max))))
          ;; Strip any enclosing <pre></pre> tags.
          (let* ((beg (and (string-match "\\`<pre[^>]*>\n*" code) (match-end 0)))
                 (end (and beg (string-match "</pre>\\'" code))))
            (if (and beg end) (substring code beg end) code)))))))))

(defun org-ewmd-do-format-code
    (code &optional lang refs retain-labels num-start)
  "Format CODE string as source code.
Optional arguments LANG, REFS, RETAIN-LABELS and NUM-START are,
respectively, the language of the source code, as a string, an
alist between line numbers and references (as returned by
`org-export-unravel-code'), a boolean specifying if labels should
appear in the source code, and the number associated to the first
line of code."
  (let* ((code-lines (org-split-string code "\n"))
         (code-length (length code-lines))
         (num-fmt
          (and num-start
               (format "%%%ds: "
                       (length (number-to-string (+ code-length num-start))))))
         (code (org-ewmd-fontify-code code lang)))
    (org-export-format-code
     code
     (lambda (loc line-num ref)
       (setq loc
             (concat
              ;; Add line number, if needed.
              (when num-start
                (format "<span class=\"linenr\">%s</span>"
                        (format num-fmt line-num)))
              ;; Transcoded src line.
              loc
              ;; Add label, if needed.
              (when (and ref retain-labels) (format " (%s)" ref))))
       ;; Mark transcoded line as an anchor, if needed.
       (if (not ref) loc
         (format "<span id=\"coderef-%s\" class=\"coderef-off\">%s</span>"
                 ref loc)))
     num-start refs)))

(defun org-ewmd-format-code (element info)
  "Format contents of ELEMENT as source code.
ELEMENT is either an example block or a src block.  INFO is
a plist used as a communication channel."
  (let* ((lang (org-element-property :language element))
         ;; Extract code and references.
         (code-info (org-export-unravel-code element))
         (code (car code-info))
         (refs (cdr code-info))
         ;; Does the src block contain labels?
         (retain-labels (org-element-property :retain-labels element))
         ;; Does it have line numbers?
         (num-start (case (org-element-property :number-lines element)
                      (continued (org-export-get-loc element info))
                      (new 0))))
    (org-ewmd-do-format-code code lang refs retain-labels num-start)))


;;; Tables of Contents

(defun org-ewmd-display-headline-number-p (headline-number info)
  "Predicate deciding if headline number should be displayed."
  (let ((whn (plist-get info :with-headline-numbers)))
    (or (eq whn t) (and (wholenump whn) (<= (length headline-number) whn)))))

(defun org-ewmd-collect-headlines (info depth &optional scope)
  "Another arity change in org:
http://orgmode.org/w/?p=org-mode.git;a=commit;h=b07e2f6ff1feddde83506b7fdb370bfe8e0a5337
Try new 3-arity first, then old 2-arity."
  (with-no-warnings
    (condition-case nil
        (org-export-collect-headlines info depth scope)
      (error (org-export-collect-headlines info depth)))))

(defun org-ewmd-toc (depth info &optional scope)
  "Build a table of contents.
DEPTH is an integer specifying the depth of the table.  INFO is a
plist used as a communication channel.  Return the table of
contents as a string, or nil if it is empty."
  (let ((toc-entries
         (mapcar (lambda (headline)
                   (cons (org-ewmd--format-toc-headline headline info)
                         (org-export-get-relative-level headline info)))
                 (org-ewmd-collect-headlines info depth scope)))
        (outer-tag "nav"))
    (when toc-entries
      (concat (format "<%s id=\"table-of-contents\">\n" outer-tag)
              "<div id=\"text-table-of-contents\" class=\"bs-docs-sidebar\">"
              (org-ewmd--toc-text toc-entries)
              "</div>\n"
              (format "</%s>\n" outer-tag)))))

(defun org-ewmd--toc-text (toc-entries)
  "Return innards of a table of contents, as a string.
TOC-ENTRIES is an alist where key is an entry title, as a string,
and value is its relative level, as an integer."
  (let* ((prev-level (1- (cdar toc-entries)))
         (start-level prev-level))
    (concat
     (mapconcat
      (lambda (entry)
        (let ((headline (car entry))
              (level (cdr entry)))
          (concat
           (let* ((cnt (- level prev-level))
                  (times (if (> cnt 0) (1- cnt) (- cnt)))
                  rtn)
             (setq prev-level level)
             (concat
              (org-ewmd--make-string
               times (cond ((> cnt 0) "\n<ul class=\"nav\">\n<li>")
                           ((< cnt 0) "</li>\n</ul>\n")))
              (if (> cnt 0) "\n<ul class=\"nav\">\n<li>" "</li>\n<li>")))
           headline)))
      toc-entries "")
     (org-ewmd--make-string (- prev-level start-level) "</li>\n</ul>\n"))))

(defun org-ewmd--format-toc-headline (headline info)
  "Return an appropriate table of contents entry for HEADLINE.
INFO is a plist used as a communication channel."
  (let* ((headline-number (org-export-get-headline-number headline info))
         (todo (and (plist-get info :with-todo-keywords)
                    (plist-get info :with-toc-todo-keywords)
                    (let ((todo (org-element-property :todo-keyword headline)))
                      (and todo (org-export-data todo info)))))
         (todo-type (and todo (org-element-property :todo-type headline)))
         (priority (and (plist-get info :with-priority)
                        (org-element-property :priority headline)))
         (text (org-export-data-with-backend
                (org-export-get-alt-title headline info)
                ;; Create an anonymous back-end that will ignore any
                ;; footnote-reference, link, radio-target and target
                ;; in table of contents.
                (org-export-create-backend
                 :parent 'ewmd
                 :transcoders '((footnote-reference . ignore)
                                (link . (lambda (object c i) c))
                                (radio-target . (lambda (object c i) c))
                                (target . ignore)))
                info))
         (tags (and (plist-get info :with-tags)
                    (plist-get info :with-toc-tags)
                    (org-export-get-tags headline info))))
    (format "<a href=\"#%s\">%s</a>"
            ;; Label.
            (or (org-element-property :CUSTOM_ID headline)
                (concat "sec-"
                        (mapconcat #'number-to-string headline-number "-")))
            ;; Body.
            (concat
             (and (not (org-export-low-level-p headline info))
                  (org-export-numbered-headline-p headline info)
                  (org-ewmd-display-headline-number-p headline-number info)
                  (concat (mapconcat #'number-to-string headline-number ".")
                          ". "))
             (apply (if (not (eq org-ewmd-format-headline-function 'ignore))
                        (lambda (todo todo-type priority text tags &rest ignore)
                          (funcall org-ewmd-format-headline-function
                                   todo todo-type priority text tags))
                      #'org-ewmd-format-headline)
                    todo todo-type priority text tags :section-number nil)))))

(defun org-ewmd-list-of-listings (info)
  "Build a list of listings.
INFO is a plist used as a communication channel.  Return the list
of listings as a string, or nil if it is empty."
  (let ((lol-entries (org-export-collect-listings info)))
    (when lol-entries
      (concat "<div id=\"list-of-listings\">\n"
              (format "<h%d>%s</h%d>\n"
                      org-ewmd-toplevel-hlevel
                      (org-ewmd--translate "List of Listings" info)
                      org-ewmd-toplevel-hlevel)
              "<div id=\"text-list-of-listings\">\n<ul>\n"
              (let ((count 0)
                    (initial-fmt (format "<span class=\"listing-number\">%s</span>"
                                         (org-ewmd--translate "Listing %d:" info))))
                (mapconcat
                 (lambda (entry)
                   (let ((label (org-element-property :name entry))
                         (title (org-trim
                                 (org-export-data
                                  (or (org-export-get-caption entry t)
                                      (org-export-get-caption entry))
                                  info))))
                     (concat
                      "<li>"
                      (if (not label)
                          (concat (format initial-fmt (incf count)) " " title)
                        (format "<a href=\"#%s\">%s %s</a>"
                                label
                                (format initial-fmt (incf count))
                                title))
                      "</li>")))
                 lol-entries "\n"))
              "\n</ul>\n</div>\n</div>"))))

(defun org-ewmd-list-of-tables (info)
  "Build a list of tables.
INFO is a plist used as a communication channel.  Return the list
of tables as a string, or nil if it is empty."
  (let ((lol-entries (org-export-collect-tables info)))
    (when lol-entries
      (concat "<div id=\"list-of-tables\">\n"
              (format "<h%d>%s</h%d>\n"
                      org-ewmd-toplevel-hlevel
                      (org-ewmd--translate "List of Tables" info)
                      org-ewmd-toplevel-hlevel)
              "<div id=\"text-list-of-tables\">\n<ul>\n"
              (let ((count 0)
                    (initial-fmt (format "<span class=\"table-number\">%s</span>"
                                         (org-ewmd--translate "Table %d:" info))))
                (mapconcat
                 (lambda (entry)
                   (let ((label (org-element-property :name entry))
                         (title (org-trim
                                 (org-export-data
                                  (or (org-export-get-caption entry t)
                                      (org-export-get-caption entry))
                                  info))))
                     (concat
                      "<li>"
                      (if (not label)
                          (concat (format initial-fmt (incf count)) " " title)
                        (format "<a href=\"#%s\">%s %s</a>"
                                label
                                (format initial-fmt (incf count))
                                title))
                      "</li>")))
                 lol-entries "\n"))
              "\n</ul>\n</div>\n</div>"))))


;;; Transcode Functions

;;;; Bold

(defun org-ewmd-bold (bold contents info)
  "Transcode BOLD from Org to HTML.
CONTENTS is the text with bold markup.  INFO is a plist holding
contextual information."
  (format (or (cdr (assq 'bold org-ewmd-text-markup-alist)) "%s")
          contents))

;;;; Center Block

(defun org-ewmd-center-block (center-block contents info)
  "Transcode a CENTER-BLOCK element from Org to HTML.
CONTENTS holds the contents of the block.  INFO is a plist
holding contextual information."
  (format "<div class=\"center\">\n%s</div>" contents))

;;;; Clock

(defun org-ewmd-clock (clock contents info)
  "Transcode a CLOCK element from Org to HTML.
CONTENTS is nil.  INFO is a plist used as a communication
channel."
  (format "<p>
<span class=\"timestamp-wrapper\">
<span class=\"timestamp-kwd\">%s</span> <span class=\"timestamp\">%s</span>%s
</span>
</p>"
          org-clock-string
          (org-timestamp-translate (org-element-property :value clock))
          (let ((time (org-element-property :duration clock)))
            (and time (format " <span class=\"timestamp\">(%s)</span>" time)))))

;;;; Code

(defun org-ewmd-code (code contents info)
  "Transcode CODE from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  (format (or (cdr (assq 'code org-ewmd-text-markup-alist)) "%s")
          (org-ewmd-encode-plain-text (org-element-property :value code))))

;;;; Drawer

(defun org-ewmd-drawer (drawer contents info)
  "Transcode a DRAWER element from Org to HTML.
CONTENTS holds the contents of the block.  INFO is a plist
holding contextual information."
  (if (functionp org-ewmd-format-drawer-function)
      (funcall org-ewmd-format-drawer-function
               (org-element-property :drawer-name drawer)
               contents)
    ;; If there's no user defined function: simply
    ;; display contents of the drawer.
    contents))

;;;; Dynamic Block

(defun org-ewmd-dynamic-block (dynamic-block contents info)
  "Transcode a DYNAMIC-BLOCK element from Org to HTML.
CONTENTS holds the contents of the block.  INFO is a plist
holding contextual information.  See `org-export-data'."
  contents)

;;;; Entity

(defun org-ewmd-entity (entity contents info)
  "Transcode an ENTITY object from Org to HTML.
CONTENTS are the definition itself.  INFO is a plist holding
contextual information."
  (org-element-property :html entity))

;;;; Example Block

(defun org-ewmd-example-block (example-block contents info)
  "Transcode a EXAMPLE-BLOCK element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  (if (org-export-read-attribute :attr_html example-block :textarea)
      (org-ewmd--textarea-block example-block)
    (format "<pre class=\"example\">\n%s</pre>"
            (org-ewmd-format-code example-block info))))

;;;; Export Snippet

(defun org-ewmd-export-snippet (export-snippet contents info)
  "Transcode a EXPORT-SNIPPET object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  (when (eq (org-export-snippet-backend export-snippet) 'html)
    (org-element-property :value export-snippet)))

;;;; Export Block

(defun org-ewmd-export-block (export-block contents info)
  "Transcode a EXPORT-BLOCK element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (when (string= (org-element-property :type export-block) "HTML")
    (org-remove-indentation (org-element-property :value export-block))))

;;;; Fixed Width

(defun org-ewmd-fixed-width (fixed-width contents info)
  "Transcode a FIXED-WIDTH element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (format "<pre class=\"example\">\n%s</pre>"
          (org-ewmd-do-format-code
           (org-remove-indentation
            (org-element-property :value fixed-width)))))

;;;; Footnote Reference

(defun org-ewmd-footnote-reference (footnote-reference contents info)
  "Transcode a FOOTNOTE-REFERENCE element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (concat
   ;; Insert separator between two footnotes in a row.
   (let ((prev (org-export-get-previous-element footnote-reference info)))
     (when (eq (org-element-type prev) 'footnote-reference)
       org-ewmd-footnote-separator))
   (cond
    ((not (org-export-footnote-first-reference-p footnote-reference info))
     (org-ewmd-format-footnote-reference
      (org-export-get-footnote-number footnote-reference info)
      "IGNORED" 100))
    ;; Inline definitions are secondary strings.
    ((eq (org-element-property :type footnote-reference) 'inline)
     (org-ewmd-format-footnote-reference
      (org-export-get-footnote-number footnote-reference info)
      "IGNORED" 1))
    ;; Non-inline footnotes definitions are full Org data.
    (t (org-ewmd-format-footnote-reference
        (org-export-get-footnote-number footnote-reference info)
        "IGNORED" 1)))))

;;;; Headline

(defun org-ewmd-format-headline--wrap
    (headline info &optional format-function &rest extra-keys)
  "Transcode a HEADLINE element from Org to HTML.
CONTENTS holds the contents of the headline.  INFO is a plist
holding contextual information."
  (let* ((level (+ (org-export-get-relative-level headline info)
                   (1- org-ewmd-toplevel-hlevel)))
         (headline-number (org-export-get-headline-number headline info))
         (section-number (and (not (org-export-low-level-p headline info))
                              (org-export-numbered-headline-p headline info)
                              (org-ewmd-display-headline-number-p headline-number info)
                              (mapconcat 'number-to-string
                                         headline-number ".")))
         (todo (and (plist-get info :with-todo-keywords)
                    (let ((todo (org-element-property :todo-keyword headline)))
                      (and todo (org-export-data todo info)))))
         (todo-type (and todo (org-element-property :todo-type headline)))
         (priority (and (plist-get info :with-priority)
                        (org-element-property :priority headline)))
         (text (org-export-data (org-element-property :title headline) info))
         (tags (and (plist-get info :with-tags)
                    (org-export-get-tags headline info)))
         (headline-label (or (org-element-property :CUSTOM_ID headline)
                             (concat "sec-" (mapconcat 'number-to-string
                                                       headline-number "-"))))
         (format-function
          (cond ((functionp format-function) format-function)
                ((not (eq org-ewmd-format-headline-function 'ignore))
                 (lambda (todo todo-type priority text tags &rest ignore)
                   (funcall org-ewmd-format-headline-function
                            todo todo-type priority text tags)))
                (t 'org-ewmd-format-headline))))
    (apply format-function
           todo todo-type  priority text tags
           :headline-label headline-label :level level
           :section-number section-number extra-keys)))

(defun org-ewmd-headline (headline contents info)
  "Transcode a HEADLINE element from Org to HTML.
CONTENTS holds the contents of the headline.  INFO is a plist
holding contextual information."
  (unless (org-element-property :footnote-section-p headline)
    (let* ((contents (or contents ""))
           (numberedp (org-export-numbered-headline-p headline info))
           (level (org-export-get-relative-level headline info))
           (text (org-export-data (org-element-property :title headline) info))
           (todo (and (plist-get info :with-todo-keywords)
                      (let ((todo (org-element-property :todo-keyword headline)))
                        (and todo (org-export-data todo info)))))
           (todo-type (and todo (org-element-property :todo-type headline)))
           (tags (and (plist-get info :with-tags)
                      (org-export-get-tags headline info)))
           (priority (and (plist-get info :with-priority)
                          (org-element-property :priority headline)))
           (section-number (mapconcat #'number-to-string
                                      (org-export-get-headline-number
                                       headline info) "-"))
           (ids (delq 'nil
                      (list (org-element-property :CUSTOM_ID headline)
                            (concat "sec-" section-number)
                            (org-element-property :ID headline))))
           (preferred-id (car ids))
           (extra-ids (mapconcat
                       (lambda (id)
                         (org-ewmd--anchor
                          (if (org-uuidgen-p id) (concat "ID-" id) id)))
                       (cdr ids) ""))
           ;; Create the headline text.
           (full-text (org-ewmd-format-headline--wrap headline info)))
      (if (org-export-low-level-p headline info)
          ;; This is a deep sub-tree: export it as a list item.
          (let* ((type (if numberedp 'ordered 'unordered))
                 (itemized-body
                  (org-ewmd-format-list-item
                   contents type nil info nil
                   (concat (org-ewmd--anchor preferred-id) extra-ids
                           full-text))))
            (concat
             (and (org-export-first-sibling-p headline info)
                  (org-ewmd-begin-plain-list type))
             itemized-body
             (and (org-export-last-sibling-p headline info)
                  (org-ewmd-end-plain-list type))))
        ;; Standard headline.  Export it as a section.
        (let ((extra-class (org-element-property :HTML_CONTAINER_CLASS headline))
              (level1 (+ level (1- org-ewmd-toplevel-hlevel)))
              (first-content (car (org-element-contents headline))))
          (format "<%s id=\"%s\" class=\"%s\">%s%s</%s>\n"
                  (org-ewmd--container headline info)
                  (format "outline-container-%s"
                          (or (org-element-property :CUSTOM_ID headline)
                              (concat "sec-" section-number)))
                  (concat (format "outline-%d" level1) (and extra-class " ")
                          extra-class)
                  (format "\n<h%d id=\"%s\">%s%s</h%d>\n"
                          level1 preferred-id extra-ids full-text level1)
                  ;; When there is no section, pretend there is an
                  ;; empty one to get the correct <div class="outline-
                  ;; ...> which is needed by `org-info.js'.
                  (if (not (eq (org-element-type first-content) 'section))
                      (concat (org-ewmd-section first-content "" info)
                              contents)
                    contents)
                  (org-ewmd--container headline info)))))))

(defun org-ewmd--container (headline info)
  (or (org-element-property :HTML_CONTAINER headline)
      (if (= 1 (org-export-get-relative-level headline info))
          (plist-get info :html-container)
        "div")))

;;;; Horizontal Rule

(defun org-ewmd-horizontal-rule (horizontal-rule contents info)
  "Transcode an HORIZONTAL-RULE  object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (org-ewmd-close-tag "hr" nil info))

;;;; Inline Src Block

(defun org-ewmd-inline-src-block (inline-src-block contents info)
  "Transcode an INLINE-SRC-BLOCK element from Org to HTML.
CONTENTS holds the contents of the item.  INFO is a plist holding
contextual information."
  (let* ((org-lang (org-element-property :language inline-src-block))
         (code (org-element-property :value inline-src-block)))
    (error "Cannot export inline src block")))

;;;; Inlinetask

(defun org-ewmd-format-section (text class &optional id)
  "Format a section with TEXT into a HTML div with CLASS and ID."
  (let ((extra (concat (when id (format " id=\"%s\"" id)))))
    (concat (format "<div class=\"%s\"%s>\n" class extra) text "</div>\n")))

(defun org-ewmd-inlinetask (inlinetask contents info)
  "Transcode an INLINETASK element from Org to HTML.
CONTENTS holds the contents of the block.  INFO is a plist
holding contextual information."
  (cond
   ;; If `org-ewmd-format-inlinetask-function' is not 'ignore, call it
   ;; with appropriate arguments.
   ((not (eq org-ewmd-format-inlinetask-function 'ignore))
    (let ((format-function
           (function*
            (lambda (todo todo-type priority text tags
                          &key contents &allow-other-keys)
              (funcall org-ewmd-format-inlinetask-function
                       todo todo-type priority text tags contents)))))
      (org-ewmd-format-headline--wrap
       inlinetask info format-function :contents contents)))
   ;; Otherwise, use a default template.
   (t (format "<div class=\"inlinetask\">\n<b>%s</b>%s\n%s</div>"
              (org-ewmd-format-headline--wrap inlinetask info)
              (org-ewmd-close-tag "br" nil info)
              contents))))

;;;; Italic

(defun org-ewmd-italic (italic contents info)
  "Transcode ITALIC from Org to HTML.
CONTENTS is the text with italic markup.  INFO is a plist holding
contextual information."
  (format (or (cdr (assq 'italic org-ewmd-text-markup-alist)) "%s") contents))

;;;; Item

(defun org-ewmd-checkbox (checkbox)
  "Format CHECKBOX into HTML."
  (case checkbox (on "<code>[X]</code>")
        (off "<code>[&#xa0;]</code>")
        (trans "<code>[-]</code>")
        (t "")))

(defun org-ewmd-format-list-item (contents type checkbox info
                                           &optional term-counter-id
                                           headline)
  "Format a list item into HTML."
  (let ((checkbox (concat (org-ewmd-checkbox checkbox) (and checkbox " ")))
        (br (org-ewmd-close-tag "br" nil info)))
    (concat
     (case type
       (ordered
        (let* ((counter term-counter-id)
               (extra (if counter (format " value=\"%s\"" counter) "")))
          (concat
           (format "<li%s>" extra)
           (when headline (concat headline br)))))
       (unordered
        (let* ((id term-counter-id)
               (extra (if id (format " id=\"%s\"" id) "")))
          (concat
           (format "<li%s>" extra)
           (when headline (concat headline br)))))
       (descriptive
        (let* ((term term-counter-id))
          (setq term (or term "(no term)"))
          ;; Check-boxes in descriptive lists are associated to tag.
          (concat (format "<dt> %s </dt>"
                          (concat checkbox term))
                  "<dd>"))))
     (unless (eq type 'descriptive) checkbox)
     contents
     (case type
       (ordered "</li>")
       (unordered "</li>")
       (descriptive "</dd>")))))

(defun org-ewmd-item (item contents info)
  "Transcode an ITEM element from Org to HTML.
CONTENTS holds the contents of the item.  INFO is a plist holding
contextual information."
  (let* ((plain-list (org-export-get-parent item))
         (type (org-element-property :type plain-list))
         (counter (org-element-property :counter item))
         (checkbox (org-element-property :checkbox item))
         (tag (let ((tag (org-element-property :tag item)))
                (and tag (org-export-data tag info)))))
    (org-ewmd-format-list-item
     contents type checkbox info (or tag counter))))

;;;; Keyword

(defun org-ewmd-keyword (keyword contents info)
  "Transcode a KEYWORD element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (let ((key (org-element-property :key keyword))
        (value (org-element-property :value keyword)))
    (cond
     ((string= key "HTML") value)
     ((string= key "TOC")
      (let ((value (downcase value)))
        (cond
         ((string-match "\\<headlines\\>" value)
          (let ((depth (or (and (string-match "[0-9]+" value)
                                (string-to-number (match-string 0 value)))
                           (plist-get info :with-toc))))
            (org-ewmd-toc depth info)))
         ((string= "listings" value) (org-ewmd-list-of-listings info))
         ((string= "tables" value) (org-ewmd-list-of-tables info))))))))

;;;; Latex Environment

(defun org-ewmd-format-latex-arity (prefix &optional dir overlays msg
                                           at forbuffer processing-type)
  "Arity fix for org-format-latex signature change here:
http://orgmode.org/w/?p=org-mode.git;a=commit;h=8daf4a89f1a157c0ee2c91e5b990203679b31cf7
Call 7-arity first, then 6-arity if first fails."
  (with-no-warnings
    (condition-case nil
        (org-format-latex prefix nil nil dir overlays msg forbuffer processing-type)
      (error
       (condition-case nil
           (org-format-latex prefix dir overlays msg at forbuffer processing-type)
         (error
          (org-format-latex prefix dir overlays msg forbuffer processing-type)))))))

(defun org-ewmd-format-latex (latex-frag processing-type info)
  "Format a LaTeX fragment LATEX-FRAG into HTML.
PROCESSING-TYPE designates the tool used for conversion.  It is
a symbol among `mathjax', `dvipng', `imagemagick', `verbatim' nil
and t.  See `org-ewmd-with-latex' for more information.  INFO is
a plist containing export properties."
  (let ((cache-relpath "") (cache-dir ""))
    (unless (eq processing-type 'mathjax)
      (let ((bfn (or (buffer-file-name)
                     (make-temp-name
                      (expand-file-name "latex" temporary-file-directory))))
            (latex-header
             (let ((header (plist-get info :latex-header)))
               (and header
                    (concat (mapconcat
                             (lambda (line) (concat "#+LATEX_HEADER: " line))
                             (org-split-string header "\n")
                             "\n")
                            "\n")))))
        (setq cache-relpath
              (concat "ltxpng/"
                      (file-name-sans-extension
                       (file-name-nondirectory bfn)))
              cache-dir (file-name-directory bfn))
        ;; Re-create LaTeX environment from original buffer in
        ;; temporary buffer so that dvipng/imagemagick can properly
        ;; turn the fragment into an image.
        (setq latex-frag (concat latex-header latex-frag))))
    (with-temp-buffer
      (insert latex-frag)
      (org-ewmd-format-latex-arity cache-relpath cache-dir nil
                                   "Creating LaTeX Image..."
                                   nil nil processing-type)
      (buffer-string))))

(defun org-ewmd-latex-environment (latex-environment contents info)
  "Transcode a LATEX-ENVIRONMENT element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (let ((processing-type (plist-get info :with-latex))
        (latex-frag (org-remove-indentation
                     (org-element-property :value latex-environment)))
        (attributes (org-export-read-attribute :attr_html latex-environment)))
    (case processing-type
      ((t mathjax)
       (org-ewmd-format-latex latex-frag 'mathjax info))
      ((dvipng imagemagick)
       (let ((formula-link
              (org-ewmd-format-latex latex-frag processing-type info)))
         (when (and formula-link (string-match "file:\\([^]]*\\)" formula-link))
           ;; Do not provide a caption or a name to be consistent with
           ;; `mathjax' handling.
           (org-ewmd--wrap-image
            (org-ewmd--format-image
             (match-string 1 formula-link) attributes info) info))))
      (t latex-frag))))

;;;; Latex Fragment

(defun org-ewmd-latex-fragment (latex-fragment contents info)
  "Transcode a LATEX-FRAGMENT object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (let ((latex-frag (org-element-property :value latex-fragment))
        (processing-type (plist-get info :with-latex)))
    (case processing-type
      ((t mathjax)
       (org-ewmd-format-latex latex-frag 'mathjax info))
      ((dvipng imagemagick)
       (let ((formula-link
              (org-ewmd-format-latex latex-frag processing-type info)))
         (when (and formula-link (string-match "file:\\([^]]*\\)" formula-link))
           (org-ewmd--format-image (match-string 1 formula-link) nil info))))
      (t latex-frag))))

;;;; Line Break

(defun org-ewmd-line-break (line-break contents info)
  "Transcode a LINE-BREAK object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (concat (org-ewmd-close-tag "br" nil info) "\n"))

;;;; Link

(defun org-ewmd-inline-image-p (link info)
  "Non-nil when LINK is meant to appear as an image.
INFO is a plist used as a communication channel.  LINK is an
inline image when it has no description and targets an image
file (see `org-ewmd-inline-image-rules' for more information), or
if its description is a single link targeting an image file."
  (if (not (org-element-contents link))
      (org-export-inline-image-p link org-ewmd-inline-image-rules)
    (not
     (let ((link-count 0))
       (org-element-map (org-element-contents link)
           (cons 'plain-text org-element-all-objects)
         (lambda (obj)
           (case (org-element-type obj)
             (plain-text (org-string-nw-p obj))
             (link (if (= link-count 1) t
                     (incf link-count)
                     (not (org-export-inline-image-p
                           obj org-ewmd-inline-image-rules))))
             (otherwise t)))
         info t)))))

(defvar org-ewmd-standalone-image-predicate)
(defun org-ewmd-standalone-image-p (element info)
  "Non-nil if ELEMENT is a standalone image.

INFO is a plist holding contextual information.

An element or object is a standalone image when

  - its type is `paragraph' and its sole content, save for white
    spaces, is a link that qualifies as an inline image;

  - its type is `link' and its containing paragraph has no other
    content save white spaces.

Bind `org-ewmd-standalone-image-predicate' to constrain paragraph
further.  For example, to check for only captioned standalone
images, set it to:

  \(lambda (paragraph) (org-element-property :caption paragraph))"
  (let ((paragraph (case (org-element-type element)
                     (paragraph element)
                     (link (org-export-get-parent element)))))
    (and (eq (org-element-type paragraph) 'paragraph)
         (or (not (fboundp 'org-ewmd-standalone-image-predicate))
             (funcall org-ewmd-standalone-image-predicate paragraph))
         (catch 'exit
           (let ((link-count 0))
             (org-element-map (org-element-contents paragraph)
                 (cons 'plain-text org-element-all-objects)
               #'(lambda (obj)
                   (when (case (org-element-type obj)
                           (plain-text (org-string-nw-p obj))
                           (link (or (> (incf link-count) 1)
                                     (not (org-ewmd-inline-image-p obj info))))
                           (otherwise t))
                     (throw 'exit nil)))
               info nil 'link)
             (= link-count 1))))))

(defun org-ewmd-export-file-uri (filename)
  "Return file URI associated to FILENAME."
  (cond ((org-string-match-p "\\`//" filename) (concat "file:" filename))
        ((not (file-name-absolute-p filename)) filename)
        ((org-file-remote-p filename) (concat "file:/" filename))
        (t (concat "file://" (expand-file-name filename)))))

(defun org-ewmd-fuzzy (file search)
  (cond ((fboundp 'org-publish-resolve-external-fuzzy-link)
         (let ((numbers
                (org-publish-resolve-external-fuzzy-link file search)))
           (and numbers (concat "#sec-"
                                (mapconcat 'number-to-string
                                           numbers "-")))))
        ((fboundp 'org-publish-resolve-external-link)
         (let ((rez (org-publish-resolve-external-link search file)))
           (concat "#" rez)))
        (t "")))

(defun org-ewmd-link (link desc info)
  "Transcode a LINK object from Org to HTML.
DESC is the description part of the link, or the empty string.
INFO is a plist holding contextual information.  See
`org-export-data'."
  (let* ((home (when (plist-get info :html-link-home)
                 (org-trim (plist-get info :html-link-home))))
         (use-abs-url (plist-get info :html-link-use-abs-url))
         (link-org-files-as-html-maybe
          (lambda (raw-path info)
            ;; Treat links to `file.org' as links to `file.html', if
            ;; needed.  See `org-ewmd-link-org-files-as-html'.
            (cond
             ((and (plist-get info :html-link-org-files-as-html)
                   (string= ".org"
                            (downcase (file-name-extension raw-path "."))))
              (concat (file-name-sans-extension raw-path) "."
                      (plist-get info :html-extension)))
             (t raw-path))))
         (type (org-element-property :type link))
         (raw-path (org-element-property :path link))
         ;; Ensure DESC really exists, or set it to nil.
         (desc (org-string-nw-p desc))
         (path
          (cond
           ((member type '("http" "https" "ftp" "mailto"))
            (org-link-escape
             (org-link-unescape
              (concat type ":" raw-path)) '(32 91 93 37)))
           ((string= type "file")
            ;; Treat links to ".org" files as ".html", if needed.
            (setq raw-path
                  (funcall link-org-files-as-html-maybe raw-path info))
            ;; If file path is absolute, prepend it with protocol
            ;; component - "file://".
            (cond
             ((file-name-absolute-p raw-path)
              (setq raw-path (org-ewmd-export-file-uri raw-path)))
             ((and home use-abs-url)
              (setq raw-path (concat (file-name-as-directory home) raw-path))))
            ;; Add search option, if any.  A search option can be
            ;; relative to a custom-id, a headline title a name,
            ;; a target or a radio-target.
            (let ((option (org-element-property :search-option link)))
              (cond ((not option) raw-path)
                    ;; Since HTML back-end use custom-id value as-is,
                    ;; resolving is them is trivial.
                    ((eq (string-to-char option) ?#) (concat raw-path option))
                    (t
                     (concat raw-path
                             (org-ewmd-fuzzy
                              (org-element-property :path link)
                              option))))))
           (t raw-path)))
         ;; Extract attributes from parent's paragraph.  HACK: Only do
         ;; this for the first link in parent (inner image link for
         ;; inline images).  This is needed as long as attributes
         ;; cannot be set on a per link basis.
         (attributes-plist
          (let* ((parent (org-export-get-parent-element link))
                 (link (let ((container (org-export-get-parent link)))
                         (if (and (eq (org-element-type container) 'link)
                                  (org-ewmd-inline-image-p link info))
                             container
                           link))))
            (and (eq (org-element-map parent 'link 'identity info t) link)
                 (org-export-read-attribute :attr_html parent))))
         (attributes
          (let ((attr (org-ewmd--make-attribute-string attributes-plist)))
            (if (org-string-nw-p attr) (concat " " attr) ""))))
    (cond
     ;; Image file.
     ((and (plist-get info :html-inline-images)
           (org-export-inline-image-p
            link (plist-get info :html-inline-image-rules)))
      (org-ewmd--format-image path attributes-plist info))
     ;; Radio target: Transcode target's contents and use them as
     ;; link's description.
     ((string= type "radio")
      (let ((destination (org-export-resolve-radio-link link info)))
        (if (not destination) desc
          (format "<a href=\"#%s\"%s>%s</a>"
                  (org-element-property :value destination)
                  attributes desc))))
     ;; Links pointing to a headline: Find destination and build
     ;; appropriate referencing command.
     ((member type '("custom-id" "fuzzy" "id"))
      (let ((destination (if (string= type "fuzzy")
                             (org-export-resolve-fuzzy-link link info)
                           (org-export-resolve-id-link link info))))
        (case (org-element-type destination)
          ;; ID link points to an external file.
          (plain-text
           (let ((fragment (concat "ID-" path))
                 ;; Treat links to ".org" files as ".html", if needed.
                 (path (funcall link-org-files-as-html-maybe
                                destination info)))
             (format "<a href=\"%s#%s\"%s>%s</a>"
                     path fragment attributes (or desc destination))))
          ;; Fuzzy link points nowhere.
          ((nil)
           (format "<i>%s</i>"
                   (or desc
                       (org-export-data
                        (org-element-property :raw-link link) info))))
          ;; Link points to a headline.
          (headline
           (let ((href
                  ;; What href to use?
                  (cond
                   ;; Case 1: Headline is linked via it's CUSTOM_ID
                   ;; property.  Use CUSTOM_ID.
                   ((string= type "custom-id")
                    (org-element-property :CUSTOM_ID destination))
                   ;; Case 2: Headline is linked via it's ID property
                   ;; or through other means.  Use the default href.
                   ((member type '("id" "fuzzy"))
                    (format "sec-%s"
                            (mapconcat 'number-to-string
                                       (org-export-get-headline-number
                                        destination info) "-")))
                   (t (error "Shouldn't reach here"))))
                 ;; What description to use?  Previously, we'd look if
                 ;; section numbering was enabled, and use that
                 ;; number, however, rendering a link description as
                 ;; number seems less useful than destination title.
                 ;; And since Org 8.3 there has been a lot of
                 ;; dependencies on :section-number, so will do
                 ;; something simple here for now.
                 (desc
                  (or desc (org-export-data (org-element-property
                                             :title destination) info))))
             (format "<a href=\"#%s\"%s>%s</a>"
                     href attributes desc)))
          ;; Fuzzy link points to a target or an element.
          (t
           (let* ((path path)
                  (org-ewmd-standalone-image-predicate 'org-ewmd--has-caption-p)
                  (number (cond
                           (desc nil)
                           ((org-ewmd-standalone-image-p destination info)
                            (org-export-get-ordinal
                             (org-element-map destination 'link
                               'identity info t)
                             info 'link 'org-ewmd-standalone-image-p))
                           (t (org-export-get-ordinal
                               destination info nil 'org-ewmd--has-caption-p))))
                  (desc (cond (desc)
                              ((not number) "No description for this link")
                              ((numberp number) (number-to-string number))
                              (t (mapconcat 'number-to-string number ".")))))
             (format "<a href=\"#%s\"%s>%s</a>" path attributes desc))))))
     ;; Coderef: replace link with the reference name or the
     ;; equivalent line number.
     ((string= type "coderef")
      (let ((fragment (concat "coderef-" (org-ewmd-encode-plain-text path))))
        (format "<a href=\"#%s\"%s%s>%s</a>"
                fragment
                (format "class=\"coderef\" onmouseover=\"CodeHighlightOn(this, \
'%s');\" onmouseout=\"CodeHighlightOff(this, '%s');\""
                        fragment fragment)
                attributes
                (format (org-export-get-coderef-format path desc)
                        (org-export-resolve-coderef path info)))))
     ;; External link with a description part.
     ((and path desc) (format "<a href=\"%s\"%s>%s</a>"
                              (org-ewmd-encode-plain-text path)
                              attributes
                              desc))
     ;; External link without a description part.
     (path (let ((path (org-ewmd-encode-plain-text path)))
             (format "<a href=\"%s\"%s>%s</a>" path attributes path)))
     ;; No path, only description.  Try to do something useful.
     (t (format "<i>%s</i>" desc)))))

;;;; Paragraph

(defun org-ewmd-paragraph (paragraph contents info)
  "Transcode a PARAGRAPH element from Org to HTML.
CONTENTS is the contents of the paragraph, as a string.  INFO is
the plist used as a communication channel."
  (let* ((parent (org-export-get-parent paragraph))
         (parent-type (org-element-type parent))
         (style '((footnote-definition " class=\"footpara\"")))
         (extra (or (cadr (assoc parent-type style)) "")))
    (cond
     ((and (eq (org-element-type parent) 'item)
           (= (org-element-property :begin paragraph)
              (org-element-property :contents-begin parent)))
      ;; Leading paragraph in a list item have no tags.
      contents)
     ((org-ewmd-standalone-image-p paragraph info)
      ;; Standalone image.
      (let ((caption
             (let ((raw (org-export-data
                         (org-export-get-caption paragraph) info))
                   (org-ewmd-standalone-image-predicate
                    'org-ewmd--has-caption-p))
               (if (not (org-string-nw-p raw)) raw
                 (concat
                  "<span class=\"figure-number\">"
                  (format (org-ewmd--translate "Figure %d:" info)
                          (org-export-get-ordinal
                           (org-element-map paragraph 'link
                             'identity info t)
                           info nil 'org-ewmd-standalone-image-p))
                  "</span> " raw))))
            (label (org-element-property :name paragraph)))
        (org-ewmd--wrap-image contents info caption label)))
     ;; Regular paragraph.
     (t (format "<p%s>\n%s</p>" extra contents)))))

;;;; Plain List

;; FIXME Maybe arg1 is not needed because <li value="20"> already sets
;; the correct value for the item counter
(defun org-ewmd-begin-plain-list (type &optional arg1)
  "Insert the beginning of the HTML list depending on TYPE.
When ARG1 is a string, use it as the start parameter for ordered
lists."
  (case type
    (ordered
     (format "<ol class=\"org-ol\"%s>"
             (if arg1 (format " start=\"%d\"" arg1) "")))
    (unordered "<ul class=\"org-ul\">")
    (descriptive "<dl class=\"org-dl\">")))

(defun org-ewmd-end-plain-list (type)
  "Insert the end of the HTML list depending on TYPE."
  (case type
    (ordered "</ol>")
    (unordered "</ul>")
    (descriptive "</dl>")))

(defun org-ewmd-plain-list (plain-list contents info)
  "Transcode a PLAIN-LIST element from Org to HTML.
CONTENTS is the contents of the list.  INFO is a plist holding
contextual information."
  (let* (arg1 ;; (assoc :counter (org-element-map plain-list 'item
         (type (org-element-property :type plain-list)))
    (format "%s\n%s%s"
            (org-ewmd-begin-plain-list type)
            contents (org-ewmd-end-plain-list type))))

;;;; Plain Text

(defun org-ewmd-convert-special-strings (string)
  "Convert special characters in STRING to HTML."
  (let ((all org-ewmd-special-string-regexps)
        e a re rpl start)
    (while (setq a (pop all))
      (setq re (car a) rpl (cdr a) start 0)
      (while (string-match re string start)
        (setq string (replace-match rpl t nil string))))
    string))

(defun org-ewmd-encode-plain-text (text)
  "Convert plain text characters from TEXT to HTML equivalent.
Possible conversions are set in `org-ewmd-protect-char-alist'."
  (mapc
   (lambda (pair)
     (setq text (replace-regexp-in-string (car pair) (cdr pair) text t t)))
   org-ewmd-protect-char-alist)
  text)

(defun org-ewmd-plain-text (text info)
  "Transcode a TEXT string from Org to HTML.
TEXT is the string to transcode.  INFO is a plist holding
contextual information."
  (let ((output text))
    ;; Protect following characters: <, >, &.
    (setq output (org-ewmd-encode-plain-text output))
    ;; Handle smart quotes.  Be sure to provide original string since
    ;; OUTPUT may have been modified.
    (when (plist-get info :with-smart-quotes)
      (setq output (org-export-activate-smart-quotes output :html info text)))
    ;; Handle special strings.
    (when (plist-get info :with-special-strings)
      (setq output (org-ewmd-convert-special-strings output)))
    ;; Handle break preservation if required.
    (when (plist-get info :preserve-breaks)
      (setq output
            (replace-regexp-in-string
             "\\(\\\\\\\\\\)?[ \t]*\n"
             (concat (org-ewmd-close-tag "br" nil info) "\n") output)))
    ;; Return value.
    output))


;; Planning

(defun org-ewmd-planning (planning contents info)
  "Transcode a PLANNING element from Org to HTML.
CONTENTS is nil.  INFO is a plist used as a communication
channel."
  (let ((span-fmt "<span class=\"timestamp-kwd\">%s</span> <span class=\"timestamp\">%s</span>"))
    (format
     "<p><span class=\"timestamp-wrapper\">%s</span></p>"
     (mapconcat
      'identity
      (delq nil
            (list
             (let ((closed (org-element-property :closed planning)))
               (when closed
                 (format span-fmt org-closed-string
                         (org-timestamp-translate closed))))
             (let ((deadline (org-element-property :deadline planning)))
               (when deadline
                 (format span-fmt org-deadline-string
                         (org-timestamp-translate deadline))))
             (let ((scheduled (org-element-property :scheduled planning)))
               (when scheduled
                 (format span-fmt org-scheduled-string
                         (org-timestamp-translate scheduled))))))
      " "))))

;;;; Property Drawer

(defun org-ewmd-property-drawer (property-drawer contents info)
  "Transcode a PROPERTY-DRAWER element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  ;; The property drawer isn't exported but we want separating blank
  ;; lines nonetheless.
  "")

;;;; Quote Block

(defun org-ewmd-quote-block (quote-block contents info)
  "Transcode a QUOTE-BLOCK element from Org to HTML.
CONTENTS holds the contents of the block.  INFO is a plist
holding contextual information."
  (format "<blockquote>\n%s</blockquote>" contents))

;;;; Quote Section

(defun org-ewmd-quote-section (quote-section contents info)
  "Transcode a QUOTE-SECTION element from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (let ((value (org-remove-indentation
                (org-element-property :value quote-section))))
    (when value (format "<pre>\n%s</pre>" value))))

;;;; Section

(defun org-ewmd-section (section contents info)
  "Transcode a SECTION element from Org to HTML.
CONTENTS holds the contents of the section.  INFO is a plist
holding contextual information."
  (let ((parent (org-export-get-parent-headline section)))
    ;; Before first headline: no container, just return CONTENTS.
    (if (not parent) contents
      ;; Get div's class and id references.
      (let* ((class-num (+ (org-export-get-relative-level parent info)
                           (1- org-ewmd-toplevel-hlevel)))
             (section-number
              (mapconcat
               'number-to-string
               (org-export-get-headline-number parent info) "-")))
        ;; Build return value.
        (format "<div class=\"outline-text-%d\" id=\"text-%s\">\n%s</div>"
                class-num
                (or (org-element-property :CUSTOM_ID parent) section-number)
                (or contents ""))))))

;;;; Radio Target

(defun org-ewmd-radio-target (radio-target text info)
  "Transcode a RADIO-TARGET object from Org to HTML.
TEXT is the text of the target.  INFO is a plist holding
contextual information."
  (let ((id (org-element-property :value radio-target)))
    (org-ewmd--anchor id text)))

;;;; Special Block

(defun org-ewmd-special-block (special-block contents info)
  "Transcode a SPECIAL-BLOCK element from Org to HTML.
CONTENTS holds the contents of the block.  INFO is a plist
holding contextual information."
  (let* ((block-type (downcase
                      (org-element-property :type special-block)))
         (contents (or contents ""))
         (is-html5-tag? (member block-type org-html-html5-elements))
         (attributes (org-export-read-attribute :attr_html special-block)))
    (unless is-html5-tag?
      (let ((class (plist-get attributes :class)))
        (setq attributes (plist-put attributes :class
                                    (if class (concat class " " block-type)
                                      block-type)))))
    (setq attributes (org-ewmd--make-attribute-string attributes))
    (when (not (equal attributes ""))
      (setq attributes (concat " " attributes)))
    (if is-html5-tag?
        (format "<%s%s>\n%s</%s>" block-type attributes contents block-type)
      (format "<div%s>\n%s\n</div>" attributes contents))))

;;;; Src Block

(defun org-ewmd-src-block (src-block contents info)
  "Transcode a SRC-BLOCK element from Org to HTML.
CONTENTS holds the contents of the item.  INFO is a plist holding
contextual information."
  (if (org-export-read-attribute :attr_html src-block :textarea)
      (org-ewmd--textarea-block src-block)
    (let ((lang (org-element-property :language src-block))
          (caption (org-export-get-caption src-block))
          (code (org-ewmd-format-code src-block info))
          (label (let ((lbl (org-element-property :name src-block)))
                   (if (not lbl) ""
                     (format " id=\"%s\""
                             lbl)))))
      (if (not lang) (format "<pre class=\"example\"%s>\n%s</pre>" label code)
        (format
         "<div class=\"org-src-container\">\n%s%s\n</div>"
         (if (not caption) ""
           (format "<label class=\"org-src-name\">%s</label>"
                   (org-export-data caption info)))
         (format "\n<pre class=\"src src-%s\"%s>%s</pre>" lang label code))))))

;;;; Statistics Cookie

(defun org-ewmd-statistics-cookie (statistics-cookie contents info)
  "Transcode a STATISTICS-COOKIE object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual information."
  (let ((cookie-value (org-element-property :value statistics-cookie)))
    (format "<code>%s</code>" cookie-value)))

;;;; Strike-Through

(defun org-ewmd-strike-through (strike-through contents info)
  "Transcode STRIKE-THROUGH from Org to HTML.
CONTENTS is the text with strike-through markup.  INFO is a plist
holding contextual information."
  (format (or (cdr (assq 'strike-through org-ewmd-text-markup-alist)) "%s")
          contents))

;;;; Subscript

(defun org-ewmd-subscript (subscript contents info)
  "Transcode a SUBSCRIPT object from Org to HTML.
CONTENTS is the contents of the object.  INFO is a plist holding
contextual information."
  (format "<sub>%s</sub>" contents))

;;;; Superscript

(defun org-ewmd-superscript (superscript contents info)
  "Transcode a SUPERSCRIPT object from Org to HTML.
CONTENTS is the contents of the object.  INFO is a plist holding
contextual information."
  (format "<sup>%s</sup>" contents))

;;;; Table Cell

(defun org-ewmd-table-cell (table-cell contents info)
  "Transcode a TABLE-CELL element from Org to HTML.
CONTENTS is nil.  INFO is a plist used as a communication
channel."
  (let* ((table-row (org-export-get-parent table-cell))
         (table (org-export-get-parent-table table-cell))
         (cell-attrs
          (if (not org-ewmd-table-align-individual-fields) ""
            (format (if (and (boundp 'org-ewmd-format-table-no-css)
                             org-ewmd-format-table-no-css)
                        " align=\"%s\"" " class=\"text-%s\"")
                    (org-export-table-cell-alignment table-cell info)))))
    (when (or (not contents) (string= "" (org-trim contents)))
      (setq contents "&#xa0;"))
    (cond
     ((and (org-export-table-has-header-p table info)
           (= 1 (org-export-table-row-group table-row info)))
      (concat "\n" (format (car org-ewmd-table-header-tags) "col" cell-attrs)
              contents (cdr org-ewmd-table-header-tags)))
     ((and org-ewmd-table-use-header-tags-for-first-column
           (zerop (cdr (org-export-table-cell-address table-cell info))))
      (concat "\n" (format (car org-ewmd-table-header-tags) "row" cell-attrs)
              contents (cdr org-ewmd-table-header-tags)))
     (t (concat "\n" (format (car org-ewmd-table-data-tags) cell-attrs)
                contents (cdr org-ewmd-table-data-tags))))))

;;;; Table Row

(defun org-ewmd-table-row (table-row contents info)
  "Transcode a TABLE-ROW element from Org to HTML.
CONTENTS is the contents of the row.  INFO is a plist used as a
communication channel."
  ;; Rules are ignored since table separators are deduced from
  ;; borders of the current row.
  (when (eq (org-element-property :type table-row) 'standard)
    (let* ((rowgroup-number (org-export-table-row-group table-row info))
           (row-number (org-export-table-row-number table-row info))
           (start-rowgroup-p
            (org-export-table-row-starts-rowgroup-p table-row info))
           (end-rowgroup-p
            (org-export-table-row-ends-rowgroup-p table-row info))
           ;; `top-row-p' and `end-rowgroup-p' are not used directly
           ;; but should be set so that `org-ewmd-table-row-tags' can
           ;; use them (see the docstring of this variable.)
           (top-row-p (and (equal start-rowgroup-p '(top))
                           (equal end-rowgroup-p '(below top))))
           (bottom-row-p (and (equal start-rowgroup-p '(above))
                              (equal end-rowgroup-p '(bottom above))))
           (rowgroup-tags
            (cond
             ;; Case 1: Row belongs to second or subsequent rowgroups.
             ((not (= 1 rowgroup-number))
              '("<tbody>" . "\n</tbody>"))
             ;; Case 2: Row is from first rowgroup.  Table has >=1 rowgroups.
             ((org-export-table-has-header-p
               (org-export-get-parent-table table-row) info)
              '("<thead>" . "\n</thead>"))
             ;; Case 2: Row is from first and only row group.
             (t '("<tbody>" . "\n</tbody>")))))
      (concat
       ;; Begin a rowgroup?
       (when start-rowgroup-p (car rowgroup-tags))
       ;; Actual table row
       (concat "\n" (eval (car org-ewmd-table-row-tags))
               contents
               "\n"
               (eval (cdr org-ewmd-table-row-tags)))
       ;; End a rowgroup?
       (when end-rowgroup-p (cdr rowgroup-tags))))))

;;;; Table

(defun org-ewmd-table-first-row-data-cells (table info)
  "Transcode the first row of TABLE.
INFO is a plist used as a communication channel."
  (let ((table-row
         (org-element-map table 'table-row
           (lambda (row)
             (unless (eq (org-element-property :type row) 'rule) row))
           info 'first-match))
        (special-column-p (org-export-table-has-special-column-p table)))
    (if (not special-column-p) (org-element-contents table-row)
      (cdr (org-element-contents table-row)))))

(defun org-ewmd-table--table.el-table (table info)
  "Format table.el tables into HTML.
INFO is a plist used as a communication channel."
  (when (eq (org-element-property :type table) 'table.el)
    (require 'table)
    (let ((outbuf (with-current-buffer
                      (get-buffer-create "*org-export-table*")
                    (erase-buffer) (current-buffer))))
      (with-temp-buffer
        (insert (org-element-property :value table))
        (goto-char 1)
        (re-search-forward "^[ \t]*|[^|]" nil t)
        (table-generate-source 'html outbuf))
      (with-current-buffer outbuf
        (prog1 (org-trim (buffer-string))
          (kill-buffer) )))))

(defun org-ewmd-table (table contents info)
  "Transcode a TABLE element from Org to HTML.
CONTENTS is the contents of the table.  INFO is a plist holding
contextual information."
  (case (org-element-property :type table)
    ;; Case 1: table.el table.  Convert it using appropriate tools.
    (table.el (org-ewmd-table--table.el-table table info))
    ;; Case 2: Standard table.
    (t
     (let* ((label (org-element-property :name table))
            (caption (org-export-get-caption table))
            (number (org-export-get-ordinal
                     table info nil 'org-ewmd--has-caption-p))
            (attributes
             (org-ewmd--make-attribute-string
              (org-combine-plists
               (and label (list :id label))
               (plist-get info :html-table-attributes)
               (org-export-read-attribute :attr_html table))))
            (alignspec
             (if (and (boundp 'org-ewmd-format-table-no-css)
                      org-ewmd-format-table-no-css)
                 "align=\"%s\"" "class=\"%s\""))
            (table-column-specs
             (function
              (lambda (table info)
                (mapconcat
                 (lambda (table-cell)
                   (let ((alignment (org-export-table-cell-alignment
                                     table-cell info)))
                     (concat
                      ;; Begin a colgroup?
                      (when (org-export-table-cell-starts-colgroup-p
                             table-cell info)
                        "\n<colgroup>")
                      ;; Add a column.  Also specify it's alignment.
                      (format "\n%s"
                              (org-ewmd-close-tag
                               "col" (concat " " (format alignspec alignment)) info))
                      ;; End a colgroup?
                      (when (org-export-table-cell-ends-colgroup-p
                             table-cell info)
                        "\n</colgroup>"))))
                 (org-ewmd-table-first-row-data-cells table info) "\n")))))
       (format "<table%s>\n%s\n%s\n%s</table>"
               (if (equal attributes "") "" (concat " " attributes))
               (if (not caption) ""
                 (format (if org-ewmd-table-caption-above
                             "<caption class=\"t-above\">%s</caption>"
                           "<caption class=\"t-bottom\">%s</caption>")
                         (concat
                          "<span class=\"table-number\">"
                          (format (org-ewmd--translate "Table %d:" info) number)
                          "</span> " (org-export-data caption info))))
               (funcall table-column-specs table info)
               contents)))))

;;;; Target

(defun org-ewmd-target (target contents info)
  "Transcode a TARGET object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  (let ((id (org-element-property :value target)))
    (org-ewmd--anchor id)))

;;;; Timestamp

(defun org-ewmd-timestamp (timestamp contents info)
  "Transcode a TIMESTAMP object from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  (let ((value (org-ewmd-plain-text
                (org-timestamp-translate timestamp) info)))
    (format "<span class=\"timestamp-wrapper\"><span class=\"timestamp\">%s</span></span>"
            (replace-regexp-in-string "--" "&#x2013;" value))))

;;;; Underline

(defun org-ewmd-underline (underline contents info)
  "Transcode UNDERLINE from Org to HTML.
CONTENTS is the text with underline markup.  INFO is a plist
holding contextual information."
  (format (or (cdr (assq 'underline org-ewmd-text-markup-alist)) "%s")
          contents))

;;;; Verbatim

(defun org-ewmd-verbatim (verbatim contents info)
  "Transcode VERBATIM from Org to HTML.
CONTENTS is nil.  INFO is a plist holding contextual
information."
  (format (or (cdr (assq 'verbatim org-ewmd-text-markup-alist)) "%s")
          (org-ewmd-encode-plain-text (org-element-property :value verbatim))))

;;;; Verse Block

(defun org-ewmd-verse-block (verse-block contents info)
  "Transcode a VERSE-BLOCK element from Org to HTML.
CONTENTS is verse block contents.  INFO is a plist holding
contextual information."
  ;; Replace each newline character with line break.  Also replace
  ;; each blank line with a line break.
  (setq contents (replace-regexp-in-string
                  "^ *\\\\\\\\$" (format "%s\n" (org-ewmd-close-tag "br" nil info))
                  (replace-regexp-in-string
                   "\\(\\\\\\\\\\)?[ \t]*\n"
                   (format "%s\n" (org-ewmd-close-tag "br" nil info)) contents)))
  ;; Replace each white space at beginning of a line with a
  ;; non-breaking space.
  (while (string-match "^[ \t]+" contents)
    (let* ((num-ws (length (match-string 0 contents)))
           (ws (let (out) (dotimes (i num-ws out)
                            (setq out (concat out "&#xa0;"))))))
      (setq contents (replace-match ws nil t contents))))
  (format "<p class=\"verse\">\n%s</p>" contents))


;;; Filter Functions

(defun org-ewmd-final-function (contents backend info)
  "Filter to indent the HTML and convert HTML entities."
  (with-temp-buffer
    (insert contents)
    (set-auto-mode t)
    (if org-ewmd-indent
        (indent-region (point-min) (point-max)))
    (when org-ewmd-use-unicode-chars
      (require 'mm-url)
      (mm-url-decode-entities))
    (buffer-substring-no-properties (point-min) (point-max))))


;;; End-user functions

;;;###autoload
(defun org-ewmd-export-as-html
    (&optional async subtreep visible-only body-only ext-plist)
  "Export current buffer to an HTML buffer.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting buffer should be accessible
through the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, only write code
between \"<body>\" and \"</body>\" tags.

EXT-PLIST, when provided, is a property list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

Export is done in a buffer named \"*Org HTML Export*\", which
will be displayed when `org-export-show-temporary-export-buffer'
is non-nil."
  (interactive)
  (org-export-to-buffer 'ewmd "*Org HTML Export*"
    async subtreep visible-only body-only ext-plist
    (lambda () (set-auto-mode t))))

;;;###autoload
(defun org-ewmd-convert-region-to-html ()
  "Assume the current region has org-mode syntax, and convert it to HTML.
This can be used in any buffer.  For example, you can write an
itemized list in org-mode syntax in an HTML buffer and use this
command to convert it."
  (interactive)
  (org-export-replace-region-by 'ewmd))

;;;###autoload
(defun org-ewmd-export-to-html
    (&optional async subtreep visible-only body-only ext-plist)
  "Export current buffer to a HTML file.

If narrowing is active in the current buffer, only export its
narrowed part.

If a region is active, export that region.

A non-nil optional argument ASYNC means the process should happen
asynchronously.  The resulting file should be accessible through
the `org-export-stack' interface.

When optional argument SUBTREEP is non-nil, export the sub-tree
at point, extracting information from the headline properties
first.

When optional argument VISIBLE-ONLY is non-nil, don't export
contents of hidden elements.

When optional argument BODY-ONLY is non-nil, only write code
between \"<body>\" and \"</body>\" tags.

EXT-PLIST, when provided, is a property list with external
parameters overriding Org default settings, but still inferior to
file-local settings.

Return output file's name."
  (interactive)
  (let* ((extension (concat "." org-ewmd-extension))
         (file (org-export-output-file-name extension subtreep))
         (org-export-coding-system org-ewmd-coding-system))
    (org-export-to-file 'ewmd file
      async subtreep visible-only body-only ext-plist)))

;;;###autoload
(defun org-ewmd-publish-to-html (plist filename pub-dir)
  "Publish an org file to HTML.

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name."
  (org-publish-org-to 'ewmd filename
                      (concat "." (or (plist-get plist :html-extension)
                                      org-ewmd-extension "html"))
                      plist pub-dir))


(provide 'ox-ewmd)

;; Local variables:
;; coding: utf-8
;; End:

;;; ox-ewmd.el ends here
