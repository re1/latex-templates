\ProvidesClass{school}

% = options
% == use landscape orientation
\newif\iflandscape\landscapefalse
\DeclareOption{landscape}{\landscapetrue}
% == do not print title page
\newif\iftitle\titletrue
\DeclareOption{notitle}{\titlefalse}
% == do not print table of contents
\newif\iftoc\toctrue
\DeclareOption{notoc}{\tocfalse}

% == pass Options
\iflandscape\PassOptionsToClass{landscape}{article}\fi

% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions \relax
% == load article class
\LoadClass[a4paper,10pt]{article}

% = packages
\iflandscape
  \RequirePackage[landscape,margin=1in]{geometry}
\else
	\RequirePackage{a4wide}
\fi

\RequirePackage{booktabs}
\RequirePackage[marginal, norule, perpage]{footmisc}
\RequirePackage{titling}
\RequirePackage{lastpage}
\RequirePackage[ngerman]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage{microtype}
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{graphicx}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage{outlines}
\RequirePackage{enumitem}
\RequirePackage{tabularx}
\RequirePackage[acronym, xindy, toc, nohypertypes={acronym,notation}]{glossaries}

% = variables
\newcommand\@subject{}
\newcommand\subject[1]{\renewcommand\@subject{#1}}

% = package configuration
% == footnotes
\def\arraystretch{1.5}
\renewcommand{\thefootnote}{\Roman{footnote}}
% == header
\pagestyle{fancy}
\fancyhf{}

\makeatletter
\fancyhead[L]{\small \@subject~\--~\thetitle}
\fancyhead[R]{\small \@date}
\fancyfoot[L]{\small \theauthor}
\fancyfoot[R]{\small \thepage~/~{\pageref*{LastPage}}}
\makeatother

\renewcommand{\footrulewidth}{\headrulewidth}
% == hyperlinks
\hypersetup{colorlinks=true, linkcolor=MidnightBlue, urlcolor=MidnightBlue, citecolor=MidnightBlue}

% = makros
% == title
\makeatletter
\renewcommand{\@maketitle}{
  \let \footnote \thanks~\\
  {\Huge\textbf{\@title}}
  \vspace{0.5em}~\\
  {\footnotesize\@author, \@date}
  \vskip 2em
}
\makeatother

% == math variable declaration
\newenvironment{vardefs}{
	\center \small
	\begin{tabular}{l l l}
}{\end{tabular} \normalsize \endcenter}
\newcommand\addvardef[2]{
    {#1} & \dots & {#2}\\
}

% == add common commands at the beginning of the document
\AtBeginDocument{
    % title page
    \iftitle
        \maketitle
        \thispagestyle{empty}
    \fi
    % table of contents
    \iftoc
        \tableofcontents
        \glsresetall
    \fi
}