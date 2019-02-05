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

%\renewcommand{\href}[2]{\href{#1}{#2~O}}
\let\orighref\href
\renewcommand{\href}[2]{\orighref{#1}{#2~\faExternalLink}}
\newcommand{\hrefO}[2]{\orighref{#1}{#2}}

%%%%

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

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{black}} % Make \textbf produce coloured text instead
\pagestyle{empty} % Disable headers and footers
\setlength{\parindent}{0pt} % Disable paragraph indentation
% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
%\newfontfamily[Path = fonts/]{segoeuib.ttf}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \LARGE #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\skypeID}[1]{\renewcommand{\skypeID}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsiteRG}[1]{\renewcommand{\cvsiteRG}{#1}}
\newcommand{\cvsiteLN}[1]{\renewcommand{\cvsiteLN}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

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

%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=21cm, minimum height=2cm] (box) at (5cm,1.1cm){};
  \end{tikzpicture}
  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.2)

    %------------------------------------------------
    
        \vspace{4mm}
    {\Huge\color{pblue}\cvname}

    %------------------------------------------------
    \vspace{4mm}
    \begin{center}
    \roundpic[xshift=0cm,yshift=0cm]{5.5cm}{5.5cm}{img/pic.jpg}
    \end{center}
    
    
    {\Large\color{black!80}\cvjobtitle}

    %------------------------------------------------
    
    \vspace{5mm}
    \renewcommand{\arraystretch}{1.6}


%------------------------------------------------        
%% cv links 
\begin{tabular}{p{1cm} @{\hskip 0.5cm}p{5cm}}

	\cvlink{{\footnotesize\cvsiteLN}}{https://www.linkedin.com/in/\cvsiteLN}{img/ln.png}

	\cvlink{\cvsiteRG}{https://www.researchgate.net/profile/\cvsiteRG}{img/researchgate_grey_2.png}

	\cvlink{\cvnumberphone}{\cvnumberphone}{img/tel.png}

	\cvlink{{\footnotesize \cvmail}}{mailto:\cvmail}{img/email.png}
\end{tabular}

%------------------------------------------------
% Knolege        
        \profilesection{Knowledge}{3cm}

    	\skills
        
%------------------------------------------------
%Programing
        \profilesection{Programming}{2.2cm} 
        
        \lanprog{Matlab}{+6y}{Signal processing, chaos analysis} 
        \lanprog{R}{+2y}{Statistical analysis}       
        \lanprog{C}{+2y}{MSP430, ESP8266, Arduino}
        \lanprog{LabView}{+2y}{USB-6259, PID, +Matlab}
        \lanprog{Altium}{+2y}{PCB, also Eagle}
        \lanprog{Comsol}{+1y}{3D thorax, AC/DC, +Matlab}
        %\lanprog{git,}{}{}
        
%		\interests{
%		{Comsol/4},
%		{LabView/4},
%		{R/4.5},
%		{C/5},
%		{Matlab/5.75}}        
%        \interests
  \end{textblock}
} 

\newcommand{\makeprofiledos}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor, anchor=north, minimum width=9cm, minimum height=15cm] (box) at (0.5cm,5cm){};
  \end{tikzpicture}


  %------------------------------------------------

  \begin{textblock}{6}(0.5, 1)
%------------------------------------------------
%Languages         

        \profilesection{Languages}{3cm} 
              
       \includegraphics[width=1.2cm]{img/esp.png}~
        \includegraphics[width=1.4cm]{img/eng.png}~
       \includegraphics[width=1.2cm]{img/cat.png}~
        \includegraphics[width=1.2cm]{img/fin.png}
  
  
%------------------------------------------------
%Interest      
         \profilesection{Interests}{3.6cm}   
        \begin{center}   
         \includegraphics[width=4.5cm]{img/test.png}
        \end{center}

% 
  \end{textblock}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

\newcommand{\roundpic}[4][]{
  \tikz\node [circle, minimum width = #2,
    path picture = {
      \node [#1] at (path picture bounding box.center) {
        \includegraphics[width=#3]{#4}};
    }] {};}

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\def\@sectioncolor#1#2#3{%
	{%
		\color{pblue} #1#2#3%
	}%
}


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

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newenvironment{twentydos}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[5]{%
	#1&\parbox[t]{0.83\textwidth}{%
		\textbf{#2}		\hfill 	{\footnotesize#3}\\%
        \ifblank{#4}{}{\hfill {\footnotesize#4} }
        \ifblank{#5}{}{#5\vspace{\parsep}}
		%
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



%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}

%----------------------------------------------------------------------------------------
%	 Programing
%----------------------------------------------------------------------------------------
\newcommand{\lanprog}[3]{%
	{\color{mainblue} #2 \textbf{\large #1} \hfill }\\
 	\ifblank{#3}{}{ \small \phantom{0} \hfill #3}\\ 
}

\newcommand{\cvlink}[3]{ 
            {$
              \begin{array}{l}
              {\hrefO{#2}{\includegraphics[width=0.6cm]{#3}}}
              \end{array}
              $}
             & \href{#2}{#1}\\ }


%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
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

