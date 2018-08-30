%Define o estilo de artigo da anpet
%Carrega a classe genérica "article" e depois define várias coisas. Provavelmente contém várias definições redundantes com o "article" base.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{anpet}[2016/07/07 My custom anpet class]
\LoadClass[12pt]{article}		%Tamanho de fonte.
%Tamanhos exatos (estamos usando as últimas duas colunas): 
%Command                  10pt           11pt           12pt
%                    <size> <bskip> <size> <bskip> <size> <bskip>
%\tiny                5        6      6       7      6       7
%\scriptsize          7        8      8       9.5    8       9.5
%\footnotesize        8        9.5    9      11     10      12
%\small               9       11     10      12     10.95   13.6
%\normalsize          10      12     10.95   13.6   12      14.5
%\large               12      14     12      14     14.4    18
%\Large               14.4    18     14.4    18     17.28   22
%\LARGE               17.28   22     17.28   22     20.74   25
%\huge                20.74   25     20.74   25     24.88   30
%\Huge                24.88   30     24.88   30     24.88   30

\usepackage[T1]{fontenc}		%"imprime" com fontes Tipo 1
\usepackage[utf8]{inputenc}		%Para reconhecer acentos no texto sem precisar fazer coisas como \'{a}
%\usepackage{times}			%Times New Roman
%\usepackage{mathptmx} % parece que o pacote times é obsoleto

\usepackage{newtxtext,newtxmath} % Parece que esse ainda é mais novo e já resolve o texto e a matemática

\usepackage{enumitem}

\usepackage{setspace}				%Ajuda a controlar espaçamento

\setlist{nosep}				%Sem espaço entre itens de um enumerate

\setlist[itemize]{leftmargin=*} %Sem indentação nos itens de um enumerate

\renewcommand{\labelitemi}{\scriptsize$\blacksquare$} %Muda o itemize de bola para quadrado
\usepackage[dvips,a4paper,top=3cm,bottom=3cm,left=3cm,right=2cm,nohead,nofoot]{geometry}							%Tamanho do papel e margem

\usepackage[labelfont=bf,skip=0pt]{caption} % Negrito para o nome de figuras e tabelas; Retira o espaço entre o caption e o objeto.

%Definindo espaçamento entre floats e o texto
\setlength{\intextsep}{14.5pt plus 2.0pt minus 2.0pt}		%Espaçamento de uma linha entre floats e texto para floats no meio da página
\setlength{\textfloatsep}{14.5pt plus 2.0pt minus 2.0pt}	%Espaçamento entre floats e texto apra floats posicionados no topo ou final da página. Também uma linha
\setlength{\floatsep}{14.5pt plus 2.0pt minus 2.0pt}		%Espaçamento entre floats, quando ocorrer deles ficarem adjacentes. Também uma linha.

\expandafter\def\expandafter\normalsize\expandafter{%
    \normalsize
    \setlength\abovedisplayskip{0pt}
    \setlength\belowdisplayskip{0pt}
    \setlength\abovedisplayshortskip{0pt}
    \setlength\belowdisplayshortskip{0pt}
} % Muda o espaço antes e depois da equação. Não sei se é o melhor jeito de fazer.

\usepackage{etoolbox}
\patchcmd{\thebibliography}{\section*{\refname}}{REFERÊNCIAS BIBLIOGRÁFICAS}{}{}

\usepackage{authblk}						%Pocote que ajuda a definir autores
\renewcommand\Authfont{\bfseries}	%Nomes dos autores em negrito
\renewcommand\Affilfont{\normalfont\footnotesize}	%Afiliações em tamanho 10pt
\renewcommand\Authsep{\authorcr}	%Separa autores com linhas
\renewcommand\Authand{\authorcr}
\renewcommand\Authands{\authorcr}
\setlength{\affilsep}{0pt}		%Sem espaço entre autores e afiliações

\pagenumbering{gobble}			%Páginas sem numeração
\linespread{1}					%Espaçamento simples
\setlength{\parskip}{\baselineskip}		%Espaço entre parágrafos exatamente igual ao de uma linha
%\setlength{\parskip}{14.5pt plus 6pt minus 4pt}		%Espaço entre parágrafos igual ao de uma linha (baselineskip = 14.5pt para fonte 12), com margem para ajuste. Não testei se esse ajuste funciona bem
\setlength{\parindent}{0pt}		%Sem identação de parágrafo

%Redefine o bloco de título do artigo.
\renewcommand{\maketitle}{%
\begin{center}
{\bfseries
\normalsize\MakeUppercase
\@title \par
\@author \par}
\vspace{-12pt}				%Tentando deixar so uma linha entre a última afiliação (ou autor) e o começo do documento. Não sei se está exato. (baselineskip para fonte 10 é igual a 12, por isso o -12)
\end{center}
}

%Define o Resumo

\newcommand\resumoname{Resumo}  %Define o nome do resumo

\newenvironment{resumo}
	{
		\footnotesize							%10pt
        \begin{spacing}{1}
        {\bfseries \MakeUppercase \resumoname}
        \\        
    }
    {
    	\end{spacing}
    	\normalsize
    }

%Redefine o abstract
\renewenvironment{abstract}
	{
    	\begin{otherlanguage}{english}
		\footnotesize							%10pt
    	{\bfseries \MakeUppercase \abstractname}
    	\\
    }
    {
    	\normalsize
        \end{otherlanguage}
    }
    
%Define os agradecimentos
\newcommand\acknowledgementsname{Agradecimentos}	%Mudar o nome da seção de agradecimentos aqui se seu artigo não estiver em português

\newenvironment{acknowledgements}
	{
		\footnotesize							%10pt
        \begin{spacing}{1}
        {\bfseries \acknowledgementsname}
        \\        
    }
    {
    	\end{spacing}
    	\normalsize
    }
    
%Define o enviroment que configura as descrições dos parâmetros de uma equação

\newenvironment{condições}[1][em que]
   {
   	#1 
   	\begin{tabular}[t]{>{$}l<{$} @{$:{}$} l}
   }
   {
  	\end{tabular}
    \\[\belowdisplayskip]
   }

%Definindo headers de seção
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {0pt} % plus 4pt minus 2pt}%		&Espaço entre a linha acima e o cabeçalho. Como já tem uma linha em branco entre parágrafos não precisa adicionar mais nada. Tentando deixar uma margem pra ajuste, mas não testei se esse ajuste funciona.
                                   {1em}%
                                   {\normalfont\bfseries\MakeUppercase}}

\renewcommand\subsection{\@startsection {subsection}{1}{\z@}%
                                   {0pt} % plus 4pt minus 2pt}%		&Espaço entre a linha acima e o cabeçalho. Como já tem uma linha em branco entre parágrafos não precisa adicionar mais nada. Tentando deixar uma margem pra ajuste, mas não testei se esse ajuste funciona.
                                   {1em}%
                                   {\normalfont\bfseries}}
                                   
\renewcommand\subsubsection{\@startsection {subsubsection}{1}{\z@}%
                                   {0pt} % plus 4pt minus 2pt}%		&Espaço entre a linha acima e o cabeçalho. Como já tem uma linha em branco entre parágrafos não precisa adicionar mais nada. Tentando deixar uma margem pra ajuste, mas não testei se esse ajuste funciona.
                                   {1em}%
                                   {\normalfont\itshape}}
                                   
%A anpet aceita só 3 níveis de subseção, mas acho que daria pra definir mais se necessário

%%Os comandos paragraph e subparagraph não são necessários, mas caso alguém queira usar isso arruma o espaçamento pra não destoar do resto:
\renewcommand\paragraph{\@startsection {paragraph}{1}{\z@}%
                                   {0pt} % plus 4pt minus 2pt}%		&Espaço entre a linha acima e o cabeçalho. Como já tem uma linha em branco entre parágrafos não precisa adicionar mais nada. Tentando deixar uma margem pra ajuste, mas não testei se esse ajuste funciona.
                                   {-10pt}%
                                   {\normalfont\bfseries}}
                                   
\renewcommand\subparagraph{\@startsection {subparagraph}{1}{\z@}%
                                   {0pt} % plus 4pt minus 2pt}%		&Espaço entre a linha acima e o cabeçalho. Como já tem uma linha em branco entre parágrafos não precisa adicionar mais nada. Tentando deixar uma margem pra ajuste, mas não testei se esse ajuste funciona.
                                   {-10pt}%
                                   {\normalfont\itshape}}

%Esse pacote ajuda a definir coisas relacionadas aos nomes de seções. Daria pra definir tudo por ele ao invés de parte por renewcomand e parte pelo pacote, mas assim foi mais fácil de implementar
\usepackage{titlesec}
\titlespacing*{\section}{0pt}{0pt}{-14.5pt}		%Colando o texto da seção com o nome da seção (normalmente tem um espaço de 14.5 por causa do paragrafo (eu acho), só estamos removendo esse espaço)
\titlespacing*{\subsection}{0pt}{0pt}{-14.5pt}
\titlespacing*{\subsubsection}{0pt}{0pt}{-14.5pt}
\titleformat{\section}{\bfseries\MakeUppercase}{\thesection. \ }{0em}{}
\titleformat{\subsection}{\bfseries}{\thesubsection. }{0em}{}
\titleformat{\subsubsection}{\itshape}{\thesubsubsection. }{0em}{}
% Faz seção ter dois espaços após o ponto e a subseção e subsubseção terem apenas um espaço. Ver como isso casa com o que já foi feito em cima e se não é necessário complementar as especificaçõs de fonte... Também seria interessante conseguir forçar para a subseção e subsubseção que a primeira letra seja maiúscula e as demais não, exceto se estiverem entre chaves, por exemplo, por causa se siglas, etc.

%\titlelabel{\thetitle.\ \ }		%Colocando um ponto no final da numeracão da seção (ex.: seção 1.1. ao invés de 1.1)

% % % % % % % % % MUDANCAS NAS REFERENCIAS E CITACOES % % % % % % % % 

\usepackage{xpatch}
\usepackage[backend=biber, 
			style=authoryear-comp,
            citestyle=authoryear,
			dashed=true,
            giveninits=true,
            uniquename=init,
            natbib=true,
            doi=false,
            isbn=false,
            url=false,
            maxbibnames=99,
            maxcitenames=2,
            sorting=nty
            ]{biblatex}


% troca o tamanho da fonte das referências para 10pt
\renewcommand*{\bibfont}{\footnotesize}

% altera a indentação na segunda linha das referências
\setlength{\bibhang}{1cm}

%  muda o delimitador entre autores de "," para ";" na bibliografia, porém muda para "e" caso o nome seja o último. ex: (Silva, A.;B. Silva e C.Silva) 
\AtBeginBibliography{
  \renewcommand*{\multinamedelim}{;\space}
  \renewcommand*{\finalnamedelim}{\space e\space}
}

% remove o ponto após o ano do artigo.
\renewcommand{\labelnamepunct}{\addspace}

%  elimina <<>> do titulo
\DeclareFieldFormat[article]{title}{#1}
\DeclareFieldFormat[inproceedings]{title}{#1}
\DeclareFieldFormat[incollection]{title}{#1}
\DeclareFieldFormat[inbook]{title}{#1}

%  suprime "in:" de referencias de artigos
\renewbibmacro{in:}{} 

%  configura \addcomma como separador entre volume e numero  
\xpretobibmacro{volume+number+eid}{
  \setunit*{\addcomma\addspace}
}{}{}

%  adiciona "v." antes do dado do volume, "n." antes do numero e "p." antes das páginas

\DeclareFieldFormat[article]{volume}{v.\addnbspace #1,}
\DeclareFieldFormat[article]{number}{\addspace n.\addnbspace #1}
\DeclareFieldFormat{pages}{p.\addnbspace #1}
\DeclareFieldFormat[inproceedings]{volume}{v.\addnbspace #1,}
\DeclareFieldFormat[inproceedings]{number}{\addspace n.\addnbspace #1}

% adiciona "(" e ")" ao redor da edição dos livros.
\DeclareFieldFormat[book]{edition}{(#1\textsuperscript{a} \addnbspace ed.)}

%  altera a ordem da editora e da localização para que apareçam na respectiva ordem
\renewbibmacro*{publisher+location+date}{%
  \printlist{publisher}%
  \iflistundef{location}
    {\setunit*{\addcomma\space}}
    {\setunit*{\addcomma\space}}%
  \printlist{location}%
  \setunit*{\addcomma\space}%
  \usebibmacro{date}%
  \newunit}
 
% faz com que "et al." seja escrito em italico
\renewbibmacro*{name:andothers}{% Based on name:andothers from biblatex.def
  \ifboolexpr{
    test {\ifnumequal{\value{listcount}}{\value{liststop}}}
    and
    test \ifmorenames
  }
    {\ifnumgreater{\value{liststop}}{1}
       {\finalandcomma}
       {}%
     \andothersdelim\bibstring[\emph]{andothers}}
    {}}

% altera a ordem dos editores e do título do livro em @incollection

\newcommand\printin{\adddot\space \textit{In:} \space}

\newbibmacro*{byeditor:in}{%
  \ifnameundef{editor}
    {}
    {\printnames[editorin]{editor}%
     \addspace\bibsentence%
     \mkbibparens{\usebibmacro{editorstrg}}%
     \clearname{editor}%
     \printunit{\space}}}
     
\xpatchbibdriver{incollection}
  {\usebibmacro{in:}%
   \usebibmacro{maintitle+booktitle}%
   \newunit\newblock
   \usebibmacro{byeditor+others}}
  {\printunit{\printin}%
   \usebibmacro{byeditor:in}%
   \setunit{\labelnamepunct}\newblock
   \usebibmacro{maintitle+booktitle}%
   \newunit\newblock
   \usebibmacro{byeditor}}
  {}{}
  
\xpatchbibdriver{inbook}
  {\usebibmacro{in:}%
   \usebibmacro{maintitle+booktitle}%
   \newunit\newblock
   \usebibmacro{byeditor+others}}
  {\printunit{\printin}%
   \usebibmacro{byeditor:in}%
   \setunit{\labelnamepunct}\newblock
   \usebibmacro{maintitle+booktitle}%
   \newunit\newblock
   \usebibmacro{byeditor}}
  {}{}
  



