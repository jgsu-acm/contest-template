\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ctsol}[2021/11/30 v1.0 Contest Solution Template document class]

\LoadClass[lang=cn,color=blue]{elegantbook}

\RequirePackage{tabularx,booktabs} 
\RequirePackage{listings}

\makeatletter
\renewcommand{\maketitle}
{
	\clearpage
	\thispagestyle{empty}
	\begin{center}
		\LARGE
		\textbf{\@title} \par
		\normalsize
		\vspace{0.5cm}
		\@date
	\end{center}
}

% from https://tex.stackexchange.com/questions/271062/labeling-a-text-and-referencing-it-later
\newcommand{\labeltext}[2]
{
	\@bsphack
	\csname phantomsection\endcsname
	\def\@currentlabel{#1}{\label{#2}}
	\@esphack
}
\makeatother

\newcounter{solamo}
\newcommand{\addsolution}[3]{
    \stepcounter{solamo}
	\labeltext{#1}{pro:\thesolamo}
	\labeltext{#2}{aut:\thesolamo}
	\labeltext{#3}{ans:\thesolamo}
}

\renewcommand{\thechapter}{\Alph{chapter}}
\renewcommand{\chaptername}{\thechapter.}

\newcounter{solcnt}
\newcommand{\makesolution}
{
	\stepcounter{solcnt}
	\chapter{\ref*{pro:\thesolcnt}}
}

\lstset{
    language=C++,
    basicstyle=\ttfamily,
    keywordstyle=\color{blue}\ttfamily,
    stringstyle=\color{brown}\ttfamily,
    commentstyle=\color{teal}\ttfamily,
    morecomment=[l][\color{brown}]{\#},
    showstringspaces=false
}

\newcolumntype{M}{>{\centering\arraybackslash}X}

\newcommand{\solutiontab}
{
	\begin{center}
		\begin{tabularx}{\textwidth}{M|M|M|M}
			\toprule
			\textbf{题目编号} & \textbf{题目名称} & \textbf{命题人} & \textbf{做法} \\
			\midrule
		\end{tabularx}
	
		\newcounter{i}
		\setcounter{i}{1}
		\whiledo{\value{i}<\numexpr\value{solamo}+1\relax}
		{
			\begin{tabularx}{\textwidth}{M|M|M|M}
				\Alph{i} & \ref*{pro:\thei} & \ref*{aut:\thei} & \ref*{ans:\thei} \\
				\ifnum \value{i}=\value{solamo}
					\bottomrule
				\fi
			\end{tabularx}
			\stepcounter{i}
		}
	\end{center}
}