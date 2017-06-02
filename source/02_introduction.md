# Introduction

<!-- What's the topic -->
Network densification---the practice of
deploying more radio access nodes
into a geographical area---is being considered
as a cost and bandwidth-effective method
to increase wireless network capacity [@Bhushan2014]. 
<!-- -->
In a dense heterogeneous network,
small-cell systems,
(also known as _femtocells_)
co-exist and cooperate
with high-power macrocells
to serve users' traffic demands.
<!-- What's the problem? -->
To mitigate the interference problem
in such a dense deployment,
many advanced management techniques
have been proposed,
including those that use
_antenna directionality_ [@Niu2015].
<!-- -->
By using directional antennas,
small-cell network nodes
can focus energy
in only the intended direction,
thereby creating less interference between links
and more potential for spatial reuse.
<!-- -->
Nevertheless, 
bringing these techniques to practice 
has been challenging 
for two reasons: 
_(i)_ the difficulty of
integrating directional antennas
into the existing wireless physical layer (PHY) and medium access control (MAC) stack
of small cells, which typically use
either Long-Term Evolution (LTE)-based 
or 802.11-based signaling for user data links,
and _(ii)_ the lack of 
robust antenna beam-steering (or beam selection) techniques
that can cope well 
with the wireless channel's stochastic nature
and dynamics in the operating environment of small cells. 

![System model of a small-cell network with high spatial reuse through directionality](images/linkpursuit_sysarch.png){#fig:overview}

<!-- What are the key components of your approach? -->
In this paper
we explore a low-overhead and efficient way
to integrate directionality
into wireless small-cell operations
using _compact, electronically reconfigurable antennas_.
<!-- -->
Unlike beamforming techniques
that employ multiple Radio Frequency (RF) chains
to achieve directionality,
reconfigurable antennas
integrate multiple miniature radiating elements
on a single device,
thereby producing
several distinct radiation patterns
without any additional RF circuitry.
<!-- -->
This makes reconfigurable antennas
immediately applicable for use
with client-side mobile devices,
which usually have a single RF chain
and can use only one antenna at a time.
<!-- -->
To make small-cell interference management practical
with reconfigurable antennas,
we propose LinkPursuit,
a novel wireless network design
that deploys reinforcement learning-based antenna state[^1] selection methods
on top of a synchronous MAC protocol
and adapts well to environmental changes.

[^1]: Here, antenna state refers
to a specific radiation pattern of the antenna
and is used interchangeably
with antenna mode or direction. 

<!-- Related Work and novelty -->
The challenge of designing
efficient MAC protocols
with directional antennas
for wireless ad hoc networks
has been well studied (see [@Dai2013] for a survey).
<!-- -->
A substantial number of
directional MAC protocols
in the literature
belong to the contention-based,
random access category.
<!-- -->
Our work focuses on
building a directional MAC protocol
that coordinates
contention-free directional transmissions and receptions
to occur simultaneously in an optimal way.
<!-- -->
Along this line,
DIRC [@Liu2009] and MiDAS [@AmiriSani2010] systems
also explore multi-beam adaptive antenna systems
for simultaneous transmissions in the same time slot.
<!-- -->
However, unlike ours, these approaches rely heavily
on protocol coordination
to assess and schedule antenna directions
and are usually not resilient
to intermittent environmental changes.

Stochastic online learning
using reinforcement learning algorithms
has recently gained significant attention
in the wireless community [@Gai2010; @Mukherjee2012].
<!-- -->
The body of work on applying multi-armed bandit (MAB)
formulation in wireless communications is also rich,
encompassing spectrum sensing and secondary user access [@Gai2010],
as well as antenna subset selection [@Mukherjee2012].
<!-- -->
However, these studies are still primarily theoretical and simulation-based.
<!-- -->
An experimental study using MAB
with real measured channels
can be found in [@Gulati2014]
for the problem of antenna state selection,
but the learning process also appears to progress offline on channel traces. 
<!-- -->
Furthermore, the proposed antenna selection policies 
assume a non-varying channel condition,
which is not suitable for real-world deployment.
<!-- -->
In contrast,
we focus on modifying a powerful reinforcement learning policy
to operate in real time
and adapt well
to dynamic interference conditions.


<!-- Summarize contributions, again -->
Our contributions in this paper are three-fold:
<!-- contribution 1 -->
First, we present the LinkPursuit wireless architecture,
which employs reconfigurable antennas
and a Time-Division Multiple Access (TDMA) MAC 
to achieve simultaneous directional transmission and reception
for interference avoidance and spatial reuse.
<!-- LinkPursuit applicability -->
For antenna orientation,
LinkPursuit relies on reinforcement learning
to dynamically select
in each time slot
the optimal antenna states
at both the transmitter and receiver link ends
with negligible protocol overhead.
<!-- -->
The system model for LinkPursuit is shown in [@fig:overview].
<!-- -->
Second, we propose
a concrete and robust antenna state selection method
for use in LinkPursuit.
<!-- -->
Unlike prior applications
of reinforcement learning in this area,
we formulate 
the antenna state selection task
as a non-stationary MAB problem,
wherein the reward generating processes 
associated with the bandit's arms 
undergo changes over time. 
<!-- -->
Our solution uses 
a well-known selection policy
called _adaptive pursuit_ [@Thierens2005],
which we carefully tailor
to the distributed nature of a wireless link
where decisions need to be split
between the transmitter and receiver.
<!-- -->
At each decision-making epoch, 
a network node decides 
on an active antenna mode 
based on observations of the outcomes 
from previous choices, 
with the objective to identify 
the optimal antenna state 
which maximizes the Packet Delivery Ratio (PDR).
<!-- -->
Third, we implement LinkPursuit
on the Wireless open-Access Research Platform (WARP)\ [@WARP]
and conduct a series of
real-time over-the-air experiments indoor
to quantify its performance
with respect to
both omnidirectional transmission
and less practical antenna state selection schemes.
<!-- -->
The empirical results show that 
appropriate use of directionality in LinkPursuit
can result in higher network sum rates
in dense small-cell deployments,
delivering on an average 70% increase in network-sum PDR
over omnidirectional transmission
under various degrees of interference. 

The paper is organized as follows: 
<!-- -->
[@sec:linkpursuit-system-architecture] describes LinkPursuit system architecture.
<!-- -->
We present in details
the antenna selection protocol of LinkPursuit
in [@sec:antenna-selection-protocol].
<!-- -->
[@sec:implementation-and-evaluation] describes our experimental methods and results.
<!-- -->
Finally, we conclude the paper in [@sec:conclusion-and-future-work].     




