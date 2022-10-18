%---------------------------------------------------------------------------------------------------
%
%             .oooooo.     .oooooo.   ooo        ooooo 
%           d8P'  `Y8b   d8P'  `Y8b  `88.       .888' 
%         888          888           888b     d'888  
%        888          888           8 Y88. .P  888  
%       888          888           8  `888'   888  
%      `88b    ooo  `88b    ooo   8    Y     888  
%      `Y8bood8P'   `Y8bood8P'  o8o        o888o .usp
%
%
%     Arquivo LaTeX modelo para provas, listas e cadernos do CCM-USP
%     Por: Alfredo Marin (T30)
%     Criado em: Outubro/2022
%
%---------------------------------------------------------------------------------------------------


% IDENTIFICAÇÃO ------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{templatecm}[2022/10/18 Template para provas, listas e cadernos do CCM-USP]


% DECLARAÇÕES PRELIMINARES -------------------------------------------------------------------------
% Pacotes principais -----------------------------
\RequirePackage{xcolor} % Criar cores pré-definidas

% Parâmetros principais --------------------------
\renewcommand{\title}[1]{\newcommand{\thistitle}{#1}}
\newcommand{\course}[1]{\newcommand{\thiscourse}{#1}}
\newcommand{\code}[1]{\newcommand{\thiscode}{#1}}
\newcommand{\professor}[1]{\newcommand{\thisprofessor}{#1}}


\newcommand{\student}[1]{\newcommand{\thisstudent}{#1}}
\newcommand{\id}[1]{\newcommand{\thisid}{#1}}
\newcommand{\class}[1]{\newcommand{\thisclass}{#1}}

\renewcommand{\date}[1]{\newcommand{\thisdate}{#1}}
\newcommand{\term}[1]{\newcommand{\thisterm}{#1}}

\newcommand{\institute}[1]{\newcommand{\thisinstitute}{#1}}

\newcommand{\maincolor}{black}
\newcommand{\layoutfile}{lyt/assignmentlayout.tex}


% OPÇÕES -------------------------------------------------------------------------------------------
% Cores do logo %
\definecolor{cmred}{RGB}{234,53,70}         % Matemática
\definecolor{cmorange}{RGB}{239,135,0}      % Física
\definecolor{cmyellow}{RGB}{249,199,14}     % Química
\definecolor{cmgreen}{RGB}{4,190,81}        % Biologia
\definecolor{cmblue}{RGB}{0,120,215}        % Computação

% Escolha de cor %
\DeclareOption{red}{\renewcommand{\maincolor}{cmred}}
\DeclareOption{orange}{\renewcommand{\maincolor}{cmorange}}
\DeclareOption{yellow}{\renewcommand{\maincolor}{cmyellow}}
\DeclareOption{green}{\renewcommand{\maincolor}{cmgreen}}
\DeclareOption{blue}{\renewcommand{\maincolor}{cmblue}}

% Escolha de layout %
\DeclareOption{assignment}{\renewcommand{\layoutfile}{lyt/assignmentlayout.tex}}    % Padrão
\DeclareOption{notebook}{\renewcommand{\layoutfile}{lyt/notebooklayout.tex}}

% Ignorar algumas opções padrão %
\DeclareOption{twocolumn}{\OptionNotUsed}
\DeclareOption{twoside}{\OptionNotUsed}

% Outras opções %
\PassOptionsToClass{a4paper, 12pt}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Carregar a classe base %
\LoadClass{article}


% OUTRAS DECLARAÇÕES -------------------------------------------------------------------------------
% Outros Pacotes ---------------------------------
% Configuração das fontes %
\RequirePackage[proportional,scaled=1.1]{notomath}      % Fonte padrão e matemática
\RequirePackage{nimbusmononarrow}                       % Fonte monospace
\RequirePackage[T1]{fontenc}

% Configuração do layout %
\RequirePackage[a4paper, top=3cm, bottom=2cm, left=3cm, right=2cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}               % Customizar o cabeçalho e o rodapé
\RequirePackage{multicol}               % Formatar o texto em múltiplas colunas
\RequirePackage{setspace}               % Configurar o espaçamento entre linhas
\RequirePackage{caption}                % Customizar as legendas
\RequirePackage[brazilian]{babel}       % Traduzir alguns comandos automáticos

% Formatos especiais %
\RequirePackage{booktabs, colortbl}     % Criar tabelas personalizadas
\RequirePackage{titlesec}               % Customizar os títulos das seções
\RequirePackage[shortlabels]{enumitem}  % Customizar a enumeração
\RequirePackage{graphicx}               % Importar imagens
\RequirePackage{svg}                    % Importar imagens vetorizadas
\RequirePackage{hyperref}               % Adicionar hyperlinks
\RequirePackage{fancyvrb}               % Importar arquivos de texto
\RequirePackage{minted}                 % Importar e formatar código

% Comandos matemáticos %
\RequirePackage{amsmath}                % Usar fórmulas, comandos e símbolos matemáticos
\RequirePackage{xfrac}                  % Gerar frações na diagonal

% Outros %
\RequirePackage{lipsum}                 % Gerar parágrafos Lorem ipsum
\RequirePackage[version=4]{mhchem}      % Usar fórmulas, reações e estruturas químicas

% Comandos principais ----------------------------
% Destacar %
\newcommand{\hili}[1]{{\bfseries \textcolor{\maincolor}{#1}}}

% Redefinição dos ambientes ----------------------
% Título, cabeçalhos e rodapés
\input{\layoutfile}

% Seções %
\titleformat{\section}[hang]{\LARGE \bfseries \color{\maincolor}}{\thesection}{.75cm}{}
\titleformat{\subsection}[hang]{\Large \bfseries \color{\maincolor}}{\thesubsection}{.75cm}{}
\titleformat{\subsubsection}[hang]{\large \bfseries \color{\maincolor}}{\thesubsubsection}{.75cm}{}
\renewcommand{\thesubsection}{\thesection.\alph{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\roman{subsubsection}}

% Listas %
  % /itemize/
\let\oldlabelitemi\labelitemi
\renewcommand{\labelitemi}{\hili{\oldlabelitemi}}
\let\oldlabelitemii\labelitemii
\renewcommand{\labelitemii}{\hili{\oldlabelitemii}}
\let\oldlabelitemiii\labelitemiii
\renewcommand{\labelitemiii}{\hili{\oldlabelitemiii}}
\let\oldlabelitemiv\labelitemiv
\renewcommand{\labelitemiv}{\hili{\oldlabelitemiv}}
  % /enumerate/
\let\oldlabelenumi\labelenumi
\renewcommand{\labelenumi}{\hili{\oldlabelenumi}}
\let\oldlabelenumii\labelenumii
\renewcommand{\labelenumii}{\hili{\oldlabelenumii}}
\let\oldlabelenumiii\labelenumiii
\renewcommand{\labelenumiii}{\hili{\oldlabelenumiii}}
\let\oldlabelenumiv\labelenumiv
\renewcommand{\labelenumiv}{\hili{\oldlabelenumiv}}

% Configurações do layout ------------------------
% Estilo do código %
\usemintedstyle{pastie}

% Espaçamento entre linhas %
\setstretch{1.25}

% Modificação de alguns comandos %
\let\ds\displaystyle
\allowdisplaybreaks

% Citações %
\let\oldcite\cite
\renewcommand{\cite}[1]{\textsuperscript{\hili{\oldcite{#1}}}}

% Legendas %
\captionsetup{justification=centering, font={small}, labelfont={bf}, labelsep=period}

% Importação de arquivos de texto %
\RecustomVerbatimCommand{\VerbatimInput}{VerbatimInput}{
    fontsize=\scriptsize,
    %
    frame=lines,
    framesep=.5cm,
    framerule=.5mm,
    rulecolor=\maincolor,
    %
    vspace=.5cm
}

% Outros comandos --------------------------------
% Setas
\newcommand{\arrow}{\textcolor{\maincolor}{$\boldsymbol{\rightarrow}$ }}
\newcommand{\longarrow}{\textcolor{\maincolor}{$\boldsymbol{\longrightarrow}$ }}
\newcommand{\squigarrow}{\textcolor{\maincolor}{$\boldsymbol{\rightsquigarrow}$ }}

% Observação
\newcommand{\obs}[1]{{\footnotesize \hili{Obs:} #1}}


\endinput
