<!-- Manual title and abstract, make sure to provide maketitle -->
\title{Bare Demo of IEEEtran.cls for\\ IEEE Communications Society Journals}

<!-- author names and IEEE memberships -->
<!-- note positions of commas and nonbreaking spaces ( ~ ) LaTeX will not break -->
<!-- a structure at a ~ so this keeps an author's name from being broken across -->
<!-- two lines. -->
<!-- use \thanks{} to gain access to the first footnote area -->
<!-- a separate \thanks must be used for each paragraph as LaTeX2e's \thanks -->
<!-- was not built to handle multiple paragraphs -->

\author{
    Danh~H.~Nguyen,~\IEEEmembership{Member,~IEEE,}
    John~Doe,~\IEEEmembership{Fellow,~OSA,}
    and~Jane~Doe,~\IEEEmembership{Life~Fellow,~IEEE}% <-this % stops a space
\thanks{M. Shell was with the Department
of Electrical and Computer Engineering, Georgia Institute of Technology, Atlanta,
GA, 30332 USA e-mail: (see http://www.michaelshell.org/contact.html).}%
\thanks{J. Doe and J. Doe are with Anonymous University.}%
\thanks{Manuscript received April 19, 2005; revised August 26, 2015.}
}

<!-- The paper headers -->
\markboth{Journal of \LaTeX\ Class Files,~Vol.~14, No.~8, August~2015}
{Shell \MakeLowercase{\textit{et al.}}: Bare Demo of IEEEtran.cls for IEEE Communications Society Journals}
<!-- The only time the second header will appear is for the odd numbered pages -->
<!-- after the title page when using the twoside option. -->
<!-- *** Note that you probably will NOT want to include the author's *** -->
<!-- *** name in the headers of peer review papers.                   *** -->
<!-- You can use \ifCLASSOPTIONpeerreview for conditional compilation here if -->
<!-- you desire. -->

<!-- % If you want to put a publisher's ID mark on the page you can do it like -->
<!-- % this: -->
<!-- %\IEEEpubid{0000--0000/00\$00.00~\copyright~2015 IEEE} -->
<!-- % Remember, if you use this you must call \IEEEpubidadjcol in the second -->
<!-- % column for its text to clear the IEEEpubid mark. -->

<!-- % use for special paper notices -->
<!-- %\IEEEspecialpapernotice{(Invited Paper)} -->

\maketitle

\begin{abstract}
Abstract goes here
\end{abstract}

<!-- Keywords goes here -->
<!-- \begin{IEEEkeywords} -->
<!-- Communications Society, IEEE, IEEEtran, journal, \LaTeX, paper, template. -->
<!-- \end{IEEEkeywords} -->

<!-- For peer review papers, you can put extra information on the cover page as needed: -->
<!-- \ifCLASSOPTIONpeerreview -->
<!-- \begin{center} \bfseries EDICS Category: 3-BBND \end{center} -->
<!-- \fi -->

<!-- For peerreview papers, this IEEEtran command inserts a page break and -->
<!-- creates the second title. It will be ignored for other modes. -->
<!-- \IEEEpeerreviewmaketitle -->




