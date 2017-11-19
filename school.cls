\ProvidesClass{school}
\LoadClass[a4paper,10pt]{article}
% == Packages
% === Page format
\RequirePackage{a4wide}
\RequirePackage{booktabs}
\RequirePackage[marginal, norule, perpage]{footmisc}
% === Language
\RequirePackage[ngerman]{babel}
% === Font
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
% === Math
\RequirePackage{amssymb}
\RequirePackage{mathtools}
% === Color
\RequirePackage[dvipsnames]{xcolor}
% === Graphics
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}
% === Hyperlinks
\RequirePackage{hyperref}
\RequirePackage{url}
% === Enumeration
\RequirePackage{outlines}
\RequirePackage{enumitem}
% === Tables
\RequirePackage{tabularx}
% === Glossaries
\RequirePackage[acronym, xindy, toc]{glossaries}

%% Package Configuration
\hypersetup{colorlinks=true, linkcolor=MidnightBlue, urlcolor=MidnightBlue, citecolor=MidnightBlue}
% Variables
\newcommand\@subject{}
\newcommand\subject[1]{\renewcommand\@subject{#1}}
% Settings
\def\arraystretch{1.5}
\renewcommand{\thefootnote}{\Roman{footnote}}

\makeatletter
\renewcommand{\@maketitle}{
    \newpage
    \null
    \vskip 2em
    \begin{center}
    \let \footnote \thanks
    \begin{center}
        \Large{\makeatletter\@subject\makeatother}\\
        \rule{0.5\textwidth}{0.1 mm}
    \end{center}
    \vspace{1 em}
    \huge{\makeatletter\@title\makeatother} \vspace{0.5 em}
    \par
    \vskip 1.5em
    {\large
      \lineskip .5em
      \begin{tabular}[t]{c}
        \@author
      \end{tabular}\par}
    \vskip 1em
    {\large \@date}
  \end{center}
  \par
  \vskip 1.5em}
\makeatother
