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
\ProvidesClass{templatecm}[2023/04/17 Template para provas, listas e cadernos do CCM-USP]


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
\newcommand{\university}[1]{\newcommand{\thisuniversity}{#1}}

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
\DeclareOption{black}{\renewcommand{\maincolor}{black}}     % Padrão
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
\RequirePackage[proportional, scaled=1.1]{notomath}     % Fonte padrão e matemática
\RequirePackage{nimbusmono}                             % Fonte monospace
\RequirePackage[T1]{fontenc}

% Configuração do layout %
\RequirePackage[a4paper, top=3cm, bottom=3cm, left=2cm, right=2cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage{fancyhdr}               % Customizar o cabeçalho e o rodapé
\RequirePackage{multicol, multirow}     % Formatar o texto em múltiplas colunas ou linhas
\RequirePackage{setspace}               % Configurar o espaçamento entre linhas
\RequirePackage{hyperref}               % Adicionar funcionalidades à referências cruzadas
\RequirePackage{caption}                % Customizar as legendas
\RequirePackage{subcaption}             % Inserir subfiguras e subtabelas
\RequirePackage[brazilian]{babel}       % Traduzir alguns comandos automáticos
\RequirePackage{fvextra, csquotes}      % Inserir citações e aspas
\RequirePackage[round]{natbib}          % Gerenciar a bibliografia

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
\RequirePackage{amsmath, bm}            % Usar fórmulas, comandos e símbolos matemáticos
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
\setlist[itemize, 1]{label=\hili{$\bullet$}}
\setlist[itemize, 2]{label=\hili{$\circ$}}
\setlist[itemize, 3]{label=\hili{$\diamond$}}
\setlist[itemize, 4]{label=\hili{-}}
  % /enumerate/
\setlist[enumerate, 1]{label=\hili{\arabic*.}}
\setlist[enumerate, 2]{label=\hili{\alph*.}}
\setlist[enumerate, 3]{label=\hili{\Roman*.}}
\setlist[enumerate, 4]{label=\hili{\roman*.}}

% Configurações do layout ------------------------
% Estilo do código %
\definecolor{bggray}{RGB}{240, 240, 240}
\usemintedstyle{pastie}
\setminted{fontsize=\small,
           %
           bgcolor=bggray,
           %
           frame=lines,
           framesep=2.5mm,
           baselinestretch=1.25}

% Espaçamento entre linhas %
\setstretch{1.25}

% Modificação de alguns comandos %
\let\ds\displaystyle
\allowdisplaybreaks

% Legendas %
\captionsetup{justification=centering, font={small}, labelfont={bf}, labelsep=period}

% Importação de arquivos de texto %
\RecustomVerbatimCommand{\VerbatimInput}{VerbatimInput}{
    fontsize=\footnotesize,
    %
    frame=lines,
    framesep=.5cm,
    framerule=.5mm,
    rulecolor=\maincolor,
    %
    vspace=.5cm
}

% Lista de exercícios %
\newlist{exercise}{enumerate}{3}
\setlist[exercise, 1]{
    label={\Large \hili{Exercício \arabic*.}},
    align=left,
    itemsep=1cm
}
\setlist[exercise, 2]{
    label={\large \hili{\Alph*)}},
    itemsep=.5cm
}
\setlist[exercise, 3]{
    label={\normalsize \hili{\roman*.}},
    itemsep=.5cm
}

% Outros comandos --------------------------------
% Setas
\newcommand{\arrow}{\textcolor{\maincolor}{$\boldsymbol{\rightarrow}$\ }}
\newcommand{\longarrow}{\textcolor{\maincolor}{$\boldsymbol{\longrightarrow}$\ }}
\newcommand{\squigarrow}{\textcolor{\maincolor}{$\boldsymbol{\rightsquigarrow}$\ }}

% Observação
\newcommand{\obs}[1]{{\footnotesize \hili{Obs:} #1}}


\endinput
