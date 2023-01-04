local ls = require("luasnip")
local s = ls.s -- snippet
local i = ls.i -- insert node
local t = ls.t -- text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {},{}

local group = vim.api.nvim_create_augroup("Lua Snippets", { clear = true })
local file_pattern = "*.tex"


local frac_snip = s("fr", fmt([[
\frac{{{}}}{{{}}}
]],--really messy, because to escape { we need {{
{
  i(1, ""),
  i(2, ""),
}))
table.insert(snippets, frac_snip)


local tbold = s("tbf" , fmt([[
\textbf{{{}}}
]],
{
  i(1,""),
}))
table.insert(snippets,tbold)


local titalic = s("tit" , fmt([[
\textit{{{}}}
]],
{
  i(1,""),
}))
table.insert(snippets,titalic)

local mitalic = s("mit" , fmt([[
\textit{{{}}}
]],
{
  i(1,""),
}))
table.insert(snippets,mitalic)

local mbold = s("mbf" , fmt([[
\mathbf{{{}}}
]],
{
  i(1,""),
}))
table.insert(snippets,mbold)

local box = s("bx" , fmt([[
\[
  \boxed {{
      {}
  }}
\]
]],
{
  i(1,""),
}))
table.insert(snippets,box)

local begin_aligns = s("ba*",fmt([[
\begin{{align*}}
  {}
\end{{align*}}
]],
{
  i(1,"")
}))
table.insert(snippets,begin_aligns)

local begin_align = s("ba",fmt([[
\begin{{align}}
  {}
\end{{align}}
]],
{
  i(1,"")
}))
table.insert(snippets,begin_align);

local partial_func = s("dp", fmt([[
\frac{{\partial {}}}{{\partial {}}}
]],
{
  i(1, ""),
  i(2, ""),
}))
table.insert(snippets, partial_func)

local dpfrachigher = s(
{trig = "dp([%w_]+)", regTrig = true, hidden = false},fmt([[
\frac{{\partial^{} {}}}{{\partial {}^{}}}
]],
{
  d(1,function(_,snip)
    return sn(1,i(1,snip.captures[1]))
  end),
  i(2,""),
  i(3,""),
  rep(1),
}))
table.insert(snippets,dpfrachigher)

local dfrachigher = s(
{trig = "dd([%w_]+)", regTrig = true, hidden = false},fmt([[
\frac{{d^{} {} }}{{d{}^{}}}
]],
{
  d(1,function(_,snip)
    return sn(1,i(1,snip.captures[1]))
  end),
  i(2,""),
  i(3,""),
  rep(1),
}))
table.insert(snippets,dfrachigher)

local sqrt = s(
{trig = "sq", regTrig = true, hidden = true},fmt(
[[
\sqrt{{{}}}
]],
{
  i(1,"arg"),
}))
table.insert(snippets,sqrt)


local highroot = s(
{trig = "rt([%w_]+)", regTrig = true, hidden = true},fmt(
[[
\sqrt[\leftroot{{-3}}\uproot{{3}} {}]{{{}}}
]],
{
  d(1,function(_,snip)
    return sn(1,i(1,snip.captures[1]))
  end),
  i(2,""),
}))
table.insert(snippets,highroot)


local begin = s("bg",fmt([[
\begin{{{}}}
  {}
\end{{{}}}
]],
{
  i(1, ""),
  i(2,""),
  rep(1),
}))
table.insert(snippets,begin)

local inline_math = s("$",fmt([[
${}$
]],
{
  i(1,""),
}))
table.insert(autosnippets,inline_math)

local mathy = s("\\[", fmt([[
\left[{}\right]
]],
{
  i(1,"")
}))
table.insert(autosnippets,mathy)

local parenthesis = s("\\(", fmt([[
\left({}\right)
]],{
  i(1,""),
}))
table.insert(autosnippets,parenthesis)

local vector = s("vv", fmt([[
\vec{{{}}}
]],
{
  i(1,""),
}))
table.insert(autosnippets,vector)

local underbrace = s("und", fmt ([[
\underbrace{{{}}}_{{{}}}
]],
{
  i(1,""),
  i(2,"")
}))
table.insert(snippets,underbrace)

local derivative = s("dd" , fmt([[
\frac{{d{}}}{{d{}}}
]],
{
  i(1,""),
  i(2,"")
}))
table.insert(snippets,derivative)

local integral = s("int", fmt([[
\int_{{{}}}^{{{}}}
]],
{
  i(1,""),
  i(2,"")
}))
table.insert(snippets,integral)

local ointegral = s("oint", fmt([[
\oint_{{{}}}{{{}}}
]],
{
  i(1,""),
  i(2,"")
}))
table.insert(snippets,ointegral)


--Snippet for starting a new exercise list
local exercises_initializer = s(
{trig="exec_init",hidden=true},fmt([[

\documentclass[14pt]{{exam}}
\usepackage{{amsthm}}
\usepackage{{libertine}}
\usepackage[utf8]{{inputenc}}
\usepackage[margin=1in]{{geometry}}
\usepackage{{amsmath,amssymb}}
\usepackage{{multicol}}
\usepackage[shortlabels]{{enumitem}}
\usepackage{{siunitx}}
\usepackage{{cancel}}
\usepackage{{graphicx}}
\usepackage{{pgfplots}}
\usepackage{{listings}}
\usepackage{{tikz}}
\usepackage{{tabularray}}


\pgfplotsset{{width=10cm,compat=1.9}}
\usepgfplotslibrary{{external}}
\tikzexternalize

\newcommand{{\dgr}}{{^{{\circ}}}}
\newcommand{{\class}}{{{}}} % This is the name of the course
\newcommand{{\examnum}}{{{}}} % This is the name of the assignment
\newcommand{{\numUSP}}{{}}
\newcommand{{\timelimit}}{{}}


\begin{{document}}
\pagestyle{{plain}}
\thispagestyle{{empty}}

\noindent
\begin{{tabular*}}{{\textwidth}}{{l @{{\extracolsep{{\fill}}}} r @{{\extracolsep{{6pt}}}} l}}
\textbf{{\class}} & \textbf{{Name:}} & \textit{{{}}}\\ %Your name here instead, obviously
\textbf{{\examnum}} &&\\
\textbf{{\numUSP}} & \textbf{{Número USP}}: & \textit{{{}}} \\
\end{{tabular*}}\\
\rule[2ex]{{\textwidth}}{{2pt}}
% -----------------------------------------

{}



\end{{document}}
]],
{
  i(1,"name"),
  i(2,"Nmr USP"),
  i(3,"title"),
  i(4,"number"),
  i(5,"")
}))
table.insert(snippets,exercises_initializer)


local rangle = s(
{trig="ln",hidden=false},fmt([[
\langle {} \rangle
]],
{
  i(1,"")
}))

table.insert(snippets, rangle)
local mathcal = s(
{trig="mc", hidden = false},fmt([[
\mathcal{{{}}}
]],
{
  i(1,"")
}))
table.insert(snippets, mathcal)




local limit = s(
{trig="lim", hidden = true},fmt([[
  \lim_{{{}\rightarrow {}}}
]],
{
  i(1, ""),
  i(2, "")
}))
table.insert(snippets, limit)

local exp = s(
{trig = "e", hidden = false},fmt([[
  exp\left\{{{}\right\}}
  ]],
  {
    i(1,"")
  }))
table.insert(snippets,exp)

local ang_bracket = s(
{trig = "\\{" , hidden = true} , fmt ( [[
\left\{{{}\right}}
]],
{
  i(1,"")
}))
table.insert(autosnippets,ang_bracket)


return snippets, autosnippets
