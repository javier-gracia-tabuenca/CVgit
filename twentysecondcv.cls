\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

%\RequirePackage[quiet]{fontspec}
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\usepackage{wrapfig}
\usepackage{fontawesome}
\usepackage{transparent}

\usepackage{enumitem}
\usepackage{booktabs}

\usepackage{changepage}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,           % no lik border color
    allbordercolors=black       % white border color for all
}
\let\orighref\href

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
    \IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
    \XeTeXLinkBox{%
      \SavedIncludeGraphics#1{#2}%
    }%
  }%
\fi

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------
\def\@sectioncolor#1#2#3{%
	{%
		\color{pblue} #1#2#3%
	}%
}

\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

\definecolor{pblue}{HTML}{0395DE}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
%\newfontfamily[Path = fonts/]{segoeuib.ttf}

%----------------------------------------------------------------------------------------
%	 PAGE CONFIG
%----------------------------------------------------------------------------------------
\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}


%----------------------------------------------------------------------------------------
%	 GENERAL NEW COMANDS
%----------------------------------------------------------------------------------------
%Link with external link icon
\renewcommand{\href}[2]{\orighref{#1}{#2~\faExternalLink}}
\newcommand{\hrefO}[2]{\orighref{#1}{#2}}



%----------------------------------------------------------------------------------------
%  Title
%----------------------------------------------------------------------------------------
\newcommand{\lmarging}{0.7}
\newcommand{\umarging}{0.7}
\newcommand{\makeprofileTitle}[1]{
	%background
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=\paperwidth, minimum height=2.2cm] (box) at (3cm,0.5cm){};
  \end{tikzpicture}
    %text   
    \begin{textblock}{21}(\lmarging, \umarging)
  	{\Huge\color{pblue}#1}
    \end{textblock}
}

%----------------------------------------------------------------------------------------
%  Left page1
%----------------------------------------------------------------------------------------
\newenvironment{LeftPage1}{
	%background
  	\begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9.3cm, minimum height=					\paperheight+1cm] (box) at (-5cm,0.5cm){};
  	\end{tikzpicture}
	%text
  	\begin{textblock}{6.3}(\lmarging,2)
	}{
	 \end{textblock}
	}
%----------------------------------------------------------------------------------------
%  Right page1
%----------------------------------------------------------------------------------------
\newenvironment{RigthPage1}{
	%text
  	\begin{textblock}{12.7}(7.6,2)
	}{
	 \end{textblock}
	}



%----------------------------------------------------------------------------------------
%  Left page 2
%----------------------------------------------------------------------------------------
\newenvironment{LeftPage2}{
	%background
  	\begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9.3cm, minimum height=					15cm] (box) at (-5cm,0.5cm){};
  	\end{tikzpicture}
	%text width x y
  	\begin{textblock}{6.3}(\lmarging,1)
	}{
	 \end{textblock}
	}
%----------------------------------------------------------------------------------------
%  Right page 2
%----------------------------------------------------------------------------------------
\newenvironment{RigthPage2}{
	%text
  	\begin{textblock}{12.7}(7.6,1)
	}{
	 \end{textblock}
	}


%----------------------------------------------------------------------------------------
%  PUBLICATIONS
%----------------------------------------------------------------------------------------
\newenvironment{downPubli}{
	%text
  	\begin{textblock}{18}(2, 15)
	}{
	 \end{textblock}
	}
  

%----------------------------------------------------------------------------------------
%	LEFT BAR ELEMENTS
%----------------------------------------------------------------------------------------
%SEPARATOR
\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \LARGE #1 \rule[0.15\baselineskip]{#2}{1pt}}}

%PROFILE PICTURE
\newcommand{\profilepic}[1]{
    \begin{center}
    \roundpic[xshift=0cm,yshift=0cm]{5.5cm}{5.5cm}{#1}
    \end{center}
}
\newcommand{\roundpic}[4][]{
  \tikz\node [circle, minimum width = #2,
    path picture = {
      \node [#1] at (path picture bounding box.center) {
        \includegraphics[width=#3]{#4}};
    }] {};}
    

%JOB TITLE   
\newcommand{\jobtitle}[1]{\Large\color{black!80}#1}

%CONTACT ELEMENTS 
\newcommand{\cvlink}[3]{             
             $\vcenter{\hbox{ \hrefO{#2}{\includegraphics[width=0.6cm]{#3}} }}$
             \href{#2}{#1}
              }
   
%BUBBLE KNOWLEDGE
% Command for printing skill progress bars
\newcommand\skills{ 
~
	\smartdiagram[bubble diagram]{
        \textbf{Biomedicine},
        \textbf{Hardware}\\\textbf{~~~Design},
        \textbf{Medical}\\\textbf{Instrumentation},
        \textbf{Signal}\\\textbf{Processing},
        \textbf{Respiratory}\\\textbf{Physiology},
        \textbf{Sleep}\\\textbf{Physiology},
        \textbf{Statistical}\\\textbf{Analysis}
    }
}

% Command for printing skill progress bars
\newcommand\interests[1]{ 
	\renewcommand{\interests}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+0.4);
				\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\node [above right] at (0,\i+0.4) {\x};
			}
		\end{tikzpicture}
	}
}

%PROGRAMING
\newcommand{\lanprog}[3]{%
	{\color{mainblue} {\normalsize #2} \textbf{\large #1} \hfill }\\
 	\ifblank{#3}{}{ \small \phantom{0} \hfill #3}\\ 
}



%----------------------------------------------------------------------------------------
%	RIGHT SIDE ELEMENTS
%----------------------------------------------------------------------------------------
% blue in the 3 first leters of section 
\renewcommand{\section}[1]{
  \par\vspace{\parskip}
	{%
		\LARGE\color{headercolor}%
		\@sectioncolor #1%
	}
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\Large\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}



% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}


\newcommand{\twentyitem}[4]{%
	#1&\parbox[t]{0.83\textwidth}{\textbf{#2}\\
		{\footnotesize #3 \hfill 	#4}\\
	}\\
}

\newcommand{\twentyitemlist}[4]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}		\hfill 	{\footnotesize#3}%
		\begin{itemize}[topsep=5pt,leftmargin=15pt,itemsep=5pt]
        #4
        \end{itemize}\vspace{\parsep}
	}\\
}


\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}



%----------------------------------------------------------------------------------------
%	NEEDED FOR BUBBLE KNOWLEDGE
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}


\usepackage{smartdiagram}
\smartdiagramset{
    bubble center node font = \footnotesize,
    bubble node font = \footnotesize,
    % specifies the minimum size of the bubble center node
    bubble center node size = 0.5cm,
    %  specifies the minimum size of the bubbles
    bubble node size = 1.9cm,
    % specifies which is the distance among the bubble center node and the other bubbles
    distance center/other bubbles = 0.45cm,
    % sets the distance from the text to the border of the bubble center node
    distance text center bubble = 0.5cm,
    % set center bubble color
    bubble center node color = pblue,
    % define the list of colors usable in the diagram
    set color list = {lightgray, materialcyan, orange, green, materialorange, materialteal, materialamber, materialindigo, materialgreen, materiallime},
    % sets the opacity at which the bubbles are shown
    bubble fill opacity = 0.6,
    % sets the opacity at which the bubble text is shown
    bubble text opacity = 1,
}

