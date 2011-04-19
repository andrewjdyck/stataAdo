{smcl}
{* *! version 0.9  24August2009}{...}
{cmd:help meanpute}{right:dialog:  {bf:{dialog meanpute}}}
{hline}

{title:Title}

{p2colset 5 19 21 2}{...}
{p2col :{hi:[D] meanpute} {hline 2}}Fill in missing values (very simple){p_end}
{p2colreset}{...}


{title:Syntax}

{p 8 15 2}
{cmd:meanpute}
{depvar}
{indepvars}
{ifin}
{weight}
{cmd:,}
{opt gen:erate(newvar1)}
[{it:options}]

{synoptset 24 tabbed}{...}
{synopthdr}
{synoptline}
{syntab :Main}
{p2coldent :* {opth gen:erate(newvar:newvar1)}}generate
{it:newvar1} to contain the imputations{p_end}

{synoptline}
{p 4 6 2}
* {opt generate(newvar1)} is required.{p_end}
{p 4 4 2}
{it:indepvars} and {it:varlist} may contain time-series operators; see
{help tsvarlist}.{p_end}
{p 4 6 2}{cmd:aweight}s and {cmd:fweight}s are allowed; see {help weight}.{p_end}


{title:Description}

{pstd}{opt meanpute} fills in missing values; {depvar} is the variable whose
missing values are to be imputed.  {indepvars} is the related variables on
which the imputations are to be based, and {it:{help newvar:newvar1}} is the
new variable that contains the imputations.




{title:Also see}

{psee}
Manual:  {bf:[D] meanpute}

{psee}
Online:  {manhelp impute D}
{manhelp ipolate D},
{manhelp predict R},
{manhelp regress R}
{p_end}
