%
% version 0.30 for JBibTeX versions 0.30 or later, LaTeX version 2.09 or later.
% Copyright (C) 1990-2006, all rights reserved.
%
% This file is derived from btxbst.doc of BibTeX 0.99c
%
% Copying of this file is authorized only if either
% (1) you make absolutely no changes to your copy, including name, or
% (2) if you do make changes, you name it something other than sieicej.bst
%
% This restriction helps ensure that all standard styles are identical.
% The file jbtxbst.doc has the documentation for this style.
%
% Please notify (matuzaki@sanbi.co.jp, hsato@sanbi.co.jp) of any bugs in this file.
% 松崎修二 佐藤秀幸  三美印刷株式会社
%
%%% 更新情報
%%% 2009/12/24 v1.1
%%% ・bookとinbook，incollection，inproceedingsのaddressとpublisherの順番を変更
%%% ・bookでauthorとeditorを両方出現させるように変更
%%% ・bookのtitleを変換せずにそのまま出現させるように変更
%%%   今までは先頭の単語とコロンの後の単語のみ頭文字大文字としそれ以外は小文字としていた
%%% ・book，inbook，proceedingsのeditor表記でed.の前に,を入れるように変更

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    url
    volume
    year
    yomi
  }
  { is.kanji.entry }
  { label }


INTEGERS { output.state before.all mid.sentence after.sentence after.block 
after.author title.true comma.before.date misc.bool}


FUNCTION {not}
{
    { #0 }
    { #1 }
  if$
}


FUNCTION {and}
{
    'skip$
    { pop$ #0 }
  if$
}


FUNCTION {or}
{
    { pop$ #1 }
    'skip$
  if$
}


FUNCTION {init.state.consts}
{
  #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
  #4 'after.author :=

  #0 'title.true :=
  #0 'comma.before.date :=
  #0 'misc.bool :=
}


STRINGS { s t }


FUNCTION {add.kanji.period}
{
  add.period$ duplicate$
  #-1 #1 substring$ "." =
    { #-2 global.max$ substring$ "．" * }
    'skip$
  if$
}


FUNCTION {field.or.null}
{
  duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}


FUNCTION {output.nonnull}
{
  's :=
  output.state mid.sentence =
    {
      #0 title.true =
        {
          title empty$
            {
              is.kanji.entry
                { "，" * write$ newline$ }
                { ", " * write$ newline$ }
              if$
            }
            {
              title is.kanji.str$
                { "，" * write$ newline$ }
                { ", " * write$ newline$ }
              if$
            }
          if$
        }
        {
          " " * write$ newline$
          #0 'title.true :=
          #1 'comma.before.date :=
        }
      if$
    }
    {
      output.state after.block =
        {
          title empty$
            {
              is.kanji.entry
                { add.kanji.period write$ }
                { add.period$ write$ }
              if$
            }
            {
              title is.kanji.str$
                { add.kanji.period write$ }
                { add.period$ write$ }
              if$
            }
          if$
          newline$
          "\newblock " write$
        }
        {
          output.state after.author =
            {
              author empty$ editor empty$ and organization empty$ and
                {write$}
                {
                  title empty$ misc.bool #0 = and
                    {
                      author field.or.null is.kanji.str$
                      editor field.or.null is.kanji.str$ or
                      organization field.or.null is.kanji.str$ or
                        { "" * write$ newline$ }
                        { " " * write$ newline$ }
                      if$
                    }
                    {
                      author field.or.null is.kanji.str$
                      editor field.or.null is.kanji.str$ or
                      organization field.or.null is.kanji.str$ or
                        { "，" * write$ newline$ }
                        { ", " * write$ newline$ }
                      if$
                    }
                  if$
                }
              if$
              mid.sentence 'output.state :=
            }
            {
              write$
              #0 'comma.before.date :=
            }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}


FUNCTION {output}
{
  duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}


FUNCTION {output.check}
{
  't :=
  duplicate$ empty$
    {
      pop$ "empty " t * " in " * cite$ * warning$
      t "title" =
        {
          is.kanji.entry
            {"，``\textbullet\textbullet，\<'' " *}
            {", ``\textbullet\textbullet,'' " *}
          if$
          #1 'comma.before.date :=
        }
        {
          t "author" =
            {
              title empty$
                {
                  "\textbullet\textbullet" *
                }
                {
                  title is.kanji.str$
                    {"\textbullet\textbullet，" *}
                    {"\textbullet\textbullet, " *}
                  if$
                }
              if$
            }
            {
              title is.kanji.str$
                {" \textbullet\textbullet，" *}
                {" \textbullet\textbullet, " *}
              if$
            }
          if$
        }
      if$       
    }
    'output.nonnull
  if$
}


FUNCTION {output.bibitem}
{
  newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}


FUNCTION {format.series}
{
  series empty$ not
    {
      series
    }
    {
      ""
    }
  if$
}


FUNCTION {format.url}
{
  url empty$
    {
      "" *
    }
    {
      " " * url *
    }
  if$
}


FUNCTION {fin.entry}
{
  title empty$
    {
      is.kanji.entry
        { add.kanji.period }
        { add.period$ }
      if$
    }
    {
      title is.kanji.str$
        { add.kanji.period }
        { add.period$ }
      if$
    }
  if$
  format.url
  write$
  newline$
}


FUNCTION {new.block}
{
  output.state before.all =
    { after.author 'output.state := }
    'skip$
  if$
}


FUNCTION {new.sentence}
{
  output.state after.block =
    'skip$
    {
      output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}


FUNCTION {new.block.checka}
{
  empty$
    'skip$
    'new.block
  if$
}


FUNCTION {new.block.checkb}
{
  empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}


FUNCTION {new.sentence.checka}
{
  empty$
    'skip$
    'new.sentence
  if$
}


FUNCTION {new.sentence.checkb}
{
  empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}


FUNCTION {emphasize}
{
  duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}


INTEGERS { nameptr namesleft numnames hyphen string.count period zenkaku kuhaku}


STRINGS { u n }


FUNCTION {format.names}
{
  's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
  #0 'zenkaku :=

  { namesleft #0 > }
  {
    s nameptr "{ff}{ll}" format.name$ is.kanji.str$
      {
        #0 'string.count :=
        s nameptr "{ff}" format.name$ 't :=
        t empty$
          {
            s nameptr "{ll}" format.name$ 't :=
          }
          {
            s nameptr "{ff}{ll}" format.name$ 'u :=
            { u empty$ not }
            {
              u #3 global.max$ substring$ 'u :=
              string.count #1 + 'string.count :=
            }
            while$

            string.count  #3 >
              {
                s nameptr "{ff}{ll}" format.name$ 't :=
              }
              {
                s nameptr "{ff}" format.name$
                "\hskip1zw" *
                s nameptr "{ll}" format.name$ *
                't :=
              }
            if$
          }
        if$
      }
      {
        "" 'u :=
        s nameptr "{ff}{vv}{ll}{,jj}" format.name$ 'n :=
        
        { n empty$ not }
        {
          n #1 #1 substring$ is.kanji.str$
            {
              u n #1 #2 substring$ * 'u :=
              n #3 global.max$ substring$ 'n :=
              
              zenkaku #0 =
                {
                  "欧文著者名に全角文字が使われています in " cite$ * warning$
                  #1 'zenkaku :=
                }
                {}
              if$
            }
            {
              n #1 #2 substring$ " -" =
                {
                  u n #2 #1 substring$ * 'u :=
                  n #3 global.max$ substring$ 'n :=
                }
                {
                  u n #1 #1 substring$ * 'u :=
                  n #2 global.max$ substring$ 'n :=
                }
              if$
            }
        if$
        }
        while$
        
        #0 'hyphen :=
        #0 'period :=
        #0 'kuhaku :=
        "" 't :=
        
        { u empty$ not }
        {
          u #1 #1 substring$ "." =
            {
              #1 'period :=
            }
            {
              u #1 #1 substring$ "-" =
                {
                  #1 'hyphen :=
                }
                {
                  u #1 #1 substring$ " " =
                  u #1 #1 substring$ "~" = or
                    {
                      #1 'kuhaku :=
                    }
                    {
                      skip$
                    }
                  if$
                }
              if$
            }
          if$
          u #2 global.max$ substring$ 'u :=
        }
        while$
        
        hyphen #1 =
          {
            s nameptr "{f. }" format.name$ 'u :=
          }
          {
            period #1 =
            kuhaku #0 = and
              {
                s nameptr "{ff}" format.name$ 'u :=
              }
              {
                s nameptr "{f{.}. }" format.name$ 'u :=
              }
            if$
          }
        if$
        
        { u empty$ not}
        {
          u #1 #1 substring$ " " =
          u #1 #1 substring$ "~" = or
            {
              skip$
            }
            {
              t u #1 #1 substring$ * 't :=
            }
          if$
          u #2 global.max$ substring$ 'u :=
        }
        while$

        t " " * s nameptr "{vv}{ll}{, jj}" format.name$ * 't :=
      }
    if$
    
    nameptr #1 >
      {
        namesleft #1 >
          {
            is.kanji.entry
              { "，" * t * }
              { ", " * t * }
            if$
          }
          {
            t " others" =
            {
              s is.kanji.str$
                { "他" * }
                { ", et~al." * }
              if$
            }
            {
              s is.kanji.str$
                { "，" * t * }
                {
                  numnames #2 =
                    { " and " * t * }
                    { ", and " * t * }
                  if$
                }
              if$
            }
          if$
        }
      if$
      }
      't
    if$
    nameptr #1 + 'nameptr :=
    namesleft #1 - 'namesleft :=
  }
  while$
}


FUNCTION {format.authors}
{
  author empty$
    { "" }
    { author format.names }
  if$
}


FUNCTION {format.editors}
{
  editor empty$
    { "" }
    {
      editor format.names
      editor num.names$ #1 >
        {
          editor is.kanji.str$
            { "（編）\<" * }
%%%            { " eds." * }
            { ", eds." * }%%%<<< v1.1
          if$
        }
        {
          editor is.kanji.str$
            { "（編）\<" * }
%%%            { " ed." * }
            { ", ed." * }%%%<<< v1.1
          if$
        }
      if$
    }
  if$
}


FUNCTION {format.in.ed.editors}
{
  editor empty$
    { "" }
    {
      editor format.names
      editor num.names$ #1 >
        {
          editor is.kanji.str$
            {"（編）\<" *}
            {"eds.\ by " swap$ * }
          if$
        }
        {
          editor is.kanji.str$
            {"（編）\<" *}
            {"ed.\ by " swap$ *}
          if$
          }
      if$
    }
  if$
}


FUNCTION {format.string}
{
  't :=
  ""
  { t empty$ not}
  {
    t #1 #1 substring$ "." =
      {
        t #1 #2 substring$ ". " = not
          {
            t #1 #1 substring$ *
            t #2 global.max$ substring$ 't :=
          }
          {
            ".\ " *
            t #3 global.max$ substring$ 't :=
          }
        if$
      }
      {
        t #1 #1 substring$ is.kanji.str$
          {
            t #1 #2 substring$ *
            t #3 global.max$ substring$ 't :=
          }
          {
            t #1 #1 substring$ *
            t #2 global.max$ substring$ 't :=
          }
        if$
      }
    if$
  }
  while$
}


FUNCTION {format.journal}
{
  journal empty$
    {
      ""
    }
    {
      journal format.string
    }
  if$
}


FUNCTION {format.title}
{
  after.author 'output.state :=
  #1 'title.true :=
  title empty$
    { 
      ""
      #0 'title.true :=
    }
    {
      "``" title "t" change.case$ *
      #0 misc.bool =
        {
          title empty$
            {
              is.kanji.entry
                {"，\<''" * }
                {",''" * }
              if$
            }
            {
              title is.kanji.str$
                {"，\<''" * }
                {",''" * }
              if$
            }
          if$
        }
        {
          howpublished empty$
          month empty$ and
          year empty$ and
            { "''" *}
            { ",''" *}
          if$
        }
      if$
    }
  if$
}


FUNCTION {n.dashify}
{
  't :=
  ""
  { t empty$ not }
  {
    t #1 #1 substring$ "-" =
      {
        t #1 #2 substring$ "--" = not
          {
            "--" *
            t #2 global.max$ substring$ 't :=
          }
          {
            { t #1 #1 substring$ "-" = }
            {
              "-" *
              t #2 global.max$ substring$ 't :=
            }
            while$
          }
        if$
      }
      {
        t #1 #1 substring$ " " =
          {
            "" *
            t #2 global.max$ substring$ 't :=
          }
          {
            t #1 #1 substring$ is.kanji.str$
              {
                t #1 #2 substring$ *
                t #3 global.max$ substring$ 't :=
              }
              {
                t #1 #1 substring$ *
                t #2 global.max$ substring$ 't :=
              }
            if$
          }
        if$
      }
    if$
  }
  while$
}


FUNCTION {format.month}
{
    comma.before.date #1 =
      {
        title empty$
          {
            is.kanji.entry
              {"，"}
              {", "}
            if$
          }
          {
            title is.kanji.str$
              {"，"}
              {", "}
            if$
          }
        if$
      }
      {
        " "
      }
    if$

    month "Jan" =
    month "January" =
    month "1" =
    or or
      { "Jan.\" * }
      {
        month "Feb" =
        month "February" =
        month "2" =
        or or
          { "Feb.\" * }
          {
            month "Mar" =
            month "March" =
            month "3" =
            or or
              { "March" * }
              {
                month "Apr" =
                month "April" =
                month "4" =
                or or
                  { "April" * }
                  {
                    month "May" =
                    month "5" =
                    or
                      { "May" * }
                      {
                        month "Jun" =
                        month "June" =
                        month "6" =
                        or or
                          { "June" * }
                          {
                            month "Jul" =
                            month "July" =
                            month "7" =
                            or or
                              { "July" * }
                              {
                                month "Aug" =
                                month "August" =
                                month "8" =
                                or or
                                  { "Aug.\" * }
                                  {
                                     month "Sep" =
                                     month "Sept" =
                                     month "September" =
                                     month "9" =
                                     or or or
                                       { "Sept.\" * }
                                       {
                                         month "Oct" =
                                         month "October" =
                                         month "10" =
                                         or or
                                           { "Oct.\" * }
                                           {
                                             month "Nov" =
                                             month "November" =
                                             month "11" =
                                             or or
                                               { "Nov.\" * }
                                               {
                                                 month "Dec" =
                                                 month "December" =
                                                 month "12" =
                                                 or or
                                                   { "Dec.\" * }
                                                   { month * }
                                                 if$
                                               }
                                             if$
                                           }
                                         if$
                                       }
                                     if$
                                   }
                                 if$
                               }
                             if$
                           }
                         if$
                       }
                    if$
                  }
                if$
              }
            if$
          }
        if$
      }
  if$
}


FUNCTION {format.date}
{
  before.all 'output.state :=
  year empty$
    {
      #1 misc.bool =
        { "" #0 'misc.bool :=}
        {
          "there's no year in " cite$ * warning$
          month empty$
            {
              comma.before.date #1 =
                {
                  title empty$
                    {
                      is.kanji.entry
                        {"，\textbullet\textbullet"}
                        {", \textbullet\textbullet"}
                      if$
                    }
                    {
                      title is.kanji.str$
                        {"，\textbullet\textbullet"}
                        {", \textbullet\textbullet"}
                      if$
                    }
                 if$
                }
                {"\textbullet\textbullet"}
              if$
            }
            {
              format.month " \textbullet\textbullet" *
            }
          if$
        }
      if$
    }
    {
      month empty$
        {
          comma.before.date #1 =
            {
              title empty$
                {
                  is.kanji.entry
                    {"，" year * }
                    {", " year * }
                  if$
                }
                {
                  title is.kanji.str$
                    {"，" year * }
                    {", " year * }
                  if$
                }
              if$
            }
            {
               " " year *
            }
          if$
        }
        { format.month " " * year * }
      if$
    }
  if$
}


FUNCTION {format.btitle}
{
  after.author 'output.state :=
  #1 'title.true :=
  "``" title "t" change.case$ *
  title empty$
    {
      is.kanji.entry
        { "，\<''" * }
        { ",''" * }
      if$
    }
    {
      title is.kanji.str$
        { "，\<''" * }
        { ",''" * }
      if$
    }
  if$
}


FUNCTION {format.book.title}
{
  after.author 'output.state :=
  #1 'title.true :=
  title empty$
    {""}
    {
%%%      title "t" change.case$
      title %%%<<< v1.1
      title empty$
        {
          is.kanji.entry
            { "，" * }
            { ", " * }
          if$
        }
        {
          title is.kanji.str$
            { "，" * }
            { ", " * }
          if$
        }
      if$
    }
  if$
}


FUNCTION {tie.or.space.connect}
{
  duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}


FUNCTION {either.or.check}
{
  empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}


FUNCTION {format.bvolume}
{
  volume empty$
    { "" }
    {
      volume is.kanji.str$
        { volume }
        {
          is.kanji.entry
            { "第" volume * "巻" * }
            { "vol." volume * }
          if$
        }
      if$
      "volume and number" number either.or.check
    }
  if$
}


FUNCTION {format.number.series}
{
  volume empty$
    {
      number empty$
        { "" }
        {
          number is.kanji.str$
            { number }
            {"no." number * }
          if$
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            {
              "" *
            }
          if$
        }
      if$
    }
    { "" }
  if$
}


FUNCTION {format.edition}
{
  edition empty$
    { "" }
    {
      edition is.kanji.str$
        { edition }
        {
          is.kanji.entry
            { "第" edition * "版" *}
            {
              output.state mid.sentence =
                { edition "l" change.case$ " edition" * }
                { edition "t" change.case$ " edition" * }
              if$
            }
          if$
        }
      if$
    }
  if$
}


INTEGERS { multiresult }


FUNCTION {multi.page.check}
{
  't :=
  #0 'multiresult :=
  {
    multiresult not
    t empty$ not
    and
  }
  {
    t #1 #1 substring$
    duplicate$ "-" =
    swap$ duplicate$ "," =
    swap$ "+" =
    or or
      { #1 'multiresult := }
      { t #2 global.max$ substring$ 't := }
    if$
  }
  while$
  multiresult
}


FUNCTION {format.pages}
{
  pages empty$
    { "pp.\textbullet\textbullet--\textbullet\textbullet" }
%    {""}
    {
      pages multi.page.check
        { "pp." pages n.dashify * }
        { "p." pages * }
      if$
    }
  if$
}


FUNCTION {format.vol.num.pages}
{
  volume empty$
    {""}
    {
      volume is.kanji.str$
        {
          volume
        }
        {
          "vol." volume *
        }
      if$
      
      number empty$
        { 
          pages empty$
            {
              "" * 
            }
            {
              is.kanji.entry
                { "，" * }
                { ", " * }
              if$
            }
          if$
        }
        {
          title empty$
            {
              is.kanji.entry
                { "，" * }
                { ", " * }
              if$
            }
            {
              title is.kanji.str$
                { "，" * }
                { ", " * }
              if$
            }
          if$
        }
      if$
    }
  if$
  
  number empty$
    'skip$
    {
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ 
          "vol.\textbullet\textbullet, " *
        }
        'skip$
      if$
      
      number is.kanji.str$
        { number * }
        { "no." number * * }
      if$
%      volume empty$
%        { "there's a number but no volume in " cite$ * warning$ }
%        'skip$
%      if$
    }
  if$
  pages empty$
    %'skip$
    {
      volume empty$
      number empty$ and
        {
          "pp.\textbullet\textbullet--\textbullet\textbullet" *
        }
        {
          is.kanji.entry
            { "，" * }
            { ", " * }
          if$
          "pp.\textbullet\textbullet--\textbullet\textbullet" *
        }
     if$
    }
    {
      duplicate$ empty$
        { pop$ format.pages }
        {
          number empty$
            { format.pages * }
            {
              title empty$
                {
                  is.kanji.entry
                    { "，" * format.pages * }
                    { ", " * format.pages * }
                  if$
                }
                {
                  title is.kanji.str$
                    { "，" * format.pages * }
                    { ", " * format.pages * }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
}


FUNCTION {format.chapter.pages}
{
  chapter empty$
    'format.pages
    {
      type empty$
        {
          chapter is.kanji.str$
            { "" }
            {
              is.kanji.entry
                { "章" }
                { "chapter" }
              if$
            }
          if$
        }
        { type "l" change.case$ }
      if$
      chapter is.kanji.str$ not is.kanji.entry and
        { "第" chapter * swap$ * }
        {
          chapter is.kanji.str$
            { chapter * }
            { chapter tie.or.space.connect }
          if$
        }
      if$
      pages empty$
        'skip$
        {
          title empty$
            {
              is.kanji.entry
                { "，" * format.pages * }
                { ", " * format.pages * }
              if$
            }
            {
              is.kanji.entry
                { "，" * format.pages * }
                { ", " * format.pages * }
              if$
            }
          if$
        }
      if$
    }
  if$
}


FUNCTION {format.in.ed.booktitle}
{
  booktitle empty$
    { "" }
    {
      editor empty$
        { booktitle format.string }
        { booktitle format.string
          title empty$
            {
              is.kanji.entry
                { "，" * format.in.ed.editors * }
                { ", " * format.in.ed.editors * }
              if$
            }
            {
              title is.kanji.str$
                { "，" * format.in.ed.editors * }
                { ", " * format.in.ed.editors * }
              if$
            }
          if$
        }
      if$
    }
  if$
}


FUNCTION {empty.misc.check}
{
  author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$ url empty$
  and and and and and and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}


FUNCTION {format.thesis.type}
{
  type empty$
    'skip$
    {
      pop$
      type "t" change.case$
    }
  if$
}


FUNCTION {format.tr.number}
{
  type empty$
    { "Technical Report" }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}


FUNCTION {format.article.crossref}
{
  key empty$
    {
      journal empty$
        {
          "need key or journal for " cite$ * " to crossref " * crossref * warning$
          ""
        }
        {
          is.kanji.entry
            { " " journal * }
            { " " journal * }
          if$
        }
      if$
    }
    {
      title is.kanji.str$
        { " " key * }
        { "in " key * }
      if$
    }
  if$
  " \cite{" * crossref * "}" *
}


FUNCTION {format.crossref.editor}
{
  editor is.kanji.str$
    {
      editor #1 "{ff}{ll}" format.name$ duplicate$ empty$
        { pop$ editor #1 "{ll}" format.name$ }
        'skip$
      if$
    }
    { editor #1 "{f. }{vv~}{ll}{ , jj}" format.name$ }
  if$
  editor num.names$ duplicate$ #2 >
    {
      editor is.kanji.str$
        { pop$ "他" * }
        { pop$ ", et~al." * }
      if$
    }
    {
      #2 <
        'skip$
        {
          editor #2 "{f. }{vv }{ll}{, jj}" format.name$ "others" =
          {
            editor is.kanji.str$
              { "他" * }
              { ", et~al." * }
            if$
          }
          {
          editor is.kanji.str$
              {
                ", " *
                editor #2 "{ff}" format.name$ duplicate$ empty$
                  { pop$ editor #2 "{ll}" format.name$ }
                  'skip$
                if$
                *
              }
              { " and " * editor #2 "{vv~}{ll}" format.name$ * }
            if$
          }
        if$
       }
     if$
    }
  if$
}


FUNCTION {format.book.crossref}
{
  volume empty$
    {
      "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      title is.kanji.str$
        {" "}
        {"in "}
      if$
    }
    {
      volume is.kanji.str$
        { volume }
        {
          is.kanji.entry
            { "第" volume * "巻" * }
            { "vol." volume tie.or.space.connect " of " * }
          if$
        }
      if$
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    {
      key empty$
        {
          series empty$
            {
              "need editor, key, or series for " cite$ * " to crossref " * crossref * warning$
              "" *
            }
            {
              series is.kanji.str$
                { series ", " * swap$ * }
                { series * }
              if$
            }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}


FUNCTION {format.incoll.inproc.crossref}
{
  editor empty$
  editor field.or.null author field.or.null =
  or
    {
      key empty$
        {
          booktitle empty$
            {
              "need editor, key, or booktitle for " cite$ * " to crossref " * crossref * warning$
              ""
            }
            {
              booktitle is.kanji.str$
                { booktitle format.string }
                { booktitle format.string }
              if$
            }
          if$
        }
        { "in " key * }
      if$
    }
    {
      title is.kanji.str$
        { " " format.crossref.editor * }
        { "in " format.crossref.editor * }
      if$
    }
  if$
  " \cite{" * crossref * "}" *
}


FUNCTION {article}
{
  output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    {
      format.journal "journal" output.check
      format.vol.num.pages output
      format.date "year" output.check
    }
    {
      format.article.crossref output.nonnull
      format.pages output
    }
  if$
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {book}
{
  output.bibitem
%%%>>> v1.1
%%%  author empty$
%%%    { format.editors "author and editor" output.check }
%%%    {
%%%      format.authors output.nonnull
%%%      crossref missing$
%%%        { "author and editor" editor either.or.check }
%%%        'skip$
%%%      if$
%%%    }
%%%  if$
  author empty$
    {
      editor empty$
        {
          "\textbullet\textbullet, " *
          "" "empty author and editor in " * cite$ * warning$
        }
        { format.editors output}
      if$
    }
    { format.authors output }
  if$
%%%<<< v1.1
  format.book.title "title" output.check
%%%>>> v1.1
  editor empty$
    'skip$
    {
      author empty$
        'skip$
        { format.editors output }
      if$
    }
  if$
%%%<<< v1.1
  crossref missing$
    {
      format.bvolume output
      new.block
      format.number.series output
      new.block
      format.edition output
      format.series output
      publisher "publisher" output.check%%%<<< v1.1
      address output%%%<<< v1.1
    }
    {
      new.block
      format.book.crossref output.nonnull
    }
  if$
  crossref missing$
    { "" * }
    { format.edition output }
  if$
  format.date "year" output.check
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {booklet}
{
  output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  howpublished address new.block.checkb
  howpublished output
  address output
  format.date output
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {inbook}
{
  output.bibitem
  author empty$
    { format.editors "author and editor" output.check }
    {
      format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    {
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.block
      format.series output
      publisher "publisher" output.check%%%<<< v1.1
      address output%%%<<< v1.1
    }
    {
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {incollection}
{
  output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    {
      format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      new.block
      format.chapter.pages output
      format.series output
      publisher "publisher" output.check%%%<<< v1.1
      address output%%%<<< v1.1
      format.edition output
      format.date "year" output.check
    }
    {
      format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {inproceedings}
{
  output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    {
      format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      new.block
      address empty$
        {
          organization publisher new.sentence.checkb
          new.block
          organization output
          mid.sentence 'output.state :=
          new.block
          format.pages output
          format.series output
          publisher output
          format.date "year" output.check
        }
        {
          new.block
          organization output
          mid.sentence 'output.state :=
          new.block
          format.pages output
          format.series output
          publisher output%%%<<< v1.1
          address output.nonnull%%%<<< v1.1
          format.date "year" output.check
        }
      if$
    }
    {
       format.incoll.inproc.crossref output.nonnull
       format.pages output
    }
  if$
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {conference} { inproceedings }


FUNCTION {manual}
{
  output.bibitem
  author empty$
    {
      organization empty$
        'skip$
        {
          organization output.nonnull
          address output
        }
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  author empty$
    {
      organization empty$
        {
          address new.block.checka
          address output
        }
        'skip$
      if$
    }
    {
      organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {mastersthesis}
{
  output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  "Master's thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {misc}
{
  #1 'misc.bool :=
  output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  howpublished new.block.checka
  howpublished output
  format.date output
  after.block 'output.state :=
  new.block
  note output
  fin.entry
  empty.misc.check
}


FUNCTION {phdthesis}
{
  output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  "PhD thesis" format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {proceedings}
{
  output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  format.series output
  address empty$
    {
      editor empty$
        { publisher new.sentence.checka }
        {
          organization publisher new.sentence.checkb
          organization output
        }
      if$
      publisher output
      format.date "year" output.check
      after.block 'output.state :=
    }
    {
      address output.nonnull
      new.block
      editor empty$
        'skip$
        { organization output }
      if$
      publisher output
      format.date "year" output.check
      after.block 'output.state :=
    }
  if$
  new.block
  note output
  fin.entry
}


FUNCTION {techreport}
{
  output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  after.block 'output.state :=
  new.block
  note output
  fin.entry
}


FUNCTION {unpublished}
{
  output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}


FUNCTION {default.type} { misc }


MACRO {jan} {"Jan.\"}
MACRO {january} {"Jan.\"}
MACRO {feb} {"Feb.\"}
MACRO {febrary} {"Feb.\"}
MACRO {mar} {"March"}
MACRO {march} {"March"}
MACRO {apr} {"April"}
MACRO {april} {"April"}
MACRO {may} {"May"}
MACRO {jun} {"June"}
MACRO {june} {"June"}
MACRO {jul} {"July"}
MACRO {july} {"July"}
MACRO {aug} {"Aug.\"}
MACRO {august} {"Aug.\"}
MACRO {sep} {"Sept.\"}
MACRO {september} {"Sept.\"}
MACRO {oct} {"Oct.\"}
MACRO {october} {"Oct.\"}
MACRO {nov} {"Nov.\"}
MACRO {november} {"Nov.\"}
MACRO {dec} {"Dec.\"}
MACRO {december} {"Dec.\"}
MACRO {acmcs} {"ACM Comput. Surv."}
MACRO {acta} {"Acta Inf."}
MACRO {cacm} {"Commun. ACM"}
MACRO {ibmjrd} {"IBM J. Res. Dev."}
MACRO {ibmsj} {"IBM Syst.~J."}
MACRO {ieeese} {"IEEE Trans. Softw. Eng."}
MACRO {ieeetc} {"IEEE Trans. Comput."}
MACRO {ieeetcad}
{"IEEE Trans. Comput.-Aided Design Integrated Circuits"}
MACRO {ipl} {"Inf. Process. Lett."}
MACRO {jacm} {"J.~ACM"}
MACRO {jcss} {"J.~Comput. Syst. Sci."}
MACRO {scp} {"Sci. Comput. Programming"}
MACRO {sicomp} {"SIAM J. Comput."}
MACRO {tocs} {"ACM Trans. Comput. Syst."}
MACRO {tods} {"ACM Trans. Database Syst."}
MACRO {tog} {"ACM Trans. Gr."}
MACRO {toms} {"ACM Trans. Math. Softw."}
MACRO {toois} {"ACM Trans. Office Inf. Syst."}
MACRO {toplas} {"ACM Trans. Prog. Lang. Syst."}
MACRO {tcs} {"Theoretical Comput. Sci."}
MACRO {tieice} {"信学論"}
MACRO {tipsj} {"情報処理学会論文誌"}
MACRO {jipsj} {"J.~Info. Proc. Soc. of Japan"}
MACRO {jorsj} {"Journal of the O. R. Society of Japan"}


READ


FUNCTION {set.is.kanji.entry}
{
  author field.or.null is.kanji.str$
  title field.or.null is.kanji.str$ or
  editor field.or.null is.kanji.str$ or
  journal field.or.null is.kanji.str$ or
  booktitle field.or.null is.kanji.str$ or
  series field.or.null is.kanji.str$ or
  'is.kanji.entry :=
}


ITERATE {set.is.kanji.entry}

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }


FUNCTION {initialize.longest.label}
{
  "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{
  number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    {
      label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}


EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}


FUNCTION {begin.bib}
{
  preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{" longest.label * "}" * write$ newline$
}


EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}


FUNCTION {end.bib}
{
  newline$
  "\end{thebibliography}" write$ newline$
}


EXECUTE {end.bib}





