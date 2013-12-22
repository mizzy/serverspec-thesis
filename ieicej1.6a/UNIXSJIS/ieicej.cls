%%%
%% ieicej.cls (pLaTeX2e)
%%  for the Transactions of the Institute of Electronics, Information 
%%   and Communication Engineers
%%    by ULS and Company (former name SATO KOBO), 1999-2010. 
%% E-mail: ieice-div@uls.co.jp, teppei@uls.co.jp
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{ieicej}
%%[1999/04/28 v1.0 for Transactions of IEICE]
%%[1999/07/12 v1.0 new release for Transactions of IEICE]
%%[2000/11/02 v1.1 for Transactions of IEICE]
%%[2002/02/12 v1.2 for Transactions of IEICE]
%%[2003/10/31 v1.3 for Transactions of IEICE]
%%[2006/05/08 v1.4 for Transactions of IEICE]
%%[2008/05/13 v1.5 for Transactions of IEICE]
%%[2009/11/03 v1.6 for Transactions of IEICE]
  [2010/04/05 v1.6a for Transactions of IEICE]

\newif\if@paper \@papertrue
\newif\if@electronicsletter \@electronicsletterfalse
\newif\if@letter \@letterfalse
\newif\if@tecrep \@tecrepfalse

\DeclareOption{paper}{%
 \gdef\hd@type{論文}\gdef\tl@type{論\hskip1zw 文}\gdef\@type{P}}
\DeclareOption{invited}{\@papertrue
 \gdef\hd@type{招待論文}\gdef\tl@type{招待論文}\gdef\@type{P}}
\DeclareOption{comment}{\@papertrue
 \gdef\hd@type{解説論文}\gdef\tl@type{解説論文}\gdef\@type{P}}
\DeclareOption{survey}{\@papertrue
 \gdef\hd@type{サーベイ論文}\gdef\tl@type{サーベイ論文}\gdef\@type{P}}
\DeclareOption{letter}{\@lettertrue\@paperfalse
 \gdef\hd@type{レター}\gdef\tl@type{\@typeofletter}\gdef\@type{L}}
\DeclareOption{electronicsletter}{\@electronicslettertrue\@paperfalse
 \gdef\hd@type{レター}\gdef\tl@type{レター}\gdef\@type{LP}}
\DeclareOption{technicalreport}{\@tecreptrue}

\def\tl@type{論\hskip1zw 文}
\def\hd@type{論文}
\def\@type{P}% paper

%\def\ieicejline@warning{\ClassWarning{ieicej}}
\def\ieicej@warning{\ClassWarningNoLine{ieicej}}

\newif\if@usejistfm \@usejistfmfalse
\DeclareOption{usejistfm}{\@usejistfmtrue}

\newif\if@Proof \@Prooffalse
\DeclareOption{Proof}{\@Prooftrue}
\newif\if@cameraready \@camerareadyfalse
\DeclareOption{cameraready}{\@camerareadytrue}

%% for 2.1.4 and non pLaTeX2e compatibility
\@ifundefined{hour}{}{%
 \hour\time \divide\hour by 60\relax
 \@tempcnta\hour \multiply\@tempcnta 60\relax
 \minute\time \advance\minute-\@tempcnta
}

\newif\if@NTT
\@ifundefined{kanjiskip}{\@NTTtrue
 \let\kanjiskip\jintercharskip
 \let\xkanjiskip\jasciikanjiskip
 }{\@NTTfalse\let\jmathkanjiskip\xkanjiskip}
\@ifundefined{iftdir}{\newif\iftdir\tdirfalse}{}
\@ifundefined{burasage}{}{\burasage`，=1\burasage`．=1}

\newdimen\@JQ
 \@JQ=0.7392507pt
\newdimen\@Q
 \@Q=0.71144pt
\newdimen\@EM
 \@EM=.03125em

\newcounter{@paper}
\newcommand{\@ptsize}{}
\newif\if@restonecol
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\if@NTT\else
 \newif\if@enablejfam \@enablejfamtrue
 \newif\if@mathrmmc \@mathrmmcfalse
\fi
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{b5paper}{\setcounter{@paper}{4}%
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1mm}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1mm}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{\z@}%
  \maketombowbox}
\DeclareOption{tate}{\AtBeginDocument{\tate\message{《縦組モード》}}}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
%%\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{%\input{fleqn.clo}
 \ieicej@warning{fleqn is loaded by this class file}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}

\if@NTT\else
 \DeclareOption{disablejfam}{\@enablejfamfalse}
\fi
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\if@tecrep
 \ExecuteOptions{a4paper,twoside,twocolumn,final}
\else
 \ExecuteOptions{b5paper,10pt,twoside,twocolumn,final}
\fi
\ProcessOptions\relax

\if@NTT\else
\if@tecrep
 \if@usejistfm
 \DeclareFontShape{JY1}{mc}{m}{n}{%
     <5> <6> <7> <8> <9> <10> %sgen*min
     <10.95><12><14.4><17.28><20.74><24.88> jis
     <-> jis
     }{}
 \DeclareFontShape{JY1}{mc}{bx}{n}{<->ssub*gt/m/n}{}
 \DeclareFontShape{JY1}{gt}{m}{n}{%
     <5> <6> <7> <8> <9> <10> %sgen*goth
     <10.95><12><14.4><17.28><20.74><24.88> jisg
     <-> jisg
     }{}
 \DeclareFontShape{JY1}{gt}{bx}{n}{<->ssub*gt/m/n}{}
 \fi
\else
\if@usejistfm
\DeclareFontShape{JY1}{mc}{m}{n}{%
  <5>     sfixed * [5.1748] jis %  7Q
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi jis %  8Q or 9Q
  <7>     sfixed * [7.3926] jis % 10Q
  <8>     sfixed * [8.1318] jis % 11Q
  <9>     sfixed * [8.8711] jis % 12Q
  <10>    sfixed * [9.6104] jis % 13Q
  <10.95> sfixed * [11.089] jis % 15Q
  <12>    sfixed * [13.307] jis % 18Q
  <14.4>  sfixed * [14.785] jis % 20Q
  <17.28> sfixed * [17.742] jis % 24Q
  <20.74> sfixed * [20.699] jis % 28Q
  <24.88> sfixed * [23.656] jis % 32Q
  <->                       jis % 
}{}
\DeclareFontShape{JY1}{mc}{bx}{n}{%
  <5>     sfixed * [5.1748] jisg
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi jisg
  <7>     sfixed * [7.3926] jisg
  <8>     sfixed * [8.1318] jisg
  <9>     sfixed * [8.8711] jisg
  <10>    sfixed * [9.6104] jisg
  <10.95> sfixed * [11.089] jisg
  <12>    sfixed * [13.307] jisg
  <14.4>  sfixed * [14.785] jisg
  <17.28> sfixed * [17.742] jisg
  <20.74> sfixed * [20.699] jisg
  <24.88> sfixed * [23.656] jisg
  <->                       jisg
}{}
\DeclareFontShape{JY1}{gt}{m}{n}{%
  <5>     sfixed * [5.1748] jisg
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi jisg
  <7>     sfixed * [7.3926] jisg
  <8>     sfixed * [8.1318] jisg
  <9>     sfixed * [8.8711] jisg
  <10>    sfixed * [9.6104] jisg
  <10.95> sfixed * [11.089] jisg
  <12>    sfixed * [13.307] jisg
  <14.4>  sfixed * [14.785] jisg
  <17.28> sfixed * [17.742] jisg
  <20.74> sfixed * [20.699] jisg
  <24.88> sfixed * [23.656] jisg
  <->                       jisg
}{}
\DeclareFontShape{JY1}{gt}{bx}{n}{%
  <5>     sfixed * [5.1748] jisg
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi jisg
  <7>     sfixed * [7.3926] jisg
  <8>     sfixed * [8.1318] jisg
  <9>     sfixed * [8.8711] jisg
  <10>    sfixed * [9.6104] jisg
  <10.95> sfixed * [11.089] jisg
  <12>    sfixed * [13.307] jisg
  <14.4>  sfixed * [14.785] jisg
  <17.28> sfixed * [17.742] jisg
  <20.74> sfixed * [20.699] jisg
  <24.88> sfixed * [23.656] jisg
  <->                       jisg
}{}
\else
\DeclareFontShape{JY1}{mc}{m}{n}{%
  <5>     sfixed * [5.1748] min5  %  7Q
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi min6  %  8Q or 9Q
  <7>     sfixed * [7.3926] min7  % 10Q
  <8>     sfixed * [8.1318] min8  % 11Q
  <9>     sfixed * [8.8711] min9  % 12Q
  <10>    sfixed * [9.6104] min10 % 13Q
  <10.95> sfixed * [11.089] min10 % 15Q
  <12>    sfixed * [13.307] min10 % 18Q
  <14.4>  sfixed * [14.785] min10 % 20Q
  <17.28> sfixed * [17.742] min10 % 24Q
  <20.74> sfixed * [20.699] min10 % 28Q
  <24.88> sfixed * [23.656] min10 % 32Q
  <->                       min10 % 
}{}
\DeclareFontShape{JY1}{mc}{bx}{n}{%
  <5>     sfixed * [5.1748] goth5
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi goth6
  <7>     sfixed * [7.3926] goth7
  <8>     sfixed * [8.1318] goth8
  <9>     sfixed * [8.8711] goth9
  <10>    sfixed * [9.6104] goth10
  <10.95> sfixed * [11.089] goth10
  <12>    sfixed * [13.307] goth10
  <14.4>  sfixed * [14.785] goth10
  <17.28> sfixed * [17.742] goth10
  <20.74> sfixed * [20.699] goth10
  <24.88> sfixed * [23.656] goth10
  <->                       goth10
}{}
\DeclareFontShape{JY1}{gt}{m}{n}{%
  <5>     sfixed * [5.1748] goth5
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi goth6
  <7>     sfixed * [7.3926] goth7
  <8>     sfixed * [8.1318] goth8
  <9>     sfixed * [8.8711] goth9
  <10>    sfixed * [9.6104] goth10
  <10.95> sfixed * [11.089] goth10
  <12>    sfixed * [13.307] goth10
  <14.4>  sfixed * [14.785] goth10
  <17.28> sfixed * [17.742] goth10
  <20.74> sfixed * [20.699] goth10
  <24.88> sfixed * [23.656] goth10
  <->                       goth10
}{}
\DeclareFontShape{JY1}{gt}{bx}{n}{%
  <5>     sfixed * [5.1748] goth5
  <6>     sfixed * \if@letter [5.9141]\else [6.6533]\fi goth6
  <7>     sfixed * [7.3926] goth7
  <8>     sfixed * [8.1318] goth8
  <9>     sfixed * [8.8711] goth9
  <10>    sfixed * [9.6104] goth10
  <10.95> sfixed * [11.089] goth10
  <12>    sfixed * [13.307] goth10
  <14.4>  sfixed * [14.785] goth10
  <17.28> sfixed * [17.742] goth10
  <20.74> sfixed * [20.699] goth10
  <24.88> sfixed * [23.656] goth10
  <->                       goth10
}{}
\fi
\fi

%% JY1 it
\DeclareFontShape{JY1}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JY1}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JY1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
\DeclareFontShape{JY1}{mc}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%% JT1 it
\DeclareFontShape{JT1}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
\DeclareFontShape{JT1}{mc}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%% sc
\DeclareFontShape{JY1}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{m}{sc}{<->ssub*mc/m/n}{}
%% n
\DeclareFontShape{JY1}{gt}{b}{n}{<->ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gt}{b}{n}{<->ssub*gt/m/n}{}
\fi

%% from /usr/local/teTeX/share/texmf/tex/latex/base/ot1cmr.fd
\DeclareFontShape{OT1}{cmr}{m}{n}%
     {%
      <-6>cmr5%
      <6-7>cmr6%
      <7-8>cmr7%
      <8-9>cmr8%
      <9-10>cmr9%
      <10-12>cmr10%
      <12-17>cmr12%
      <17->cmr17%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sl}%
     {%
      <-9>cmsl8%
      <9-10>cmsl9%
      <10-12>cmsl10%
      <12->cmsl12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{it}%
     {%
      <-8>cmti7%
      <8-9>cmti8%
      <9-10>cmti9%
      <10-12>cmti10%
      <12->cmti12%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{sc}%
     {%
      <->cmcsc10%
      }{}
\DeclareFontShape{OT1}{cmr}{m}{ui}
     {%
      <->cmu10%
      }{}
\DeclareFontShape{OT1}{cmr}{b}{n}
     {%
      <->cmb10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{n}
     {%
      <-6>cmbx5%
      <6-7>cmbx6%
      <7-8>cmbx7%
      <8-9>cmbx8%
      <9-10>cmbx9%
      <10-12>cmbx10%
      <12->cmbx12%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{sl}
     {%
      <->cmbxsl10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{it}
     {%
      <->cmbxti10%
      }{}
\DeclareFontShape{OT1}{cmr}{bx}{ui}
     {%
      <->sub*cmr/m/ui
      }{}

\if@tecrep
 \renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@ixpt{20.5\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 9\p@ \@plus 3\p@ \@minus 4\p@
  \abovedisplayshortskip \z@ \@plus 2.5\p@
  \belowdisplayshortskip 5\p@ \@plus 2\p@ \@minus 2\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
 \normalsize
 \setbox0\hbox{\char\euc"A1A1}% "
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}

 \newcommand{\small}{%
  \@setfontsize\small\@viiipt{18\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus \p@ \@minus \p@
              \parsep 1\p@ \@plus \p@ \@minus \p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

 \newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viipt{16\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 5\p@ \@plus 1.5\p@ \@minus 3\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 2.5\p@ \@plus \p@ \@minus 1.5\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 2\p@ \@plus\p@ \@minus\p@
              \parsep 1\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

 \newcommand{\scriptsize}{\@setfontsize\scriptsize\@vipt\@viiipt}
 \newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
 \newcommand{\large}{\@setfontsize\large\@xpt{22\@Q}}
 \newcommand{\Large}{\@setfontsize\Large\@xipt{27\@Q}}
 \newcommand{\LARGE}{\@setfontsize\LARGE\@xiipt{33\@Q}}
 \newcommand{\huge}{\@setfontsize\huge\@xivpt{25}}
 \newcommand{\Huge}{\@setfontsize\Huge\@xviipt{30}}

 \headheight \z@
 \headsep    \z@
 \topskip    1\Cht
 \footskip   9.5mm
 \maxdepth .5\topskip
 \textwidth 58\Cwd
 \@settopoint\textwidth
 \textheight 49\Cvs
 \advance \textheight \topskip
 \advance \textheight .15mm
 \@settopoint\textheight
\else
 \renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@ixpt{19\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 9\p@ \@plus 3\p@ \@minus 4\p@
  \abovedisplayshortskip \z@ \@plus 2.5\p@
  \belowdisplayshortskip 5\p@ \@plus 2\p@ \@minus 2\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
 \normalsize
 \setbox0\hbox{\char\euc"A1A1}% "
 \setlength\Cht{\ht0}
 \setlength\Cdp{\dp0}
 \setlength\Cwd{\wd0}
 \setlength\Cvs{\baselineskip}
 \setlength\Chs{\wd0}

 \if@letter
  \newcommand{\Small}{\@setfontsize\Small\@viiipt{18\@Q}%
   \kanjiskip\z@ \@plus .1zw \@minus .05zw
  }
 \else
  \newcommand{\Small}{\@setfontsize\Small\@viiipt{16\@Q}%
   \kanjiskip\z@ \@plus .1zw \@minus .05zw
  }
 \fi

 \newcommand{\small}{%
  \@setfontsize\small\@viipt{13\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus \p@ \@minus \p@
              \parsep 1\p@ \@plus \p@ \@minus \p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}
 \newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@vipt{13\@Q}%
  \kanjiskip\z@ \@plus .1zw \@minus .05zw
  \abovedisplayskip 5\p@ \@plus 1.5\p@ \@minus 3\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 2.5\p@ \@plus \p@ \@minus 1.5\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 2\p@ \@plus\p@ \@minus\p@
              \parsep 1\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip}

 %%\newcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@viiipt}
 \let\scriptsize\footnotesize
 \newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
 \newcommand{\large}{\@setfontsize\large\@xpt{19\@Q}}
 \newcommand{\Large}{\@setfontsize\Large\@xipt{27\@Q}}
 \newcommand{\LARGE}{\@setfontsize\LARGE\@xiipt{33\@Q}}
 \newcommand{\huge}{\@setfontsize\huge\@xivpt{25}}
 \newcommand{\Huge}{\@setfontsize\Huge\@xviipt{30}}

 \headheight 12\@Q %% 11H
 \headsep    6.25mm
 \topskip    1\Cht
 \footskip   7.5mm
 \maxdepth .5\topskip
 \textwidth 151.5mm %% 24w x 2 + 30H
 \@settopoint\textwidth
 \textheight 43\Cvs
 \advance \textheight \topskip
 \advance \textheight .35mm %% .4 limit .31mm
 \@settopoint\textheight
\fi

\if@twocolumn
  \setlength\marginparsep{5mm}
\else
  \setlength\marginparsep{5mm}
\fi
\setlength\marginparpush{5pt}

\iftombow
% \hoffset\z@
% \voffset\z@
 \topmargin\paperheight
 \advance \topmargin -\textheight
 \advance \topmargin -\headheight
 \advance \topmargin -\headsep
 \advance \topmargin -\footskip
 \divide \topmargin \tw@
 \advance \topmargin -1.25mm
 \advance \topmargin -1in
 \@settopoint\topmargin
 \oddsidemargin\paperwidth
 \advance \oddsidemargin -\textwidth
 \divide \oddsidemargin \tw@
 \advance \oddsidemargin -1in
 \@settopoint\oddsidemargin
 \evensidemargin\oddsidemargin
 \@settopoint\evensidemargin
\else
 \topmargin \z@
 \@settopoint\topmargin
 \oddsidemargin\z@
 \@settopoint\oddsidemargin
 \evensidemargin\z@
 \@settopoint\evensidemargin
\fi

\marginparwidth 20mm
\@settopoint\marginparwidth

\if@tecrep
 \setlength\footnotesep{2.8mm}
\else
 \setlength\footnotesep{2.275mm}
\fi
\setlength{\skip\footins}{1\Cvs plus .9\Cvs \@minus .3\Cvs}
\setlength\intextsep   {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\floatsep    {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\dblfloatsep {1\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\textfloatsep{1.5\Cvs \@plus .75\Cvs \@minus .25\Cvs}
\setlength\dbltextfloatsep{1.5\Cvs \@plus .75\Cvs \@minus .25\Cvs}

\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}

\def\@listi{\leftmargin\leftmargini
  \parsep  4\p@ \@plus2\p@ \@minus\p@
  \topsep  8\p@ \@plus2\p@ \@minus4\p@
  \itemsep 4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep\z@ \@plus\p@ \@minus\p@
   \parsep\z@ \@plus\p@ \@minus\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep\z@ \@plus\p@ \@minus\p@
   \parsep\z@
   \partopsep\z@ \@plus\z@ \@minus\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}

\if@tecrep
 \columnsep 2zw
\else
 \columnsep 30\@Q
\fi
\columnseprule 0\p@
\lineskip 2\p@ 
\normallineskip 2\p@
\renewcommand{\baselinestretch}{}
\parskip\z@    %% 0\p@ \@plus \p@
\parindent 1zw %% 1\Cwd

\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{6}
\setcounter{bottomnumber}{5}
\setcounter{totalnumber}{11}
\setcounter{dbltopnumber}{5}
\renewcommand{\topfraction}{.95}
\renewcommand{\bottomfraction}{.95}
\renewcommand{\textfraction}{.05}
\renewcommand{\floatpagefraction}{.05}
\renewcommand{\dbltopfraction}{.95}
\renewcommand{\dblfloatpagefraction}{.05}

\if@Proof
 \def\@Rtop{\rlap{\smash{\rule[-\headsep]{0.05mm}{10mm}%
  \rule[-\headsep]{10mm}{0.05mm}}}}
 \def\@Ltop{\llap{\smash{\rule[-\headsep]{10mm}{0.05mm}%
  \rule[-\headsep]{0.05mm}{10mm}}}}
 \def\@Rbot{\rlap{\smash{\raisebox{1\footskip}
  {\rule[-10mm]{0.05mm}{10mm}\rule{10mm}{0.05mm}}}}}
 \def\@Lbot{\llap{\smash{\raisebox{1\footskip}
  {\rule{10mm}{0.05mm}\rule[-10mm]{0.05mm}{10mm}}}}}
\else
 \let\@Rtop\relax\let\@Ltop\relax\let\@Rbot\relax\let\@Lbot\relax
\fi

\def\field#1{%
 \if@tecrep\else
  \def\@tempa{#1}%
  \def\f@A{A}\def\f@B{B}\def\f@C{C}\def\f@D{D}%
  \def\f@DI{DI}\def\f@DII{DII}%
  \ifx \@tempa\f@A \gdef\@field{A}\else
   \ifx \@tempa\f@B \gdef\@field{B}\else
    \ifx \@tempa\f@C \gdef\@field{C}\else
     \ifx \@tempa\f@D \gdef\@field{D}\else
      \ifx \@tempa\f@DI \gdef\@field{D--{\rmfamily\bfseries I}}\else
       \ifx \@tempa\f@DII \gdef\@field{D--{\rmfamily\bfseries II}}\else
        \gdef\@field{X}%
  \fi\fi\fi\fi\fi\fi
 \fi
}

\def\vol#1{% Vol.J86 = Year 2003
 \def\@tempa{#1}%
 \ifx\@tempa\empty
  \gdef\@vol{Jxx--\@field}\gdef\ft@year{xxxx}\gdef\hd@year{xxxx}%
 \else
  \def\@tempa{x}%
  \if\@tempa #1\relax
   \gdef\@vol{Jxx--\@field}%
   \gdef\ft@year{xxxx}%
   \gdef\hd@year{xxxx}%
  \else
   \gdef\@vol{J#1--\@field}%
   \@tempcnta=#1\relax
   \advance \@tempcnta 1917\relax
   \xdef\ft@year{\the\@tempcnta}%
   \xdef\hd@year{\the\@tempcnta}%
  \fi
 \fi
}

\def\no#1{%
 \def\@tempa{#1}%
 \ifx\@tempa\empty \gdef\@no{xx}\else \gdef\@no{#1}\fi
}

\def\@field{}
\def\@vol{}
\def\hd@year{}
\def\ft@year{}
\def\@no{}

\def\typeofletter#1{\gdef\@typeofletter{#1}}
\def\@typeofletter{}
\def\Sissue#1{\gdef\@Sissue{#1}}
\def\@Sissue{}

\if@letter\typeofletter{研究速報}\fi
\field{X}
\no{xx}
\vol{x}

\let\head@font\relax
\DeclareFixedFont{\KFfoot}{JY1}{gt}{m}{n}{10\@JQ}
\def\foot@font{\Small\sffamily\KFfoot}
\def\nombre@font{\Small\sffamily}
%% P (paper)
\def\t@typefont@P{%
 \Huge\baselineskip\z@ %% 24\@JQ
}
%% LP (electronicsletter)
\def\t@typefont@LP{%
 \LARGE\baselineskip\z@ %% 18\@JQ
}
%% L (letter)
\let\t@typefont@L\huge
\def\head@type#1{%% 20\@JQ 平2
 \if@cameraready
  \@ifundefined{PSTricksLoaded}{\scalebox{1}[0.8]{\t@typefont@L #1}}
   {\def\tmp@scalebox##1{\pst@makebox{\@scalebox{##1}}}%
    \ifx\tmp@scalebox\scalebox
     \scalebox{1 0.8}{\t@typefont@L #1}%
    \else
     \scalebox{1}[0.8]{\t@typefont@L #1}%
    \fi
   }%
 \else
  {\t@typefont@L #1}%
 \fi
}

\if@cameraready
 \def\hd@typeofletter{%
  \def\@tempx{ショートノート}%
  \ifx\@typeofletter\@tempx
   シ\kern-.25zw ョ\kern-.25zw ー\kern-.25zw ト\kern-.35zw 
   ノ\kern-.25zw ー\kern-.25zw ト%
  \else
   {\kanjiskip=-.075zw \@typeofletter}\hskip1mm
  \fi
 }
\else
 \def\hd@typeofletter{\@typeofletter}
\fi

\def\ps@ieicej{\let\@mkboth\@gobbletwo
 \if@letter
  \def\hrulefill{\leaders\hrule height-1.35mm depth1.85mm\hfil}%
  \def\@oddhead{\@Ltop
   \smash{\hbox to \textwidth{%
    \raisebox{-3mm}{\head@type{\hd@typeofletter}}\hrulefill
      \llap{\normalsize\bfseries\mathversion{bold}\@Sissue}}}%
   \@Rtop}%
  \def\@evenhead{\@Ltop
   \rlap{\smash{\hbox to \textwidth{%
    \raisebox{-3mm}{\head@type{\hd@typeofletter}}\hrulefill
   }}}\hfil
   \ifx\@Sissue\empty
    {\Small\head@font 電子情報通信学会論文誌\ \hd@year 
     /\@no\ Vol.\ \@vol\ No.\,\@no}%
   \else
    {\normalsize\bfseries\mathversion{bold}\@Sissue}%
   \fi
   \@Rtop}%
 \else
  \def\hrulefill{\leaders\hrule height-1.5mm depth1.75mm\hfil}%
  \if@electronicsletter
   \def\@oddhead{\@Ltop
    \smash{\hbox to \textwidth{%
     \raisebox{-3mm}{\csname t@typefont@\@type\endcsname\tl@type}\hrulefill
      \llap{\normalsize\bfseries\mathversion{bold}\@Sissue}}}%
   \@Rtop}%
  \else
   \def\@oddhead{\@Ltop
    \smash{\hbox to \textwidth{%
     \rule[-1.75mm]{14mm}{0.25mm}%
     \raisebox{-3mm}{\csname t@typefont@\@type\endcsname\tl@type}\hrulefill
      \llap{\normalsize\bfseries\mathversion{bold}\@Sissue}}}%
   \@Rtop}%
  \fi
  \let\@evenhead\@oddhead
 \fi
 \def\@oddfoot{\@Lbot\hfil
  {\foot@font 電子情報通信学会論文誌\hskip1zw
    \@field\hskip1zw Vol.\ \@vol\hskip1zw No.\,\@no\hskip1zw
   pp.\,\thepage --\pageref{ieicej@lastpage}\hskip1zw
   %%\ft@year 年\@no 月
   {\normalfont\copyright}（社）電子情報通信学会\ft@year
  }\hfil
    \llap{{\nombre@font\thepage\hskip3mm}}%
  \@Rbot}%
 \def\@evenfoot{\@Lbot
  \rlap{\hskip3mm{\nombre@font\thepage}}\hfil
   {\foot@font 電子情報通信学会論文誌\hskip1zw
    \@field\hskip1zw Vol.\ \@vol\hskip1zw
    No.\,\@no\hskip1zw pp.\,\thepage --\pageref{ieicej@lastpage}\hskip1zw 
    %%\ft@year 年\@no 月
    {\normalfont\copyright}（社）電子情報通信学会\ft@year
   }\hfil
  \@Rbot}%
}

\def\ps@IEICEJ{\let\@mkboth\@gobbletwo
 \def\@oddfoot{\@Lbot\hfil
  {\nombre@font \thepage}\hskip3mm
  \@Rbot}%
 \def\@evenfoot{\@Lbot
  \hskip3mm{\nombre@font \thepage}\hfil
  \@Rbot}
 \def\@oddhead{\@Ltop
  \rlap{\hbox to \textwidth{\smash{\rule[-1.75mm]{\textwidth}{0.25mm}}}}%
  \odd@header\hfil
  \@Rtop}%
 \def\@evenhead{\@Ltop
  \rlap{\hbox to \textwidth{\smash{\rule[-1.75mm]{\textwidth}{0.25mm}}}}\hfil
   {\Small\head@font 電子情報通信学会論文誌\ 
    \hd@year /\@no\ Vol.\ {\let\bfseries\relax \@vol}\ No.\,\@no}%
  \@Rtop}%
}

\def\odd@header{%
 \if@letter
  {\Small\head@font レ\hskip1zw タ\hskip1zw ー}%
 \else
  \if@electronicsletter
   {\Small\head@font レ\hskip1zw タ\hskip1zw ー}%
  \else
   \setbox\@tempboxb\hbox{\Small\head@font\def\\{\unskip\ignorespaces}%
   \hd@type ／\kern\z@\hd@title}%
    \ifdim \wd\@tempboxb > \textwidth
     \ieicej@warning{header is too long. make it shorter. 
      ^^J\@spaces For example, \string\title[header title]{title}}%
    \fi
   \box\@tempboxb
  \fi
 \fi
}

\def\ps@empty{%
 \def\@oddhead{\@Ltop\hfil\@Rtop}%
 \let\@evenhead\@oddhead
 \def\@oddfoot{\@Lbot\hfil\@Rbot}%
 \let\@evenfoot\@oddfoot
 \let\@mkboth\@gobbletwo
}

\if@tecrep
 \def\ps@plain{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plain
   \def\@oddhead{\@Ltop\hfil\@Rtop}%
   \def\@oddfoot{\@Lbot\reset@font\hfil ---\ \thepage\ ---\@Rbot}% \hfil
   \let\@evenhead\@oddhead
   \let\@evenfoot\@oddfoot}
\fi

\def\jtitle{\@ifnextchar[% ]
 {\d@jtitle}{\s@jtitle}}
\def\d@jtitle[#1]#2{\gdef\hd@title{#1}\gdef\@jtitle{#2}}
\def\s@jtitle#1{\gdef\hd@title{#1}\gdef\@jtitle{#1}}
\def\@jtitle{}
\def\hd@title{}

\def\etitle#1{\gdef\@etitle{#1}}
\def\@etitle{}

\def\@fnsymbol#1{\ifcase#1 \or % \ensuremath{
 \dagger\or
 {\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}\or
 {\dagger}{\dagger}{\dagger}{\dagger}{\dagger}{\dagger}%
  {\dagger}{\dagger}{\dagger}\or
 *\or {*}{*}\or {*}{*}{*}\or {*}{*}{*}{*}\or 
  {*}{*}{*}{*}{*}\or {*}{*}{*}{*}{*}{*}\or %% ((((((((((((((((((((
 a)\or b)\or c)\or d)\or e)\or f)\or g)\or h)\or i)\or j)\or
 k)\or l)\or m)\or n)\or o)\or p)\or q)\or r)\or s)\or t)\else
  \@ctrerr\fi}% }
%% mathTimePlus redefines \@fnsymbol. 
\let\ieicej@fnsymbol\@fnsymbol

\newtoks\@authorlist
\newcount\@authorcnt
\newcount\@alcnt
\newcount\p@alcnt
 \p@alcnt=9\relax
\newcount\@totalnumber
\newdimen\authornamesep
 \authornamesep\z@
%% \authornamesep1zw

\def\authorlist#1{%
 \if@paper
  \@authorlist={#1}\the\@authorlist
 \else
  \let\authorentry\Lauthorentry
  \@authorlist={#1}\@chkmbrship
 \fi
}

\def\Lauthorentry{\@ifnextchar[%% ]
 {\TRL@ae}{\NL@ae}}

\def\NL@ae#1#2#3#4{\@ifnextchar[% ]
 {\L@aeP{#1}{#2}{#3}{#4}}%
 {\L@ae{#1}{#2}{#3}{#4}}}

\def\TRL@ae[#1]#2#3#4#5{\@ifnextchar[% ]
 {\TRL@aeP[#1]{#2}{#3}{#4}{#5}}%
 {\TRL@aeNP[#1]{#2}{#3}{#4}{#5}}}

\def\L@ae#1#2#3#4{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \get@al{#4}%
 \def\al@none{0}%
 \expandafter\protected@xdef
  \csname @jauthormembership\number\@authorcnt\endcsname{%
   \csname #3J@member\endcsname}%
 \fmt@Jan{#1}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\plural@affi
   \csname @jauthormembership\number\@authorcnt\endcsname}%
 \fmt@Ean{#2}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi}%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt\endcsname{%
   \csname #3@member\endcsname}%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt*\endcsname{%
   \csname #3@members\endcsname}%
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
}

\def\L@aeP#1#2#3#4[#5]{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \get@al{#4}%
 \def\al@none{0}%
 \@tempcnta\z@
 \get@p@al{#5}%
 \expandafter\protected@xdef
  \csname @jauthormembership\number\@authorcnt\endcsname{%
   \csname #3J@member\endcsname}%
 \fmt@Jan{#1}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\plural@affi\plural@p@affi
   \csname @jauthormembership\number\@authorcnt\endcsname
 }%
 \fmt@Ean{#2}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi\nobreak\plural@p@affi
 }%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt\endcsname{%
   \csname #3@member\endcsname}%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt*\endcsname{%
   \csname #3@members\endcsname}%
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
 \def\plural@p@affi{}%
}

\def\TRL@aeNP[#1]#2#3#4#5{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \GetEma{#1}%
 \get@al{#5}%
 \def\al@none{0}%
 \expandafter\protected@xdef
  \csname @jauthormembership\number\@authorcnt\endcsname{%
   \csname #4J@member\endcsname}%
 \fmt@Jan{#2}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\plural@affi\email@affi
   \csname @jauthormembership\number\@authorcnt\endcsname}%
 \fmt@Ean{#3}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi\email@affi}%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt\endcsname{%
   \csname #4@member\endcsname}%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt*\endcsname{%
   \csname #4@members\endcsname}%
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
}

\def\TRL@aeP[#1]#2#3#4#5[#6]{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \GetEma{#1}%
 \get@al{#5}%
 \def\al@none{0}%
 \@tempcnta\z@
 \get@p@al{#6}%
 \expandafter\protected@xdef
  \csname @jauthormembership\number\@authorcnt\endcsname{%
   \csname #4J@member\endcsname}%
 \fmt@Jan{#2}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\plural@affi\plural@p@affi\email@affi
   \csname @jauthormembership\number\@authorcnt\endcsname
 }%
 \fmt@Ean{#3}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi\nobreak\plural@p@affi\nobreak\email@affi
 }%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt\endcsname{%
   \csname #4@member\endcsname}%
 \expandafter\protected@xdef
  \csname @authormembership\number\@authorcnt*\endcsname{%
   \csname #4@members\endcsname}%
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
 \def\plural@p@affi{}%
}

\def\rJ@member{\hskip-.25zw （正員）}
\def\mJ@member{\hskip-.25zw （正員）}
\def\aJ@member{\hskip-.25zw （准員）}
%%\def\nJ@member{（非会員）}
\def\nJ@member{}
\def\sJ@member{\hskip-.25zw （学生員）}
\def\hJ@member{\hskip-.25zw （名誉員）}
\def\fJ@member{\hskip-.25zw （正員：フェロー）}
\def\eJ@member{\hskip-.25zw （正員：シニア会員）}

\def\authorentry{\@ifnextchar[% ]
 {\TR@ae}{\N@ae}}

\def\N@ae#1#2#3{\@ifnextchar[% ]
 {\@aeP{#1}{#2}{#3}}%
 {\@ae{#1}{#2}{#3}}}

\def\TR@ae[#1]#2#3#4{\@ifnextchar[% ]
 {\TR@aeP[#1]{#2}{#3}{#4}}%
 {\TR@aeNP[#1]{#2}{#3}{#4}}}

\def\fmt@Jan#1{%
 \setbox\@tempboxb\hbox{\spaceskip=100mm #1}%
 \ifdim \wd\@tempboxb < 100mm
  \ieicej@warning{Author's name "#1" doesn't have a space}%
  \def\@tempname{#1}%
  \def\@tempb##1\@nil{##1}%
  \protected@edef\@authorname{\expandafter\@tempb\@tempname \@nil}%
 \else
  \setbox\@tempboxb\hbox{#1}%
  \ifdim \wd\@tempboxb > 5zw
   \def\@tempb##1 ##2\@nil{##1\hskip\authornamesep ##2}%
  \else
   \def\@tempb##1 ##2\@nil{\leavevmode\hbox to 5zw{##1\hfil ##2}}%
  \fi
   \def\@tempname{#1}%
   \protected@edef\@authorname{\expandafter\@tempb\@tempname \@nil}%
 \fi
}

\def\fmt@Ean#1{%
 \@temptokena{#1}%
 \setbox\@tempboxa\hbox{\spaceskip=100mm #1}%
 \ifdim \wd\@tempboxa < 100mm
  \ieicej@warning{a space should be added between 1st and 2nd name: "#1"}%
 \else
  \def\name@form##1 ##2\@nil{\gdef\@tempan{##1 \uppercase{##2}}}%
  \expandafter\name@form\the\@temptokena\@nil
  \expandafter\@temptokena\expandafter{\@tempan}%
 \fi
 \def\@authorname{\the\@temptokena}%
}

\newif\if@affinone \@affinonefalse
\def\get@al#1{%
 \def\@noaffi{none}\def\@tempaffi{#1}%
 \ifx\@noaffi\@tempaffi
  \global\@affinonetrue
 \else
  \@for\get@label:=#1\do{%
   \@ifundefined{al@\get@label}%
    {%
     \global\advance \@alcnt \@ne
     \expandafter\xdef\csname al@\get@label\endcsname{\the\@alcnt}%
     \global\advance \@tempcnta \@ne
     \protected@xdef\plural@affi{\plural@affi
      \ifnum\@tempcnta=\@ne
       $^{\ieicej@fnsymbol{\csname al@\get@label\endcsname}}$%
      \else
       $^{,\ieicej@fnsymbol{\csname al@\get@label\endcsname}}$%
      \fi
     }%
    }%
    {%
     \global\advance \@tempcnta \@ne
     \protected@xdef\plural@affi{\plural@affi
      \ifnum\@tempcnta=\@ne
       $^{\ieicej@fnsymbol{\csname al@\get@label\endcsname}}$%
      \else
       $^{,\ieicej@fnsymbol{\csname al@\get@label\endcsname}}$%
      \fi
     }%
    }%
  }%
 \fi
}
\def\plural@affi{}

\def\get@p@al#1{%
 \@for\get@label:=#1\do{%
  \@ifundefined{p@al@\get@label}%
   {%
    \global\advance \p@alcnt \@ne
    \expandafter\xdef\csname p@al@\get@label\endcsname{\the\p@alcnt}%
    \global\advance \@tempcnta \@ne
    \protected@xdef\plural@p@affi{\plural@p@affi
     \ifnum\@tempcnta=\@ne
      $^{\ieicej@fnsymbol{\csname p@al@\get@label\endcsname}}$%
     \else
      $^{,\ieicej@fnsymbol{\csname p@al@\get@label\endcsname}}$%
     \fi
    }%
   }%
   {%
    \global\advance \@tempcnta \@ne
    \protected@xdef\plural@p@affi{\plural@p@affi
     \ifnum\@tempcnta=\@ne
      $^{\ieicej@fnsymbol{\csname p@al@\get@label\endcsname}}$%
     \else
      $^{,\ieicej@fnsymbol{\csname p@al@\get@label\endcsname}}$%
     \fi
    }%
   }%
 }%
}
\def\plural@p@affi{}

\def\@ae#1#2#3{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \get@al{#3}%
 \def\al@none{0}%
 \fmt@Jan{#1}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\rlap{\plural@affi}}%
 \fmt@Ean{#2}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi}% 
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
}

\def\@aeP#1#2#3[#4]{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \get@al{#3}%
 \def\al@none{0}%
 \@tempcnta\z@
 \get@p@al{#4}%
 \fmt@Jan{#1}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\rlap{\plural@affi\plural@p@affi}%
 }%
 \fmt@Ean{#2}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi\nobreak\plural@p@affi
 }%
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
 \def\plural@p@affi{}%
}

\if@tecrep\else
 \if@letter
  \font\EA@font=cmr5
 \else
  \if@electronicsletter
   \font\EA@font=cmr6
  \else
   \font\EA@font=cmr7
  \fi
 \fi
\fi

\def\email@affi{%
 \if@tecrep\else
  \ifx\@tempEma\empty\else
   $^{\mbox{\EA@font\ieicej@fnsymbol{\the\c@enumiv}}}$%
  \fi
 \fi
}

\def\TR@aeNP[#1]#2#3#4{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \GetEma{#1}
 \get@al{#4}%
 \def\al@none{0}%
 \fmt@Jan{#2}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\rlap{\plural@affi\email@affi}%
 }%
 \fmt@Ean{#3}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi\nobreak\email@affi
 }% 
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
}

\def\TR@aeP[#1]#2#3#4[#5]{%
 \@tempcnta\z@
 \advance \@authorcnt \@ne
 \GetEma{#1}%
 \get@al{#4}%
 \def\al@none{0}%
 \@tempcnta\z@
 \get@p@al{#5}%
 \fmt@Jan{#2}%
 \expandafter\protected@xdef\csname @Jauthorname\number\@authorcnt\endcsname{%
  \@authorname\kern\z@\rlap{\plural@affi\plural@p@affi\email@affi}%
 }%
 \fmt@Ean{#3}%
 \expandafter\protected@xdef\csname @Eauthorname\number\@authorcnt\endcsname{%
  \@authorname\nobreak\plural@affi\nobreak\plural@p@affi\nobreak\email@affi
 }%
 \global\@totalnumber=\@authorcnt
 \def\plural@affi{}%
 \def\plural@p@affi{}%
}

\if@tecrep
 \bgroup
  \catcode`@=12\relax
  \gdef\GetEma#1{%
   \def\tempema{#1}%
   \ifx\tempema\empty
    \def\tempAnDn{n n.n.n}%
   \else
    \def\tempa##1@##2\nil{##1 ##2}% 
    \edef\tempAnDn{\expandafter\tempa\tempema\nil}%
   \fi
   \ProcessEma
  }%
 \egroup

 \newcount\tn@dn

 \def\ProcessEma{%
  \def\tempa##1 ##2\@nil{%
   \@ifundefined{##2}
    {\expandafter\gdef\csname ##2\endcsname{##1}%
     \advance\tn@dn\@ne
     \expandafter\def\csname adrs\number\tn@dn\endcsname{##2}%
    }%
    {\expandafter\protected@xdef
     \csname ##2\endcsname{\csname ##2\endcsname,##1}%
    }%
  }% 
  \def\get@AnDn{\expandafter\tempa\tempAnDn\@nil}\get@AnDn
 }

 \def\fmt@Ema{%
  \@tempcntb\z@
  \loop
   \ifnum\@tempcntb<\tn@dn
    \advance\@tempcntb\@ne
    \def\ad@none{n.n.n}%
    \expandafter\ifx\csname adrs\number\@tempcntb\endcsname \ad@none
    \else
     \protected@edef\tmp@An{%
      \expandafter\csname \csname adrs\number\@tempcntb\endcsname \endcsname}%
     \@tempcnta\z@
     \@for\get@An:=\tmp@An\do{%
      \global\advance \@tempcnta \@ne
     }%
     \protected@xdef\Mail@ddress{%
      \ifx\Mail@ddress\empty\else\Mail@ddress,\ \fi
       \ifnum\@totalnumber=\@ne
        \if@affinone\else
         $\ieicej@fnsymbol{\the\@tempcntb}$%
        \fi
       \else
        $\ieicej@fnsymbol{\the\@tempcntb}$%
       \fi
       \ifnum\@tempcnta=\@ne
	\expandafter\csname \csname adrs\number\@tempcntb\endcsname \endcsname
	 @\csname adrs\number\@tempcntb\endcsname
       \else
	\{%% \protect
	 \expandafter\csname \csname adrs\number\@tempcntb\endcsname \endcsname
	  \}%
	 @\csname adrs\number\@tempcntb\endcsname
       \fi
     }%
     \gdef\header@ma{E-mail:}%
    \fi
  \repeat
 }
 \def\Mail@ddress{}
 \def\header@ma{}

 \def\MailAddress#1{\gdef\@MailAddress{#1}}
 \def\@MailAddress{}
\else
 \setcounter{enumiv}{15}%
 \def\GetEma#1{%
  \def\@tempEma{#1}%
  \ifx\@tempEma\empty\else
   \global\advance \c@enumiv \@ne
   \let\@fnsymbol\ieicej@fnsymbol
   \protected@xdef\@Emadrs{\@Emadrs
    %\protect\footnotetext[\the\c@enumiv]{E-mail: \protect\texttt{#1}}%
    \protect\footnotetext[\the\c@enumiv]{E-mail: #1}%
   }%
  \fi
 }%
 \def\@Emadrs{}
\fi

\newcount\@spcnt
\newcount\alignorder
\if@letter
 \alignorder=2\relax
\else
 \if@paper
  \alignorder=4\relax
 \else
  \alignorder=3\relax
%%\alignorder=4\relax
 \fi
\fi

\if@tecrep
 \alignorder=5\relax
\fi

\def\fmt@Jauthorlist{%
 \@tempcnta=\alignorder
 \@tempcntb=\alignorder\advance \@tempcntb \@ne
  \ifnum \@totalnumber < \@tempcntb
   \expandafter\def\csname sp\number\alignorder\endcsname{\relax}%
  \else
   \advance \@tempcntb \alignorder
   \ifnum \@totalnumber < \@tempcntb
    \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
     \advance \@tempcnta \alignorder
    \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
   \else
    \advance \@tempcntb \alignorder
    \ifnum \@totalnumber < \@tempcntb
     \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
      \advance \@tempcnta \alignorder
     \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
      \advance \@tempcnta \alignorder
     \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
    \else
     \advance \@tempcntb \alignorder
     \ifnum \@totalnumber < \@tempcntb
      \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	\advance \@tempcnta \alignorder
      \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	\advance \@tempcnta \alignorder
      \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	\advance \@tempcnta \alignorder
      \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
     \else
      \advance \@tempcntb \alignorder
      \ifnum \@totalnumber < \@tempcntb
	\expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	 \advance \@tempcnta \alignorder
	\expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
      \else
	\advance \@tempcntb \alignorder
	\ifnum \@totalnumber < \@tempcntb
	 \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\relax}%
	\else
	 \advance \@tempcntb \alignorder
	 \expandafter\def\csname sp\number\alignorder\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	  \advance \@tempcnta \alignorder
	 \expandafter\def\csname sp\number\@tempcnta\endcsname{\cr}%
	\fi
      \fi
     \fi
    \fi
   \fi
  \fi
}

\if@tecrep
 \def\@outputJauthorlist{%
  \fmt@Jauthorlist
  \@authorcnt\z@
   \loop\ifnum \@authorcnt < \@totalnumber
    \advance \@authorcnt \@ne
    \advance \@spcnt \@ne
    \@ifundefined{sp\number\@spcnt}%
     {\expandafter\def\csname sp\number\@spcnt\endcsname{\hskip\Pauthorsep}}{}%
    \let\cr\@par
    \protected@xdef\@tempx{\@tempx
     \mbox{\csname @Jauthorname\number\@authorcnt\endcsname}%
      \csname sp\number\@spcnt\endcsname}%
   \repeat
  \@tempx
 }
\else
 \def\@outputJauthorlist{%
  \fmt@Jauthorlist
  \@authorcnt\z@
   \loop\ifnum \@authorcnt < \@totalnumber
    \advance \@authorcnt \@ne
    \advance \@spcnt \@ne
    \@ifundefined{sp\number\@spcnt}%
     {\expandafter\def\csname sp\number\@spcnt\endcsname{&}}{}%
    \protected@xdef\@tempx{\@tempx
     \csname @Jauthorname\number\@authorcnt\endcsname
     \csname sp\number\@spcnt\endcsname}%
   \repeat
  \@tempx
 }
\fi

\def\@tempx{}

\def\breakauthorline#1{%
 \@for\@breakauthor:=#1\do{%
  \expandafter\gdef\csname @breakauthorline\@breakauthor\endcsname{\\}
 }%
  \@authorcnt\z@
  \loop\ifnum \@authorcnt < \@totalnumber
   \advance \@authorcnt \@ne
    \@ifundefined{@breakauthorline\number\@authorcnt}%
    {\expandafter\gdef\csname @breakauthorline\number\@authorcnt\endcsname
     {\relax}}{\relax}%
  \repeat
}

\newcount\totalnumberm@ne

\def\L@outputEauthorlist{%
 \def\r@member{{\itshape Member}}%
 \def\r@members{{\itshape Members}}%
 \def\m@member{{\itshape Member}}%
 \def\m@members{{\itshape Members}}%
 \def\n@member{{\itshape  Nonmember}}%
 \def\n@members{{\itshape Nonmembers}}%
 \def\a@member{{\itshape  Affiliate Member}}%
 \def\a@members{{\itshape Affiliate Members}}%
 \def\h@member{{\itshape  Fellow, Honorary Member}}%
 \def\h@members{{\itshape Fellows, Honorary Members}}%
 \def\s@member{{\itshape  Student Member}}%
 \def\s@members{{\itshape Student Members}}%
 \def\f@member{{\itshape Fellow}}%
 \def\f@members{{\itshape Fellows}}%
 \def\e@member{{\itshape Senior Member}}%
 \def\e@members{{\itshape Senior Members}}%
 \def\no@authormembership{\relax}%
 \@authorcnt\z@
 \totalnumberm@ne\@totalnumber \advance \totalnumberm@ne -\@ne
  \loop\ifnum \@authorcnt < \@totalnumber
   \advance \@authorcnt \@ne
    \ifnum \@authorcnt < \totalnumberm@ne
     \mbox{\csname @Eauthorname\number\@authorcnt\endcsname
      \expandafter\ifx \csname @authormembership\number\@authorcnt\endcsname
       \no@authormembership
      \else
       \nobreak, 
      \fi
     \nobreak\csname @authormembership\number\@authorcnt\endcsname}\nobreak, 
      \csname @breakauthorline\number\@authorcnt\endcsname
    \else
     \ifnum \@authorcnt = \@totalnumber
      \mbox{\csname @Eauthorname\number\@authorcnt\endcsname
       \expandafter\ifx \csname @authormembership\number\@authorcnt\endcsname
        \no@authormembership
       \else
        \nobreak, 
       \fi
      \nobreak\csname @authormembership\number\@authorcnt\endcsname}%
        \csname @breakauthorline\number\@authorcnt\endcsname
     \else
      \mbox{\csname @Eauthorname\number\@authorcnt\endcsname
       \expandafter\ifx \csname @authormembership\number\@authorcnt\endcsname
        \no@authormembership
       \else
        \nobreak, 
       \fi
      \nobreak\csname @authormembership\number\@authorcnt\endcsname
       \ifnum \@totalnumber=\tw@\ \else , \fi}%
        \csname @breakauthorline\number\@authorcnt\endcsname\allowbreak
         and\ 
     \fi
    \fi
  \repeat
}

\def\@outputEauthorlist{%
 \@authorcnt\z@
 \totalnumberm@ne\@totalnumber \advance \totalnumberm@ne -\@ne
  \loop\ifnum \@authorcnt < \@totalnumber
   \advance \@authorcnt \@ne 
    \ifnum \@authorcnt < \totalnumberm@ne
     \csname @Eauthorname\number\@authorcnt\endcsname\nobreak , 
      \csname @breakauthorline\number\@authorcnt\endcsname
    \else
     \ifnum \@authorcnt = \@totalnumber
      \csname @Eauthorname\number\@authorcnt\endcsname
     \else
      \csname @Eauthorname\number\@authorcnt\endcsname\nobreak
       \ifnum \@totalnumber=\tw@\ \else , \fi
        \csname @breakauthorline\number\@authorcnt\endcsname
      and\ \nobreak 
     \fi
    \fi
  \repeat
}

\newif\if@plural
\newcount\@authorcntp@ne

%% letter and letter paper
\def\@chkmbrship{%
 \the\@authorlist
 \@authorcnt \z@
 \@pluralfalse
 \loop\ifnum \@authorcnt < \@totalnumber
  \advance \@authorcnt \@ne
  \@authorcntp@ne=\@authorcnt \advance \@authorcntp@ne \@ne
   \if@plural
    \edef\@nextmembership{%
     \csname @authormembership\number\@authorcntp@ne*\endcsname}%
   \else
    \edef\@nextmembership{%
     \csname @authormembership\number\@authorcntp@ne\endcsname}%
   \fi
  \expandafter\ifx\csname @authormembership\number\@authorcnt\endcsname
   \@nextmembership
    \expandafter\gdef\csname @authormembership\number\@authorcnt\endcsname
     {\relax}%
    \edef\tempauthormembership
     {\csname @authormembership\number\@authorcntp@ne*\endcsname}%
    \expandafter\let
     \csname @authormembership\number\@authorcntp@ne\endcsname
      \tempauthormembership \@pluraltrue
  \else \@pluralfalse
  \fi
 \repeat
}

\newcount\chk@alcnt
\newcount\chk@p@alcnt

\if@tecrep %%%
 \def\affiliate[#1]#2#3{%
  \advance \chk@alcnt \@ne
  \@ifundefined{al@#1}%
   {\expandafter\def\csname al@#1\endcsname{1}%
    \ieicej@warning{Check the "#1" label, it does not correspond to
      ^^J\space\space any labels in \string\authorentry\space command}%
   }{}%
  \protected@xdef\J@affiliate{\J@affiliate
   $\protect\ieicej@fnsymbol{\csname al@#1\endcsname}$\ #2\\}%
  \protected@xdef\E@affiliate{\E@affiliate
   $\protect\ieicej@fnsymbol{\csname al@#1\endcsname}$\ #3\\}%
 }
 \def\J@affiliate{}
 \def\E@affiliate{}

 %% 引数を3つに変更
 \def\paffiliate[#1]#2#3{%
  \advance \chk@p@alcnt \@ne
  \@ifundefined{p@al@#1}%
   {\expandafter\def\csname p@al@#1\endcsname{1}%
    \ieicej@warning{Check the "#1" label, it does not correspond to
     ^^J\space\space any labels in \string\authorentry\space command}
   }{}%
  \protected@xdef\Jp@affiliate{\Jp@affiliate
   $\protect\ieicej@fnsymbol{\csname p@al@#1\endcsname}$\ #2}%
  \protected@xdef\Ep@affiliate{\Ep@affiliate
   $\protect\ieicej@fnsymbol{\csname p@al@#1\endcsname}$\ #3}%
 }
 \def\Jp@affiliate{}
 \def\Ep@affiliate{}
\else %%%
 \def\affiliate[#1]#2#3{%
  \advance \chk@alcnt \@ne
  \@ifundefined{al@#1}%
   {\expandafter\def\csname al@#1\endcsname{1}%
    \ieicej@warning{Check the "#1" label, it does not correspond to
      ^^J\space\space any labels in \string\authorentry\space command}%
   }{}%
  %% \let\@fnsymbol\ieicej@fnsymbol %% \show
  \protected@xdef\@affiliate{\@affiliate
   \protect\footnotetext[\csname al@#1\endcsname]{#2\hfil\break #3}}%
 }
 \def\@affiliate{}

 \def\paffiliate[#1]#2{%
  \advance \chk@p@alcnt \@ne
  \@ifundefined{p@al@#1}%
   {\expandafter\def\csname p@al@#1\endcsname{1}%
    \ieicej@warning{Check the "#1" label, it does not correspond to
     ^^J\space\space any labels in \string\authorentry\space command}
   }{}%
  %% \let\@fnsymbol\ieicej@fnsymbol %% \show
  \protected@xdef\p@affiliate{\p@affiliate
    \protect\footnotetext[\csname p@al@#1\endcsname]{#2}}%
 }
 \def\p@affiliate{}
\fi %%%

\newbox\eabstractbox
\newbox\ekeywordbox
\def\eabstract{\global\setbox\eabstractbox=\hbox\bgroup
 \if@tecrep
  \large
 \else
  \normalsize
 \fi
  {\bfseries Abstract\hskip1zw}\ignorespaces}
\def\endeabstract{\egroup}

\def\ekeyword{\global\setbox\ekeywordbox=\hbox\bgroup
 \if@tecrep
  \large
 \else
  \normalsize
 \fi
  {\bfseries Key words\hskip1zw}\ignorespaces}
\def\endekeyword{\egroup}

\newdimen\Pauthorsep
 \Pauthorsep 7.5mm % 15Qx2zw

\def\titlepagebaselinestretch#1{\gdef\@titlepagebaselinestretch{#1}}
\titlepagebaselinestretch{1}

\def\jsubtitle#1{\gdef\@jsubtitle{#1}}
\def\@jsubtitle{}
\def\esubtitle#1{\gdef\@esubtitle{#1}}
\def\@esubtitle{}

\if@tecrep %%% technicalreport
 \def\maketitle{\par
  \begingroup 
  \ifnum \chk@alcnt < \@alcnt
    \ieicej@warning{information of \string\affiliate\space is not assigned}%
   \fi
   \advance \p@alcnt -9\relax
   \ifnum \chk@p@alcnt < \p@alcnt
    \ieicej@warning{information of \string\paffiliate\space is not assigned}%
   \fi
   \def\@fnsymbol##1{\ifcase##1 \or
    \dag\or
    \dag\dag\or
    \dag\dag\dag\or
    \dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\dag\dag\or
    *\or **\or ***\or ****\or *****\or ******\else\@ctrerr\fi\relax}%
   \def\thefootnote{\fnsymbol{footnote}}%
   \if@twocolumn
    \twocolumn[\@maketitle]%
   \else
    \ieicej@warning{I don't recommend onecolumn option,
      ^^J\space\space because of no compatibility with technicalreport option}%
    \@maketitle
   \fi
  \endgroup
   \let\maketitle\relax
   \let\@maketitle\relax
   \gdef\@affiliate{}\gdef\p@affiliate{}
   \gdef\@jtitle{}\gdef\@etitle{}
   \gdef\@jsubtitle{}\gdef\@esubtitle{}
   \let\affiliate\relax\let\paffiliate\relax
   \@authorlist={}%
   \let\jkeyword\relax\let\jabstract\relax
   \let\ekeyword\relax\let\eabstract\relax
   \let\@outputJauthorlist\relax\let\@outputEauthorlist\relax
   \let\@aeP\relax
   \let\@ae\relax
   \let\TR@ae\relax
   \let\N@ae\relax
   \let\TR@aeP\relax
   \let\TR@aeNP\relax
   \let\breakauthorline\relax
   \@authorcnt \z@
   \loop\ifnum \the\@authorcnt < \the\@totalnumber
    \advance \@authorcnt \@ne
     \expandafter\let\csname @Jauthorname\number\@authorcnt\endcsname\relax
     \expandafter\let\csname @Eauthorname\number\@authorcnt\endcsname\relax
   \repeat
 }

 \def\@maketitle{%
  \setbox\@tempboxa\vbox{%
    \def\baselinestretch{\@titlepagebaselinestretch}%
    \hskip8mm
    \vtop{\footnotesize\baselineskip3mm
     \hbox{社団法人\hskip1zw 電子情報通信学会}%
     \hbox{THE INSTITUTE OF ELECTRONICS,}%
     \hbox{INFORMATION AND COMMUNICATION ENGINEERS}%
    }\hfill
    \vtop{\footnotesize\baselineskip3mm
     \hbox{信学技報}%
     \hbox{TECHNICAL REPORT OF IEICE.}%
     \hbox{}%
    }\hskip8mm\hbox{}\par
    \vskip\baselineskip
    \bgroup
     \centering
     {\fontsize{16}{23}\selectfont
      \@jtitle\par
     }%
     \vskip.25\baselineskip
     \ifx\@jsubtitle\empty
     \else
      {\huge
       \@jsubtitle\par
      }%
      \vskip.25\baselineskip
     \fi
     {\LARGE
       \@outputJauthorlist\par
     }%
     \vskip.5\baselineskip
     {\fontsize{10.5}{15}\selectfont
      \J@affiliate\par
      \Jp@affiliate\par
      \ifx\@MailAddress\empty
       \fmt@Ema
       \ifx\header@ma\empty
        \vskip.5\baselineskip
       \else
	E-mail: \Mail@ddress\par
	\vskip.5\baselineskip
       \fi
      \else
       E-mail: \@MailAddress
       \vskip.5\baselineskip
      \fi
     }%
    \egroup
    \bgroup\large
     \leavevmode
     \unhbox\jabstractbox\par
     \nointerlineskip
     \vskip\baselineskip
     \vskip-1zh
     \vskip0pt
     \leavevmode
     \unhbox\jkeywordbox\par
    \egroup
 %%
    \vskip1.5\baselineskip
    \bgroup
     \centering
     {\fontsize{16}{23}\selectfont
      \@etitle\par
     }%
     \vskip.25\baselineskip
     \ifx\@esubtitle\empty
     \else
      {\huge
       \@esubtitle\par
      }%
      \vskip.25\baselineskip
     \fi
     {\LARGE
      \hyphenpenalty=10000\relax
      \@outputEauthorlist\par
     }%
     \vskip.5\baselineskip
     {\fontsize{10.5}{15}\selectfont
      \E@affiliate\par
      \Ep@affiliate\par
      \ifx\@MailAddress\empty
       \ifx\header@ma\empty
        \vskip.5\baselineskip
       \else
	E-mail: \Mail@ddress\par
	\vskip.5\baselineskip
       \fi
      \else
       E-mail: \@MailAddress
       \vskip.5\baselineskip
      \fi
     }%
    \egroup
    \bgroup\large
     \leavevmode \unhbox\eabstractbox\par
     \nointerlineskip
     \vskip\baselineskip
     \vskip-1zh
     \vskip0pt
     \leavevmode \unhbox\ekeywordbox
    \egroup
    \vskip\baselineskip
  }%
  \@tempdima\ht\@tempboxa
  \advance \@tempdima \dp\@tempboxa
  \ifdim \@tempdima>\textheight
   \ieicej@warning{The title page is too high. 
      ^^J\space\space You can adjust the height of a title page
      ^^J\space\space by changing \string\titlepagebaselinestretch\space 
		      in preamble.
      ^^J\space\space For example, \string\titlepagebaselinestretch{0.9}}%
   {\parindent\z@
    \vtop to \z@{%
     \vbox to \textheight{%
      \unvbox\@tempboxa
     }\vss
    }%
   }\par
   \clearpage
  \else
   \divide \@tempdima \Cvs
   \@tempcnta=\@tempdima
   \advance \@tempcnta \@ne
   \vbox to \@tempcnta\Cvs{%
    \box\@tempboxa\vss
   }%
  \fi
 }

 \newbox\jabstractbox
 \newbox\jkeywordbox

 \def\jabstract{\global\setbox\jabstractbox\hbox\bgroup
   \large
   {\bfseries あらまし\hskip1zw}\ignorespaces}
   \def\endjabstract{\egroup}

 \def\jkeyword{\global\setbox\jkeywordbox\hbox\bgroup
   \large
   {\bfseries キーワード\hskip1zw}\ignorespaces}
 \def\endjkeyword{\egroup}

 \let\abstract\jabstract
 \let\endabstract\endjabstract
 \let\keyword\jkeyword
 \let\endkeyword\endjkeyword

\else %%%

 \if@letter
  \def\abstract{\parindent\z@
   \hspace*{1zw}{\bfseries あらまし\hskip1zw}\ignorespaces}
  \def\endabstract{\par\ignorespaces}

  \def\keyword{\parindent\z@
   \hspace*{1zw}{\bfseries キーワード\hskip1zw}\ignorespaces}
  \def\endkeyword{\par}
 \else
  \newbox\abstractbox
  \newbox\keywordbox
  \def\abstract{\global\setbox\abstractbox=\hbox\bgroup
   \begin{minipage}[t]{137.5mm}%11Q 50zw
    \Small\hskip1zw{\bfseries あらまし\hskip1zw}\ignorespaces}
  \def\endabstract{\end{minipage}\egroup}

  \def\keyword{\global\setbox\keywordbox=\hbox\bgroup
   \begin{minipage}[t]{137.5mm}%11Q 50zw
    \Small\hskip1zw{\bfseries キーワード\hskip1zw}\ignorespaces}
  \def\endkeyword{\end{minipage}\egroup}
 \fi

 \let\jabstract\abstract
 \let\endjabstract\endabstract
 \let\jkeyword\keyword
 \let\endjkeyword\endkeyword

 \newdimen\Lauthorsep
 %% \Lauthorsep 4.125mm % 11Qx1.5zw
  \Lauthorsep 5.5mm % 11Qx2zw
 \newdimen\LPauthorsep
 %% \LPauthorsep 3mm % 12Qx1zw
  \LPauthorsep 6mm % 12Qx2zw
 %%\newdimen\Pauthorsep
 %% \Pauthorsep 7.5mm % 15Qx2zw

 \def\makeLtitle{\par
  \global\@topnum\z@
  \begingroup
   \ifnum \chk@alcnt < \@alcnt
    \ieicej@warning{information of \string\affiliate\space is not assigned}%
   \fi
   \advance \p@alcnt -9\relax
   \ifnum \chk@p@alcnt < \p@alcnt
    \ieicej@warning{information of \string\paffiliate\space is not assigned}%
   \fi
   \long\def\@makefntext##1{%
    \ifnum \p@alcnt > \@alcnt
     \ifnum \p@alcnt > \thr@@
      \@tempdima=\p@alcnt zw
      \divide \@tempdima \tw@
      \advance \@tempdima .75zw
     \else
      \@tempdima=2zw
     \fi
    \else
     \ifnum \@alcnt > \thr@@
      \@tempdima=\@alcnt zw
      \divide \@tempdima \tw@
      \advance \@tempdima .75zw
     \else
      \@tempdima=2zw
     \fi
    \fi
    \@tempdimb=\columnwidth
    \global\advance \@tempdimb -\@tempdima %% 02
    \everypar={\hangindent=\@tempdima \hangafter=1\relax}%
    \parindent\@tempdima
    \noindent
    \if@tempswa
     \hbox to \@tempdima{\hss
      \@thefnmark\ }\parbox[t]{\@tempdimb}{##1\strut}%
    \else
     \hbox to \@tempdima{\hss
      $^{\@thefnmark}$\,}\parbox[t]{\@tempdimb}{##1\strut}%
    \fi
   }%
   \def\thefootnote{\fnsymbol{footnote}}%
   \def\@fnsymbol##1{\ifcase##1 \or
    \dag\or
    \dag\dag\or
    \dag\dag\dag\or
    \dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\dag\or
    \dag\dag\dag\dag\dag\dag\dag\dag\dag\or
    *\or **\or ***\or ****\or *****\or ******\or %% ((((((((((((((((((((
    a)\or b)\or c)\or d)\or e)\or f)\or g)\or h)\or i)\or j)\or
    k)\or l)\or m)\or n)\or o)\or p)\or q)\or r)\or s)\or t)\else
     \@ctrerr\fi\relax}%
   \skip\@mpfootins=2.75mm \@plus .25mm \@minus \z@
    \noindent
     \begin{minipage}{\columnwidth}%
      \@makeLtitle
      \@tempswafalse
      \@affiliate
      \p@affiliate
      \@tempswatrue
      \@Emadrs
     \end{minipage}\par
     \vskip23\@Q \@plus 18\@Q \@minus 1\@Q
    \thispagestyle{ieicej}%
  \endgroup
   \let\makeLtitle\relax
   \let\@makeLtitle\relax
   \gdef\@affiliate{}\gdef\p@affiliate{}%
   \gdef\@jtitle{}\gdef\@etitle{}%
   \let\affiliate\relax\let\paffiliate\relax
   \@authorlist={}%
   \let\@outputJauthorlist\relax\let\L@outputEauthorlist\relax
   \let\L@aeP\relax
   \let\L@ae\relax
   \let\breakauthorline\relax
   \@authorcnt\z@
   \loop\ifnum \the\@authorcnt < \the\@totalnumber
    \advance \@authorcnt \@ne
     \expandafter\let\csname @Jauthorname\number\@authorcnt\endcsname\relax
     \expandafter\let\csname @Eauthorname\number\@authorcnt\endcsname\relax
   \repeat
 }

 \def\@makeLtitle{\newpage
  \bgroup
   \null\parindent\z@
   \tabcolsep\z@
   \linethickness{0.1mm}%
    \vskip3.75mm
    {\bfseries\mathversion{bold}\baselineskip18\@Q
     \@jtitle\par
    }
    {\Small
     \tabcolsep\Lauthorsep
     \begin{tabular}{@{}ll@{}}
      \@outputJauthorlist
     \end{tabular}\par
    }
    \nointerlineskip
    \vskip4\@Q
    {\footnotesize
     \@etitle\par
    }
    \vskip3\@Q
    {\footnotesize
     \parbox[t]{\columnwidth}{\raggedright\baselineskip3.25mm
      \hyphenpenalty=10000\relax
      \L@outputEauthorlist}\par
    }
  \egroup
 }

 \def\maketitle{\par
  \begingroup
   \ifnum \chk@alcnt < \@alcnt
    \ieicej@warning{information of \string\affiliate\space is not assigned}%
   \fi
   \advance \p@alcnt -9\relax
   \ifnum \chk@p@alcnt < \p@alcnt
    \ieicej@warning{information of \string\paffiliate\space is not assigned}%
   \fi
   \twocolumn[\csname @make\@type title\endcsname]
   \thispagestyle{ieicej}%
    \def\thefootnote{\fnsymbol{footnote}}%
    \long\def\@makefntext##1{%
      \ifnum \p@alcnt > \@alcnt
       \ifnum \p@alcnt > \thr@@
	\@tempdima=\p@alcnt zw
	\divide \@tempdima \tw@
	\advance \@tempdima .75zw
       \else
	\@tempdima=2zw
       \fi
      \else
       \ifnum \@alcnt > \thr@@
	\@tempdima=\@alcnt zw
	\divide \@tempdima \tw@
	\advance \@tempdima .5zw
       \else
	\@tempdima=2zw
       \fi
      \fi
       \everypar={\hangindent=\@tempdima \hangafter=1\relax}%
       \parindent\@tempdima
       \noindent
       \if@tempswa
	\hbox to \@tempdima{\hss \@thefnmark\ }##1%
       \else
	\hbox to \@tempdima{\hss $^{\@thefnmark}$\,}##1%
       \fi
    }%
   \@tempswafalse
   \@affiliate
   \p@affiliate
   \@tempswatrue
   \@Emadrs
  \endgroup
   \let\maketitle\relax
   \expandafter\let\csname @make\@type title\endcsname\relax
   \gdef\@affiliate{}\gdef\p@affiliate{}
   \gdef\@jtitle{}\gdef\@etitle{}
   \let\affiliate\relax\let\paffiliate\relax
   \@authorlist={}
   \let\keyword\relax\let\abstract\relax
   \let\@outputJauthorlist\relax\let\@outputEauthorlist\relax
   \let\L@outputEauthorlist\relax
   \let\@aeP\relax
   \let\@ae\relax
   \let\L@aeP\relax
   \let\L@ae\relax
   \let\breakauthorline\relax
   \@authorcnt \z@
   \loop\ifnum \the\@authorcnt < \the\@totalnumber
    \advance \@authorcnt \@ne
     \expandafter\let\csname @Jauthorname\number\@authorcnt\endcsname\relax
     \expandafter\let\csname @Eauthorname\number\@authorcnt\endcsname\relax
   \repeat
 }

 \def\ADJ#1{\gdef\@ADJ{#1}}
 \def\@ADJ{}
 \ADJ{0mm}

 %% paper
 \def\@makePtitle{%
  \setbox\@tempboxa\hbox{%
   \begin{minipage}{137.5mm}% 151.5 - 14
    \vskip4.5mm
    \parindent\z@
    \tabcolsep\z@
    \linethickness{0.1mm}%
    \baselineskip33\@Q
     {\LARGE
      \@jtitle
     }\par
      \vskip11\@Q
     {\Large
      \tabcolsep\Pauthorsep
      \begin{tabular}{@{}llll@{}}
       \@outputJauthorlist
      \end{tabular}\par
     }%
     \nointerlineskip
     \vskip1mm
     \Large\baselineskip24\@Q
     \vskip14\@Q
      \@etitle\par
     \vskip8\@Q
     {\large\baselineskip21\@Q
      \parbox[t]{137.5mm}{\raggedright\baselineskip5.25mm
       \hyphenpenalty=10000\relax
       \@outputEauthorlist}\par
     }%
     \vskip35\@Q
     \hfill\box\abstractbox\par
     \vskip4\@Q
     \hfill\box\keywordbox
   \end{minipage}%
  }%
   \@tempdima\ht\@tempboxa
   \advance \@tempdima \dp\@tempboxa
   \divide \@tempdima \Cvs
   \@tempcnta=\@tempdima
   \advance \@tempcnta \thr@@
   {\newpage\null
    \boxmaxdepth\z@
    \lineskiplimit\z@
    \lineskip\z@
    \parindent\z@
    \vbox to \@tempcnta\Cvs{%
     \hskip14mm\box\@tempboxa
    \vss}%
   }\par
  \vspace{\@ADJ}%
  \setcounter{footnote}{0}%
 }

 %% electronicsletter
 \def\@makeLPtitle{%
  \setbox\@tempboxa\hbox{%
   \begin{minipage}{137.5mm}% 151.5 - 14
    \vskip5mm
    \parindent\z@
    \tabcolsep\z@
    \linethickness{0.1mm}%
     {\jtitlefont@LP
      \@jtitle\par
     }%
     \vskip11\@Q
     {\jauthorfont@LP
      \tabcolsep\LPauthorsep
      \begin{tabular}{@{}llll@{}}
       \@outputJauthorlist
      \end{tabular}
     }%
     \vskip12\@Q
     {\etitlefont@LP
      \@etitle\par
     }%
     \vskip2\@Q
     {\eauthorfont@LP
      \parbox[t]{137.5mm}{\raggedright\baselineskip14\@Q
       \hyphenpenalty=10000\relax
       \L@outputEauthorlist}\par
     }%
     \nointerlineskip
     \vskip23\@Q
     \hfill\box\abstractbox\par
     \vskip3\@Q
     \hfill\box\keywordbox\par
   \end{minipage}%
  }%
   \@tempdima\ht\@tempboxa
   \advance \@tempdima \dp\@tempboxa
   \divide \@tempdima \Cvs
   \@tempcnta=\@tempdima
   \advance \@tempcnta \tw@
   {\newpage\null
    \boxmaxdepth\z@
    \lineskiplimit\z@
    \lineskip\z@
    \parindent\z@
    \vbox to \@tempcnta\Cvs{%
     \hskip14mm\box\@tempboxa
    \vss}%
   }\par
  \vspace{\@ADJ}%
  \setcounter{footnote}{0}%
 }

 %% LP  (electronicsletter)
 \def\jtitlefont@LP{%
  \fontsize{16\@JQ}{24\@Q}\bfseries\selectfont
  \mathversion{bold}%
 }
 \def\etitlefont@LP{%
  \normalsize\rmfamily\baselineskip14\@Q
 }
 \let\eauthorfont@LP\etitlefont@LP
 \def\jauthorfont@LP{%
  \normalsize\baselineskip20\@Q
 }

 \if@letter
  \let\maketitle\makeLtitle
  \let\@aeP\relax
  \let\@ae\relax
  \let\@makePtitle\relax
  \let\@makeLPtitle\relax
  \let\@outputEauthorlist\relax
 \fi

 \if@paper
  \let\L@aeP\relax
  \let\L@ae\relax
  \let\makeLtitle\relax
  \let\@makeLtitle\relax
  \let\@makeLPtitle\relax
  \let\L@outputEauthorlist\relax
 \fi

 \if@electronicsletter
  \let\@aeP\relax
  \let\@ae\relax
  \let\makeLtitle\relax
  \let\@makeLtitle\relax
  \let\@makePtitle\relax
  \let\@outputEauthorlist\relax
 \fi

\fi %%%

\setcounter{secnumdepth}{5}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand{\thesection}{\@arabic\c@section.}
\renewcommand{\thesubsection}{\thesection\,\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
   \thesubsection.\,\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{% (
 \@alph\c@paragraph\,)}
\renewcommand{\thesubparagraph}{% (
 \@roman\c@subparagraph\,)}

\def\@afterheading{%
 \global\@nobreaktrue
 \everypar{%
  \if@nobreak
   \global\@nobreakfalse
   \clubpenalty \z@
    \if@afterindent
    \else
     {\setbox\z@=\lastbox}%
    \fi
  \else
   \clubpenalty\@clubpenalty
   \everypar{}%
  \fi}%
}

%% \@startsection{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}
\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
  \par \@tempskipa #4\relax
  \@afterindenttrue
  \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \@afterindentfalse\fi
  \if@nobreak
   \everypar{}%
  \else
   %\addpenalty\@secpenalty
  \fi
  \ifdim\@tempskipa>\z@
   \vskip-\prevdepth \prevdepth\z@
   \vskip\Cvs
   \advance\@tempskipa-\Cvs
   \vspace*{\@tempskipa}%
  \fi
 \@ifstar{\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

%% \@sect{NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}[ARG1]{ARG2}
\def\@sect#1#2#3#4#5#6[#7]#8{%%
 \ifnum #2>\c@secnumdepth
  \let\@svsec\@empty
 \else
  \refstepcounter{#1}%
  \protected@edef\@svsec{\@seccntformat{#1}\relax}%
 \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa<\z@
   \def\@svsechd{%
     #6{\hskip #3\relax
     \@svsec #8}}%
  \else
   \begingroup
    #6{%
      \@hangfrom{\hskip #3\relax{\csname #2@font\endcsname \@svsec}}%
       \interlinepenalty\@M \@secjidori{#8}\@@par
      }%
   \endgroup
  \fi
 \@xsect{#5}}

%% \@ssect{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE}{ARG} ==
\def\@ssect#1#2#3#4#5{%
 \@tempskipa #3\relax
 \ifdim \@tempskipa<\z@
  \def\@svsechd{#4{\hskip #1\relax #5}}%
 \else
  \begingroup
   #4{%
    \@hangfrom{\hskip #1}%
     \interlinepenalty\@M \@secjidori{#5}\@@par
     }%
  \endgroup
 \fi
 \@xsect{#3}}

\def\@xsect#1{%
  \@tempskipa #1\relax
  \ifdim \@tempskipa<\z@
    \@nobreakfalse
    \global\@noskipsectrue
    \everypar{%
      \if@noskipsec
        \global\@noskipsecfalse
       {\setbox\z@\lastbox}%
        \clubpenalty\@M
        \begingroup \@svsechd \endgroup
        \unskip
        \@tempskipa #1\relax
        \hskip -\@tempskipa
        \pagebreak[2]%
      \else
        \clubpenalty \@clubpenalty
        \everypar{}%
      \fi}%
  \else
    \par \nobreak
    \vskip \@tempskipa
    \@afterheading
  \fi
  \ignorespaces}

\def\@secjidori#1{%
 \def\@tempfn{}%
 \def\@tempfncnt{}%
 \bgroup
  \def\footnote{\@ifnextchar[% ]
   {\@ignorefn}{\@ignorefn[]}}%
  \long\def\@ignorefn[##1]##2{\gdef\@tempfncnt{##1}\gdef\@tempfn{##2}}%
  \global\setbox\@tempboxb\hbox{\inhibitglue #1}%
 \egroup
  \ifdim \wd\@tempboxb>4.5zw
   \inhibitglue #1%
  \else
   \def\@makefnmark{\kern0pt\hbox to \z@{%
    $^{\mbox{\tiny \kern-.5zw （注\@thefnmark{}）\kern-.5zw}}$\hss}}%
   \kanjiskip\z@ \@plus 1fill \@minus 1fill\xkanjiskip=\kanjiskip
    \jmathkanjiskip=\kanjiskip
   \hbox to 5zw{\inhibitglue #1\hfil}%
   \ifx\@tempfn\empty\else
    \ifx\@tempfncnt\empty\footnotetext{\@tempfn}\else
     \footnotetext[\@tempfncnt]{\@tempfn}
    \fi\fi
  \fi
}

\@namedef{3@font}{\bfseries}
\def\@seccntformat#1{\csname the#1\endcsname\hskip1zw}

\if@tecrep
 \def\sec@font{\bfseries\mathversion{bold}\baselineskip20.5\@Q}
\else
 \DeclareFixedFont{\KFsec}{JY1}{gt}{m}{n}{14\@JQ}
 \def\sec@font{\bfseries\KFsec\mathversion{bold}\baselineskip19\@Q}
\fi

\if@letter
 \newcommand{\section}{\@startsection{section}{1}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\reset@font\normalsize\bfseries\mathversion{bold}}}
\else
 \newcommand{\section}{\@startsection{section}{1}{1zw}%
   {.5\Cvs}% \@plus.1mm \@minus.1mm
   {.5\Cvs}% \@plus.1mm \@minus.1mm
   {\reset@font\Large\sec@font}}
\fi
 \newcommand{\subsection}{\@startsection{subsection}{2}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\reset@font\normalsize\bfseries\mathversion{bold}}}
 \newcommand{\subsubsection}{\@startsection{subsubsection}{3}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mmu
   {\reset@font\normalsize}}
\newcommand{\paragraph}{\@startsection{paragraph}{4}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\reset@font\normalsize}}
\newcommand{\subparagraph}{\@startsection{subparagraph}{5}{1zw}%
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\reset@font\normalsize}}

\newcommand{\appendix}{\par
 \renewcommand{\section}{\@startsection{section}{1}{\z@}
  {.5\Cvs}% \@plus.1mm \@minus.1mm
  {.5\Cvs}% \@plus.1mm \@minus.1mm
  {\if@letter\centering\bfseries\else\centering\Large\sec@font\fi}}%
 \section*{付録}
  \renewcommand{\section}{\@startsection{section}{1}{1zw}
   {\z@}% \@plus.1mm \@minus.1mm
   {\z@}% \@plus.1mm \@minus.1mm
   {\normalsize\bfseries\mathversion{bold}}}%
 \setcounter{section}{0}%
 \setcounter{subsection}{0}%
 \setcounter{equation}{0}%
 \setcounter{figure}{0}%
 \setcounter{table}{0}%
 \def\theequation{\protect\mbox{A$\cdot$\@arabic\c@equation}}%
 \def\thefigure{A$\cdot$\,\@arabic\c@figure}%
 \def\thetable{A$\cdot$\,\@arabic\c@table}%
}

\if@twocolumn
  \setlength\leftmargini {2zw}%
\else
  \setlength\leftmargini {2zw}%
\fi
\setlength\leftmarginii  {2zw}%
\setlength\leftmarginiii {2zw}%
\setlength\leftmarginiv  {2zw}%
\if@twocolumn
  \setlength\leftmarginv {1zw}%
  \setlength\leftmarginvi{1zw}%
\else
  \setlength\leftmarginv {1zw}%
  \setlength\leftmarginvi{1zw}%
\fi
\setlength  \labelsep  {1zw}%
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty \z@ % -\@lowpenalty
\@endparpenalty   \z@ % -\@lowpenalty
\@itempenalty     \z@ % -\@lowpenalty

%% from latex.ltx
\def\@item[#1]{%
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\z@ % \@M --> \z@
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
}

\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\kern-.5zw （\,\theenumi\,）\kern-.5zw}
\newcommand{\labelenumii}{\kern-.5zw （\,\theenumii\,）\kern-.5zw}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}

\renewenvironment{enumerate}
  {%
   \ifnum \@enumdepth >3\relax\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \list{\csname label\@enumctr\endcsname}{%
     \leftmargin\z@
     \labelwidth2zw
     \labelsep1zw
     \itemindent4zw
     \listparindent1zw
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     %\clubpenalty\z@
     \usecounter{\@enumctr}%
     \def\makelabel##1{\hss\llap{##1}}}%
    \fi}{\endlist}

\newcommand{\labelitemi}{\leavevmode
 \raise.1zh\hbox to 1zw{\hss \textbullet\hss}}
\newcommand{\labelitemii}{{\normalfont\bfseries\textendash}}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}

\renewenvironment{itemize}
  {%
   \ifnum \@itemdepth >3\relax\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    %%\expandafter
    \list{\csname \@itemitem\endcsname}{%
     \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
     \leftmargin\z@
     \labelwidth1zw
     \labelsep1zw
     \itemindent3zw
     \listparindent1zw
     %\clubpenalty\z@
     \def\makelabel##1{\hss\llap{##1}}}%
    \fi}{\endlist}

\def\descriptionlabel#1{\hspace\labelsep #1}
\newenvironment{description}{%
 \list{}{%
  \leftmargin\z@
  \labelsep1zw
  \labelwidth\z@
  \itemindent-\leftmargin
  \listparindent1zw
  \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
  \let\makelabel\descriptionlabel}}{\endlist}

\newskip\@hlskip
\@hlskip.5\Cvs \@plus 1mm \@minus .5mm

\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@
           \topsep\@hlskip\parsep\z@\partopsep\z@
           \itemindent -1zw
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 1zw}%
           \item\relax}{\endlist}

\newenvironment{quotation}
  {\list{}{\listparindent 1zw
           \itemindent\listparindent
           \rightmargin\leftmargin
           \topsep\@hlskip\parsep\z@\partopsep\z@
           }%
           \item\relax}{\endlist}

\newenvironment{quote}
  {\list{}{%
           \topsep\@hlskip\parsep\z@\partopsep\z@
           \rightmargin\leftmargin}%
           \item\relax}{\endlist}

\gdef\tabbing{\lineskip \z@skip\let\>\@rtab\let\<\@ltab\let\=\@settab
     \let\+\@tabplus\let\-\@tabminus\let\`\@tabrj\let\'\@tablab
     \let\\=\@tabcr
     \@hightab\@firsttab
     \global\@nxttabmar\@firsttab
     \dimen\@firsttab\@totalleftmargin
     \global\@tabpush\z@ \global\@rjfieldfalse
     \topsep\@hlskip \parsep\z@\partopsep\z@
     \trivlist \item\relax
     \if@minipage\else\vskip\parskip\fi
     \setbox\@tabfbox\hbox{%
       \rlap{\hskip\@totalleftmargin\indent\the\everypar}}%
     \def\@itemfudge{\box\@tabfbox}%
     \@startline\ignorespaces}

\newdimen\verbatimleftmargin
  \verbatimleftmargin\z@
\newdimen\verbatimbaselineskip
  \verbatimbaselineskip\Cvs
\def\verbatimsize{\normalsize}

\def\@verbatim{%
 \topsep\z@\partopsep\z@\parsep\z@\itemsep\z@
 \trivlist \item\relax
  \if@minipage\else
   \vskip\baselineskip
   \vskip-\verbatimbaselineskip
  \fi
  \leftskip\@totalleftmargin
  \if@minipage\else
   \advance \leftskip by \verbatimleftmargin
  \fi
  \rightskip\z@skip
  \parindent\z@\parfillskip\@flushglue\parskip\z@skip
  \@@par
  \@tempswafalse
  \def\par{%
    \if@tempswa
      \leavevmode \null \@@par\penalty\interlinepenalty
    \else
      \@tempswatrue
      \ifhmode\@@par\penalty\interlinepenalty\fi
    \fi}%
  \let\do\@makeother \dospecials
  \obeylines 
   \verbatimsize \baselineskip\verbatimbaselineskip
   \ttfamily \@noligs
  \everypar \expandafter{\the\everypar \unpenalty}%
}

%% from latex.ltx
%%  v1.3
\def\@item[#1]{% 
  \if@noparitem
    \@donoparitem
  \else
    \if@inlabel
      \indent \par
    \fi
    \ifhmode
      \unskip\unskip \par
    \fi
    \if@newlist
      \if@nobreak
        \@nbitem
      \else
        \addpenalty\@beginparpenalty
        \addvspace\@topsep
        \addvspace{-\parskip}%
      \fi
    \else
      \addpenalty\@itempenalty
      \addvspace\itemsep
    \fi
    \global\@inlabeltrue
  \fi
  \everypar{%
    \@minipagefalse
    \global\@newlistfalse
    \if@inlabel
      \global\@inlabelfalse
      {\setbox\z@\lastbox
       \ifvoid\z@
         \kern-\itemindent
       \fi}%
      \box\@labels
      \penalty\z@
    \fi
    \if@nobreak
      \@nobreakfalse
      \clubpenalty\z@ %\@M --> \z@ 
    \else
      \clubpenalty \@clubpenalty
      \everypar{}%
    \fi}%
  \if@noitemarg
    \@noitemargfalse
    \if@nmbrlist
      \refstepcounter\@listctr
    \fi
  \fi
  \sbox\@tempboxa{\makelabel{#1}}%
  \global\setbox\@labels\hbox{%
    \unhbox\@labels
    \hskip \itemindent
    \hskip -\labelwidth
    \hskip -\labelsep
    \ifdim \wd\@tempboxa >\labelwidth
      \box\@tempboxa
    \else
      \hbox to\labelwidth {\unhbox\@tempboxa}%
    \fi
    \hskip \labelsep}%
  \ignorespaces\inhibitglue
}

\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename~\thefigure}
\def\fnum@efigure{Fig.\,\thefigure}
\newenvironment{figure}
               {\@floatenv
                \if@tecrep\capwidth\hsize\ecapwidth\hsize\else
                 \capwidth65mm\ecapwidth65mm\fi
                \abovecaptionskip1mm\belowcaptionskip\z@\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@floatenv\capwidth.66\textwidth\ecapwidth.66\textwidth
                \abovecaptionskip1mm\belowcaptionskip\z@\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename~\thetable}
\def\fnum@etable{Table~\thetable}
\newenvironment{table}
               {\@floatenv
                \if@tecrep\capwidth\hsize\ecapwidth\hsize\else
                 \capwidth65mm\ecapwidth65mm\fi
                \abovecaptionskip\z@\belowcaptionskip3pt\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@floatenv\capwidth.66\textwidth\ecapwidth.66\textwidth
                \abovecaptionskip\z@\belowcaptionskip3pt\@dblfloat{table}}
               {\end@dblfloat}
\def\@floatboxreset {%
        \reset@font
        \small\tabcolsep.5zw
        \@setminipage
}
\def\@floatenv{\let\center\Center}

\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}

\long\def\@caption#1[#2]#3{\par
 \begingroup
  \@parboxrestore
  \if@minipage
   \@setminipage
  \fi
   \small
   \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
 \endgroup}

\newlength\abovecaptionskip
\newlength\belowcaptionskip

\newbox\@tempboxb
\newdimen\capwidth
\newdimen\ecapwidth

\long\def\@makecaption#1#2{%
 \vskip\abovecaptionskip
 \setbox\@tempboxa\hbox{#1\hskip1zw\shortstack[l]{#2}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{#1\hskip1zw}%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb 
    #1\hskip1zw #2}\vskip2\@Q
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
    #1\hskip1zw #2}\vskip2\@Q
  \fi
 \else
  \ifdim \wd\@tempboxa > \capwidth
   \hfil\parbox[t]{\capwidth}{\hangindent\wd\@tempboxb 
    #1\hskip1zw #2}\vskip2\@Q
  \else
   \setbox\@tempboxb\hbox{#2}%
   \ifdim \wd\@tempboxb < 4.5zw
    \hbox to\hsize{\hfil #1\hskip1zw\kintou{5zw}{#2}\hfil}%
   \else
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
   \fi
  \fi
 \fi
}

\long\def\ecaption#1{\small
 \setbox\@tempboxa\hbox{\csname fnum@e\@captype\endcsname\hskip1zw
  \shortstack[l]{#1}}%
 \@tempdima\ht\@tempboxa \advance \@tempdima \dp\@tempboxa
 \setbox\@tempboxb\hbox{\csname fnum@e\@captype\endcsname\hskip1zw}%
 \ifdim \@tempdima > \baselineskip
  \ifdim \wd\@tempboxa > \ecapwidth
   \hfil\parbox[t]{\ecapwidth}{\hangindent\wd\@tempboxb 
    \csname fnum@e\@captype\endcsname\hskip1zw #1}\par
  \else
   \hfil\parbox[t]{\wd\@tempboxa}{\hangindent\wd\@tempboxb 
    \csname fnum@e\@captype\endcsname\hskip1zw #1}\par
  \fi
 \else
  \ifdim \wd\@tempboxa > \ecapwidth
   \hfil\parbox[t]{\ecapwidth}{\hangindent\wd\@tempboxb
    \csname fnum@e\@captype\endcsname\hskip1zw #1}\par
  \else
   \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
 \fi
 \vspace{\belowcaptionskip}\par
}

\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{.5zw}
\setlength\arrayrulewidth{.1mm}
\setlength\doublerulesep{\z@}
\setlength\tabbingsep{\labelsep}

\skip\@mpfootins = \skip\footins
\setlength\fboxsep{.5zw}
\setlength\fboxrule{.1mm}
\renewcommand{\theequation}{\@arabic\c@equation}

\if@NTT\else
 \if@enablejfam
  \if@compatibility\else
    \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}
    \DeclareSymbolFontAlphabet{\mathmc}{mincho}
    \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}
    \jfam\symmincho
    \DeclareMathAlphabet{\mathgt}{JY1}{gt}{m}{n}
  \fi
  \if@mathrmmc
    \AtBeginDocument{%
     \reDeclareMathAlphabet{\mathrm}{\mathrm}{\mathmc}
     \reDeclareMathAlphabet{\mathbf}{\mathbf}{\mathgt}
    }%
  \fi
 \else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
 \fi
\fi

%% for 2.1.4 compatibility
%\@ifundefined{reDeclareMathAlphabet}{%
% \def\reDeclareMathAlphabet#1#2#3{%
%  \DeclareRobustCommand{#1}[1]{%
%    \ifmmode
%      \ifx\math@bgroup\@empty % 2.09 compatibility
%        #2\relax#3\relax##1\relax
%      \else % native mode
%        \ifx\math@bgroup\relax % oldstyle
%          #2\relax\@fontswitch\relax{#3}##1\relax
%        \else
%          #2{#3{##1}}%
%        \fi
%      \fi
%    \else
%      #2{##1}%
%    \fi
%  }%
% }%
% \@onlypreamble\reDeclareMathAlphabet
% }{}

%\@ifundefined{mathmc}{\relax}{%
% \if@enablejfam
%  \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}%
%  \DeclareSymbolFontAlphabet{\mathmc}{mincho}%
%  \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}%
%  \DeclareMathAlphabet\mathgt{JY1}{gt}{m}{n}%
%  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}%
%  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}%
%  \jfam\symmincho
% \else
%  \DeclareRobustCommand{\mathmc}{%
%    \@latex@error{Command \noexpand\mathmc invalid with\space
%       `disablejfam' class option.}\@eha
%  }%
%  \DeclareRobustCommand{\mathgt}{%
%    \@latex@error{Command \noexpand\mathgt invalid with\space
%       `disablejfam' class option.}\@eha
%  }%
% \fi
%}

%\@ifundefined{mathmc}{\relax}{%
% \DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}%
% \DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}%
%}

\if@NTT\else
 \DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
 \DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\fi
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}

\newenvironment{thebibliography}[1]
 {%
 \def\subsection{\@startsection{subsection}{2}{\z@}%
  {\z@}%     \@plus 1mm \@minus .1mm
  {.15\Cvs}% \@plus 1mm \@minus .1mm
  {\centering\bfseries}}%
 \subsection*{\refname}%
 \small\baselineskip15\@Q
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{\hspace*{2zw}}}%
         \topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
         \leftmargin3zw
         \labelsep1zw
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumi\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty\z@
   \widowpenalty\z@
   \@clubpenalty\clubpenalty
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\def\@biblabel#1{[#1]}
\let\@openbib@code\@empty

\def\@uketsuke{%
 \vskip6\@Q
 \raggedleft\rightskip1zw
  （\@received\@revised\@finalreceived ）\kern-.5zw\par
}

\def\received#1#2#3{%
 \gdef\@received{平成#1年#2月#3日受付}%
 \gdef\@receivedyear{#1}}
\received{xx}{xx}{xx}

\def\revised#1#2#3{%
 \gdef\@revisedyear{#1}%
 \ifx\@receivedyear\@revisedyear
  \gdef\@revised{，#2月#3日再受付}%
 \else
  \gdef\@revised{，#1年#2月#3日再受付}%
 \fi
}
\def\@revised{}

\def\finalreceived#1#2#3{%
 \gdef\@finalreceivedyear{#1}%
 \ifx\@revisedyear\@finalreceivedyear
  \gdef\@finalreceived{，\inhibitglue\break #2月#3日最終受付}%
 \else
  \gdef\@finalreceived{，\inhibitglue\break #1年#2月#3日最終受付}%
 \fi
}
\def\@finalreceived{}

%% paper, electronicsletter
\newenvironment{biography}{\par
 \raggedbottom
 {\small \@uketsuke}\par
 \nointerlineskip
 \vskip17mm
 \parindent\z@
 \leftskip8\@Q
 \small\baselineskip15\@Q
 \global\let\@uketsuke\relax
}{\par}

\ifx\pdfpageheight\@undefined
 \def\ieicej@in@ext{eps}
\else
 \def\ieicej@in@ext{pdf}
\fi

\newcounter{profile}
\def\profile{%
 \@ifstar\np@profile{\@ifnextchar[%% ]
 {\pic@profile}{\stepcounter{profile}%
  \pic@profile[a\theprofile.\ieicej@in@ext]}}}% 

\long\def\pic@profile[#1]#2#3#4{%
% \stepcounter{profile}%
 \if #2r \def\p@mbrship{（正員）\kern-.5zw}\else
  \if #2m \def\p@mbrship{（正員）\kern-.5zw}\else
   \if #2s \def\p@mbrship{（学生員）\kern-.5zw}\else
    \if #2n \def\p@mbrship{}\else
     \if #2a \def\p@mbrship{（准員）\kern-.5zw}\else
      \if #2h \def\p@mbrship{（名誉員）\kern-.5zw}\else
       \if #2f \def\p@mbrship{（正員：フェロー）\kern-.5zw}\else
        \if #2e \def\p@mbrship{（正員：シニア会員）\kern-.5zw}\else
  \def\p@mbrship{}%
  \ieicej@warning{Check the 1st. argument of \string\profile{#2}{#3}{}}%
 \fi\fi\fi\fi\fi\fi\fi\fi
 \def\@checkname{#3}%
 \setbox\@tempboxa\hbox{\spaceskip=100mm #3}%
 \ifdim \wd\@tempboxa < 100mm
  \ieicej@warning{Profile's name "#3" doesn't have a space}%
  \let\@authorname\@checkname
 \else
  \setbox\@tempboxa\hbox{#3}%
   \ifdim \wd\@tempboxa > 5zw
    \def\@tempb##1 ##2\@nil{##1\hskip\authornamesep ##2}%
   \else
    \def\@tempb##1 ##2\@nil{\leavevmode\hbox to 5zw{##1\hfil ##2}}%
   \fi
  \protected@edef\@authorname{\expandafter\@tempb\@checkname\@nil}%
 \fi
 \setbox\@tempboxa\hbox{%
  \begin{minipage}[t]{19zw}%
   \small\baselineskip15\@Q
   {\normalsize{\bfseries \@authorname}\hskip1zw
    \p@mbrship\nobreak\rule[-3mm]{0mm}{4mm}}\hfil\break
     \hspace*{1zw}#4\unskip\inhibitglue
  \end{minipage}%
 }%
 \@tempdima \ht\@tempboxa
 \advance \@tempdima \dp\@tempboxa
  \leavevmode
  \hangindent9zw\hangafter-7\relax
   \IfFileExists{#1}% a\theprofile.\ieicej@in@ext
    {\smash{\lower23.9mm\hbox to \z@{\hss
      \resizebox{20mm}{26.4mm}{%
       \includegraphics{#1}}\hskip2.5mm
     }}}%
    {\smash{\lower23.9mm\hbox to \z@{\hss
      \unitlength1mm
      \begin{picture}(20,26.4)
       \put(0,0){\framebox(20,26.4){\null}}%
      \end{picture}\hskip2.5mm
     }}}%
  \ifdim \@tempdima < 26.4mm
   \vtop to 26.4mm{%
    \hbox to 19zw{\hss
    \begin{minipage}[t]{19zw}%
     \small\baselineskip15\@Q
     {\normalsize{\bfseries \@authorname}\hskip1zw
      \p@mbrship\nobreak\rule[-3mm]{0mm}{4mm}}\hfil\break
       \hspace*{1zw}#4\unskip\inhibitglue
    \end{minipage}\hss}\vss
   }\par
  \else
   {\normalsize{\bfseries \@authorname}\hskip1zw
    \p@mbrship\nobreak\rule[-3mm]{0mm}{4mm}}\hfil\break
     \hspace*{1zw}#4\par
  \fi
  \nointerlineskip
  \vskip7mm
}

\long\def\np@profile#1#2#3{%
 \stepcounter{profile}%
 \if #1r \def\p@mbrship{（正員）\kern-.5zw}\else
  \if #1m \def\p@mbrship{（正員）\kern-.5zw}\else
   \if #1s \def\p@mbrship{（学生員）\kern-.5zw}\else
    \if #1n \def\p@mbrship{}\else
     \if #1a \def\p@mbrship{（准員）\kern-.5zw}\else
      \if #1h \def\p@mbrship{（名誉員）\kern-.5zw}\else
       \if #1f \def\p@mbrship{（正員：フェロー）\kern-.5zw}\else
        \if #2e \def\p@mbrship{（正員：シニア会員）\kern-.5zw}\else
  \def\p@mbrship{}%
  \ieicej@warning{Check the 1st. argument of \string\profile{#1}{#2}{}}%
 \fi\fi\fi\fi\fi\fi\fi\fi
 \def\@checkname{#2}%
 \setbox\@tempboxa\hbox{\spaceskip=100mm #2}%
 \ifdim \wd\@tempboxa < 100mm
  \ieicej@warning{Profile's name "#2" doesn't have a space}%
  \let\@authorname\@checkname
 \else
  \setbox\@tempboxa\hbox{#2}%
   \ifdim \wd\@tempboxa > 5zw
    \def\@tempb##1 ##2\@nil{##1\hskip\authornamesep ##2}%
   \else
    \def\@tempb##1 ##2\@nil{\leavevmode\hbox to 5zw{##1\hfil ##2}}%
   \fi
  \protected@edef\@authorname{\expandafter\@tempb\@checkname\@nil}%
 \fi
 {\normalsize{\bfseries \@authorname}\hskip1zw
  \p@mbrship\nobreak\rule[-3mm]{0mm}{4mm}}\hfil\break
   \hspace*{1zw}#3\par
  \nointerlineskip
  \vskip7mm
}

\if@tecrep
 \renewenvironment{biography}{\relax}{\relax}
 \long\def\pic@profile[#1]#2#3#4{}
 \long\def\np@profile#1#2#3{}
\fi

\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule height .1mm width \columnwidth
  \kern 2.715\p@}

\def\@makefnmark{\hbox{$^{\mbox{\tiny \kern-.5zw
  （注\kern.1zw\@thefnmark{}）\kern-.5zw}}$}}

\newcommand\@makefntext[1]{\parindent1zw
 \noindent\hbox{\kern-.5zw
  （注\kern.1zw\@thefnmark{}）\kern-.5zw\hbox to 1zw{\hss ：\hss}}#1}

\def\thefootnote{\@arabic\c@footnote}
\def\thempfootnote{\@fnsymbol\c@mpfootnote}

%% from [proc|slide].cls
%% \def\thefootnote{\fnsymbol{footnote}}
%% from [article|report|book].cls
%% \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
%% from latex.ltx
%% \def\@fnsymbol#1{\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or
%%    \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger
%%    \or \ddagger\ddagger \else\@ctrerr\fi}}

%% from fleqn.clo
%%\ProvidesFile{fleqn.clo}
%%       [1998/08/17 v1.1c Standard LaTeX option
%%                                   (flush left equations)]
\newdimen\mathindent
\AtEndOfClass{\mathindent1zw}% \leftmargini
\renewcommand\[{\relax
                \ifmmode\@badmath
                \else
                 \parsep  4\p@ \@plus2\p@ \@minus\p@
                 \topsep  8\p@ \@plus2\p@ \@minus4\p@
                 \itemsep 4\p@ \@plus2\p@ \@minus\p@
                  \begin{trivlist}%
                    \@beginparpenalty\predisplaypenalty
                    \@endparpenalty\postdisplaypenalty
                    \item[]\leavevmode
                    \hb@xt@\linewidth\bgroup $\m@th\displaystyle %$
                      \hskip\mathindent\bgroup
                \fi}
\renewcommand\]{\relax
                \ifmmode
                      \egroup $\hfil% $
                    \egroup
                  \end{trivlist}%
                \else \@badmath
                \fi}
\renewenvironment{equation}%
    {\@beginparpenalty\predisplaypenalty
     \@endparpenalty\postdisplaypenalty
     \refstepcounter{equation}%
     \parsep  4\p@ \@plus2\p@ \@minus\p@
     \topsep  8\p@ \@plus2\p@ \@minus4\p@
     \itemsep 4\p@ \@plus2\p@ \@minus\p@
     \trivlist \item[]\leavevmode
       \hb@xt@\linewidth\bgroup $\m@th% $
         \displaystyle
         \hskip\mathindent}%
        {$\hfil % $
         \displaywidth\linewidth\hbox{\@eqnnum}%
       \egroup
     \endtrivlist}
\renewenvironment{eqnarray}{%
    \stepcounter{equation}%
    \parsep  4\p@ \@plus2\p@ \@minus\p@
    \topsep  8\p@ \@plus2\p@ \@minus4\p@
    \itemsep 4\p@ \@plus2\p@ \@minus\p@
    \def\@currentlabel{\p@equation\theequation}%
    \global\@eqnswtrue\m@th
    \global\@eqcnt\z@
    \tabskip\mathindent
    \let\\=\@eqncr
    \setlength\abovedisplayskip{\topsep}%
    \ifvmode
      \addtolength\abovedisplayskip{\partopsep}%
    \fi
    \addtolength\abovedisplayskip{\parskip}%
    \setlength\belowdisplayskip{\abovedisplayskip}%
    \setlength\belowdisplayshortskip{\abovedisplayskip}%
    \setlength\abovedisplayshortskip{\abovedisplayskip}%
    $$\everycr{}\halign to\linewidth% $$
    \bgroup
      \hskip\@centering
      $\displaystyle\tabskip\z@skip{##}$\@eqnsel&%
      \global\@eqcnt\@ne \hskip.8\arraycolsep \hfil${##}$\hfil&%
      \global\@eqcnt\tw@ \hskip.8\arraycolsep
        $\displaystyle{##}$\hfil \tabskip\@centering&%
      \global\@eqcnt\thr@@
        \hb@xt@\z@\bgroup\hss##\egroup\tabskip\z@skip\cr}%
      {\@@eqncr
    \egroup
    \global\advance\c@equation\m@ne$$% $$
    \@ignoretrue
    }
%%\endinput
%%
%% End of file `fleqn.clo'.

\def\@eqnnum{{\normalfont \normalcolor (\theequation)\hspace*{3mm}}}

\def\@begintheorem#1#2{%
 \settowidth{\labelwidth}{\kern-.5zw ［#1\ #2］\kern-.5zw}
 \begin{description}
  \item[\@thmlbracket #1\ #2\@thmrbracket]}

\def\@opargbegintheorem#1#2#3{%
 \begin{description}
  \item[\@thmlbracket #1\ #2\@thmrbracket （#3）\kern-.5zw]}%%
\def\@endtheorem{\end{description}}

\def\thmbracket#1#2{\gdef\@thmlbracket{#1}\gdef\@thmrbracket{#2}}
\thmbracket{\kern-.5zw ［}{］\kern-.5zw }
\def\@thmcountersep{}

\def\ack{\par{\bfseries 謝辞}\hskip1zw}

\if@NTT\else
\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else \@tempcnta\year
      \advance\@tempcnta-1988 平成
      \ifnum \@tempcnta =1 元\else\kansuji\number\@tempcnta\fi 年
      \kansuji\number\month 月\kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year\, 年\hspace{.5em}\nobreak
      \number\month\, 月\hspace{.5em}\nobreak
      \number\day\, 日
    \else \@tempcnta\year
      \advance\@tempcnta-1988 平成
      \ifnum \@tempcnta =1 元\else\number\@tempcnta\fi
        \, 年\hspace{.5em}\nobreak
      \number\month\, 月\hspace{.5em}\nobreak\number\day\, 日
    \fi
  \fi}}
\fi
%%\newcommand{\prepartname}{第}
%%\newcommand{\postpartname}{部}
%%\newcommand{\contentsname}{目 次}
%%\newcommand{\listfigurename}{図 目 次}
%%\newcommand{\listtablename}{表 目 次}
\newcommand{\refname}{文献}
%%\newcommand{\indexname}{索 引}
\newcommand{\figurename}{図}
\newcommand{\tablename}{表}
%%\newcommand{\appendixname}{付 録}
%%\newcommand{\abstractname}{概 要}

%%## citesort.sty ##%%
%% from "citesort.sty", a little customized
\newcount\@minsofar
\newcount\@min
\newcount\@cite@temp
\def\@citex[#1]#2{%
\if@filesw \immediate \write \@auxout {\string \citation {#2}}\fi
\@tempcntb\m@ne \let\@h@ld\relax \def\@citea{}%
\@min\m@ne%
\@cite{%
  \@for \@citeb:=#2\do {\@ifundefined {b@\@citeb}%
    {\@h@ld\@citea\@tempcntb\m@ne{\bfseries ?}%
    \@warning {Citation `\@citeb ' on page \thepage \space undefined}}%
{\@minsofar\z@ \@for \@scan@cites:=#2\do {%
  \@ifundefined{b@\@scan@cites}%
    {\@cite@temp\m@ne}
    {\@cite@temp\number\csname b@\@scan@cites \endcsname \relax}%
\ifnum\@cite@temp > \@min% select the next one to list
    \ifnum\@minsofar = \z@
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\else
    \ifnum\@cite@temp < \@minsofar
      \@minsofar\number\@cite@temp
      \edef\@scan@copy{\@scan@cites}\fi\fi\fi}\@tempcnta\@min
  \ifnum\@minsofar > \z@ % some more
    \advance\@tempcnta\@ne
    \@min\@minsofar
    \ifnum\@tempcnta=\@minsofar %   Number follows previous--hold on to it
      \ifx\@h@ld\relax
        \edef \@h@ld{\@citea\csname b@\@scan@copy\endcsname}%
      \else \edef\@h@ld{\ifmmode{]～[}\else]～[\fi
       \csname b@\@scan@copy\endcsname}%
      \fi
    \else \@h@ld\@citea\csname b@\@scan@copy\endcsname
          \let\@h@ld\relax
  \fi % no more
\fi}%
\def\@citea{],\penalty\@highpenalty\,[}}\@h@ld}{#1}}
%% end of citesort.sty

\def\@cite#1#2{\leavevmode\unskip
  \ifnum\lastpenalty=\z@\penalty\@highpenalty\fi% highpenalty before
  \,[{\multiply\@highpenalty 3 #1%             % triple-highpenalties within
      \if@tempswa,\penalty\@highpenalty\ #2\fi % and before note.
    }]\spacefactor\@m}

\def\onelineskip{\par\vspace{1\baselineskip}\par}
\def\halflineskip{\par\vspace{.5\baselineskip}\par}

\def\ddash{\hbox to 2zw{---\hss ---}}% \let\doubledash\ddash
\def\FRAC#1#2{\leavevmode\kern-.1em
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}
\def\RN#1{\uppercase\expandafter{\romannumeral#1}}

\def\MARU#1{\raisebox{0.1zh}{{%
 \leavevmode\ooalign{\hfil\lower.168ex\hbox{#1}\hfil\crcr\mathhexbox20D}}}}

\def\kintou#1#2{\@ifundefined{jintercharskip}%
 {\leavevmode\hbox to #1{%
   \kanjiskip\z@ \@plus 1fill \@minus 1fill\xkanjiskip\kanjiskip #2}}%
 {\leavevmode\hbox to #1{\jintercharskip\z@ \@plus 1fill \@minus 1fill
   \jasciikanjiskip\jintercharskip #2}}}

\def\ruby#1#2{\leavevmode \setbox0=\hbox{#1}\setbox1=\hbox{\tiny #2}%
 \ifdim\wd0>\wd1 \dimen0=\wd0 \else \dimen0=\wd1 \fi
 \hbox{\kanjiskip=\fill
 \vbox{\hbox to \dimen0{\tiny \hfil#2\hfil}%
  \nointerlineskip \hbox to \dimen0{\hfil#1\hfil}}}}

\def\QED{{\unskip\nobreak\hfil\penalty50
 \hskip1zw\hbox{}\nobreak\hfil \hbox{$\Box$\hskip1zw}
 \parfillskip\z@ \finalhyphendemerits\z@\par}}

\def\Hline{\noalign{\hrule height 0.4mm}}

\def\leq{\mathrel{\mathpalette\gl@align<}} \let\le\leq
\def\geq{\mathrel{\mathpalette\gl@align>}} \let\ge\geq
\def\gl@align#1#2{\lower.6ex\vbox{\baselineskip\z@skip\lineskip\z@
 \ialign{$\m@th#1\hfil##\hfil$\crcr#2\crcr=\crcr}}}
\def\subseteq{\rlap{\raisebox{.25ex}{$\subset$}}\raisebox{-1.1ex}{$=$}}
\def\supseteq{\rlap{\raisebox{.25ex}{$\supset$}}\raisebox{-1.1ex}{$=$}}
\def\neq{\mathrel{\mathpalette\c@ncelass=}}
\def\c@ncelass#1#2{\ooalign{$\hfil#1\mkern-.4mu|\hfil$\crcr$#1#2$}}
\let\ne\neq

\if@NTT\else
 \postbreakpenalty`（=10000
 \prebreakpenalty`）=10000
 \postbreakpenalty`［=10000
 \prebreakpenalty`］=10000
 \postbreakpenalty`〈=10000
 \prebreakpenalty`〉=10000
 \postbreakpenalty`【=10000
 \prebreakpenalty`】=10000
 \postbreakpenalty`〔=10000
 \prebreakpenalty`〕=10000
 \postbreakpenalty`『=10000
 \prebreakpenalty`』=10000
 \prebreakpenalty`"=10000
 \prebreakpenalty`℃=10000
 \prebreakpenalty`　=10000
 \prebreakpenalty`・=10000
 \prebreakpenalty`～=10000
 \prebreakpenalty`ー=10000
 \prebreakpenalty`？=10000
 \prebreakpenalty`！=10000
 \postbreakpenalty"5C=10000
\fi

\def\sloppy{\tolerance9999\hbadness9999\hfuzz.5\p@ \vfuzz.5\p@}

\hbadness4000
\vbadness10001
\tolerance4000\pretolerance\m@ne
\clubpenalty\z@
\widowpenalty\z@

\AtBeginDocument{%
 \displaywidowpenalty\z@
 \interdisplaylinepenalty\z@
 \predisplaypenalty\z@
 \postdisplaypenalty\z@
 %%
 \@ifundefined{@mathmargin}{\let\@mathmargin\undefined}
  {%
   \@mathmargin1zw \@plus\z@ \@minus\z@
   \def\maketag@@@#1{\hbox{\m@th\normalfont #1}\hskip3mm}%
   \def\eqref#1{\textup{\tagform@{\ref{#1}}\unskip}}%
  }%
 %% here.sty
 \@ifundefined{@HHfloat}{}{%
  \def\@HHfloat#1[H]{%
   \expandafter\let\csname end#1\endcsname\end@Hfloat
   \vskip\intextsep
   \vbox\bgroup\def\@captype{#1}\parindent\z@
   \@floatboxreset %%
   \ignorespaces}%
  \def\end@Hfloat{\egroup\vskip-1zh %%
   \vskip \intextsep}%
 }%
 %% nidanfloat
 \@ifundefined{dblbotfraction}{}{%
  \renewcommand\dblbotfraction{0.9}% 0.5
  \setcounter{dblbotnumber}{4}% 2
 }%
 %%
}

\if@tecrep
 \pagestyle{plain}
\else
 \AtEndDocument{%
  \if@letter
   \nopagebreak
   {\small\@uketsuke}\par
  \fi
  %%
  \clearpage
  \addtocounter{page}{-1}%
  \immediate\write\@auxout
   {\string\newlabel{ieicej@lastpage}{{}{\thepage}}}%
  \addtocounter{page}{1}%
  %%
  \if@cameraready
  \else
   \onecolumn
   \thispagestyle{empty}
   \ifvoid\eabstractbox\else
    \leavevmode
    \unhbox\eabstractbox\par
    \halflineskip
   \fi
   \ifvoid\ekeywordbox\else
    \leavevmode
    \unhbox\ekeywordbox
   \fi
  \fi
 }
 \pagestyle{IEICEJ}
\fi

\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
  \if@tecrep
   \raggedbottom
  \else
   \flushbottom
  \fi
\else
  \onecolumn
\fi
\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi

\endinput
