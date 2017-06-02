<!-- Manual title and abstract, make sure to provide maketitle -->
\title{Reinforcement Learning System Design to Mitigate Small-Cell Interference through Directionality\vspace{-3mm}}

<!-- author names and affiliations -->
\author{
    \IEEEauthorblockN{
    Anton Paatelma\IEEEauthorrefmark{1}\IEEEauthorrefmark{2},  
    Danh H. Nguyen\IEEEauthorrefmark{2}, 
    Harri Saarnisaari\IEEEauthorrefmark{1}, Nagarajan Kandasamy, and Kapil R. Dandekar}
    \IEEEauthorblockA{\IEEEauthorrefmark{1} CWC, University of Oulu, Finland. Email: anton@paatelma.com, harri.saarnisaari@ee.oulu.fi} 
    \IEEEauthorblockA{Drexel University, Philadelphia, PA.
    Email: \{dnguyen, kandasamy, dandekar\}@drexel.edu}
    \IEEEauthorblockA{\IEEEauthorrefmark{2} Co-primary Authors\vspace{-4mm}} 
    }

\maketitle

\begin{abstract}
% What's the topic
Beam-steering techniques 
using directional antennas  
are expected to play an important role
in wireless network capacity expansion 
through ubiquitous small-cell deployment. 
% What's the problem
However, integrating directional antennas
into the existing wireless PHY and MAC stack of small cells
has been challenging
due to the added protocol overhead
and lack of a robust antenna beam selection technique
that can adapt well to environmental changes.
% Why no one has solved it better?
% What's the big idea?
This paper presents the design, implementation, and evaluation
of LinkPursuit, a novel learning protocol 
for distributed antenna state selection 
in directional small-cell networks.
%
LinkPursuit relies on reconfigurable antennas
and a synchronous TDMA MAC to achieve simultaneous
directional transmission and reception.
%
Further, the system employs a practical
antenna selection protocol
based on the well known adaptive pursuit algorithm
from the reinforcement learning literature.
% How you go about doing the research
We implement
a real-time prototype of LinkPursuit
on the WARP platform
and conduct extensive experiments to evaluate its performance.
%
The empirical results show that 
appropriate use of directionality
in LinkPursuit
can result in higher network sum rates
than omnidirectional transmission
under various degrees of cross-link interference.
\end{abstract}
