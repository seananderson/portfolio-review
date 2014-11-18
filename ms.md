<!--- clarify the whole/partial asset thing — focus on examples - de-emphasize
soundness of metaphor - add concrete suggestions of when given tools are
appropriate - more description of final empirical figs - change title - remove
’unifying lens’ terminology - go into more detail in warnings of mean-variance
PE stuff - don’t coin ecological portfolio theory? - tweak didactic figure
(indicate that bear can switch streams and fan out management for Chinook to
encompass all) -->

<!--- Line 154: Unevenness in what? And presumably some optimal tradeoff was
found rather than simultaneously maximizing/minimizing both quantities?-->

<!--- Line 184: Can a 1998 citation really be “recent literature”? - Line
224-225: I am not sure I understand this sentence – if whole asset-->

<!--investment means that an investor owns(? or at least, invests in) the
entirety of an asset, how can the asset have multiple investors – how can they
both be invested in the entirety rather than each partially invested? I could
see how each of the investors could have the entirety of their own resources in
a single shared asset, but that is not the situation described in lines
216-217.-->

<!--- make recommendations more direct - define I found myself looking for a
deeper insight or more direct recommendation for moving forward here. I was a
bit confused by this whole section. Some challenges to a vaguely defined goal
of “applying portfolio theory” are described, but I don’t see solutions or even
recommendations of specific situations to avoid trying to apply portfolio
theory.-->

<!--The ins and outs of financial theory for ecology.-->

# Abstract

Portfolio terminology has been increasingly used in conservation biology since
the late 1990s; however, there lacks a unified consideration of its strengths
and weaknesses across its many applications. Here, we review three contrasting
applications of ecological portfolio theory. We show how ecological portfolios
have been used as *metaphors* to communicate the benefit of biological
diversity, as *metrics* to compare the benefits of diversification across
systems and through time, and as *management tools* to make robust conservation
decisions in the face of environmental uncertainty. We illustrate how
ecological portfolios can unite a wide variety of existing ecological theories
— theories that explain portfolio structure, causes of diversification and
portfolio dynamics, and the risk-reduction consequences of biological
diversity. However, there are many possible issues with applying portfolio
theory to conservation biology. First, we illustrate how the way we invest in
ecological portfolios (e.g. a metapopulation) can fundamentally differ from
financial portfolios. For example, conservation practitioners typically invest
in the entirety of biological assets (e.g. a population), whereas financial
investors usually buy portions of financial assets (e.g. stocks in a company).
Second, we consider differences between biological and financial data in terms
of frequency, duration, interdependence, synchrony, and measurement error.
These differences call for a careful evaluation of how we apply ecological
portfolio theory. Finally, we consider opportunities with ecological
portfolios. We emphasize the largely unexplored potential to apply portfolio
optimization to conservation planning and decision making. We then introduce
how downside financial risk metrics could benefit conservation biology by
measuring specific properties of risk, and illustrate these metrics by applying
them to sockeye salmon stocks (*Oncorhynchus nerka*) in the Fraser River,
British Columbia, Canada. We conclude by outlining key questions for ecological
portfolio theory to address in the coming years.

# Introduction

In the coming century we face a loss of biodiversity on the order of 100–10,000
times greater than average rates in the fossil record [@mea2005] — a rate as
fast if not faster than any of the five past mass extinctions [@barnosky2011].
Compounding this problem for conservation managers is uncertainty in future
climate conditions [@heller2009] and the unknown responses of species and
communities to those conditions [@lavergne2010]. Therefore, urgent questions
are: Exactly how big a problem is the loss of biodiversity for the stability of
ecological systems? How can conservation biologists communicate the insurance
benefit of biodiversity to the public and policy makers? And, how can we apply
limited conservation funds to manage biodiversity and limit risk in the face of
increasing environmental uncertainty?

Nearly a decade ago, @figge2004 and @koellner2006 laid the foundation for why
financial portfolio theory is ideally suited for answering these questions.
Financial portfolio theory seems applicable to ecological systems for at least
four reasons. (1) Ecological and financial systems are both structured
hierarchically. Groups of populations form metapopulations and groups of
species form communities; groups of financial assets form investment funds,
which in turn form portfolios. (2) Ecological and financial managers have
similar goals. Conservation practitioners might wish to maximize productivity
and minimize the probability of ecological collapse; financial portfolio
managers maximize expected financial returns and minimize the probability of
large economic losses [@may2008]. (3) Substantial resources have gone into
developing mathematical theory for optimizing financial investments. There is
therefore a rich body of theory and experience to draw from. (4) The portfolio
metaphor is an engaging and accessible way for ecologists and conservationists
to think about ecological variance and biological diversity and convey the
importance of this (often abstract) literature.

A number of recent studies have used financial portfolios as a metaphor,
metric, or management approach (Fig. \ref{fig:traits}) to estimate and
communicate the stabilizing benefit of diversity and prioritize its
conservation [e.g. @schindler2010; @ando2011; @halpern2011; @hoekstra2012;
@anderson2013; @mellin2014]. For example, @moore2010 used the portfolio
metaphor to show how increased synchrony of salmon populations could lead to
heightened extinction risk. @thibaut2012 used the portfolio-effect metric to
quantify the insurance benefit of diversity for reef fish communities.
@ando2012 used portfolio optimization to prioritize habitat for conservation
that would create wetlands most robust to climate-change uncertainty. Portfolio
theory promises to move conservation biology beyond the familiar concepts of
the quantity, variety, and distribution of species [@mace2005] and into a new
dimension that emphasizes elements of variance, covariance, stability, and
synchrony [@loreau2010a].

But in applying financial theory to conservation biology, where does the
portfolio metaphor break down? What exactly are the assets, portfolios, and
investors in the financial metaphor? Further, in a changing world how might one
invest in different kinds of ecological portfolios? Is the metaphor precise
enough to generate ecological portfolio indices and use portfolio theory to
actively manage or conserve ecological systems? And how might the differences
between financial and ecological data affect our ability to apply financial
portfolio theory to conservation biology? Are ecological portfolios just
another name for existing ecological theory? Or, can ecological portfolios
bring together and provide new insights into a wide variety of ecological
theory?

Here, we address these questions by reviewing the rapidly emerging literature
on ecological portfolios. The purpose of our review is fourfold: (1) Review the
three recent contrasting applications of ecological portfolios as metaphors,
metrics, and management tools. (2) Illustrate how ecological portfolios can
bring together a wide variety of modern ecological theory. (3) Highlight the
imprecision of the metaphor given how we invest in financial and ecological
portfolios and how data from the two fields differ. (4) Emphasize the utility
of portfolio optimization and risk metrics for conservation prioritization.

# Ecological portfolios as a metaphor

Metaphors are powerful tools for communicating and shaping scientific ideas
[@brown2003] and are particularly useful in developing and communicating the
field of conservation biology [@larson2011]. In conservation biology, the
portfolio concept has long been used as a metaphor to emphasize the need to not
put all your eggs in one basket. This metaphor has come into particular
prominence in the last decade. For example, the IUCN Criterion B2a recognizes
the risks associated with a species existing in few locations [@iucn2001]. As
another example, ecologists have suggested the need to develop a portfolio of
approaches when tackling a conservation issue as a bet hedging strategy [e.g.
@ehrlich2008]. Ecologists have also used the metaphor to loosely refer to
diverse ecosystems and communities as portfolios of species [@figge2004]. These
applications are an appealing way to convey concepts of diversification,
uncertainty, and risk using familiar terminology. On the surface the metaphor
seems intuitive; however, recent studies have pressed the metaphor further as
both a metric and management tool [e.g. @moore2010; @schindler2010;
@halpern2011; @ando2012] and the question remains how far we can take the
metaphor before it breaks down [@anderson2013].

# The portfolio-effect metric

Beyond the metaphor, the portfolio-effect metric asks what the precise benefit
is of a unit increase in biodiversity. The portfolio effect is derived from the
economic question: How much better off are you by investing your money in a
diversified portfolio instead of investing all your money in a single asset
[@markowitz1952]? In conservation biology, we consider the current ecological
system the diversified portfolio and a theoretical homogeneous (or monoculture)
system the single asset [@anderson2013]. For example, we could ask how much
more stable is a metapopulation of salmon from different streams, rivers, or
watersheds (the portfolio) compared to a theoretical homogeneous stream
population (the single asset) [@schindler2010; @carlson2011]. Hence, to
accurately measure a portfolio effect we need to predict the variability of a
theoretical homogeneous system — a system that lacks the element of
biodiversity we are interested in. Unfortunately, although the portfolio
metaphor provides a new lens through which to view the diversity-stability
relationship, on its own it remains unclear whether it provides new insights
about the nature of the relationship itself.

Nonetheless, by providing a new lens, the portfolio effect as a metric has
created an impetus for new theoretical and empirical insights into
stability-diversity relationships. Early work focused on theoretical aspects of
the portfolio effect for greatly simplified systems — identifying when we would
expect a stabilizing portfolio effect and what factors would enhance it
[@doak1998; @tilman1998; @lehman2000]. Over time theoretical studies developed
indices that relaxed assumptions about the systems they describe [e.g.
@loreau2010a; @thibaut2013]. Furthermore, integrating numerous theories from
the last decade, @thibaut2013 reduced the portfolio effect to a
weighted-average effect of variability and a synchrony effect. A recent trend
has been to apply these indices to empirical data, albeit primarily to salmon
[@greene2010; @schindler2010; @carlson2011; @anderson2013; @mellin2014].
However, empirical work has concentrated on applying relatively simple
portfolio-effect metrics that make strong assumptions that are rarely met in
empirical systems [@thibaut2013; @anderson2013]. Violation of these assumptions
can strongly distort our perception of the portfolio effect and hence the
perceived benefit of diversity to ecological stability [@anderson2013].

# Ecological portfolio management

In addition to measuring the portfolio-effect metric, we can use financial
portfolio theory to inform decisions about conservation management. Markowitz's
seminal contribution to financial portfolio theory was a focus on portfolio
selection — the idea that out of all possible portfolios there exists a subset
that optimize a risk-return trade-off [@markowitz1952] (Fig. \ref{fig:mpt}). In
conservation biology, the goals of conservation practitioners often parallel
those of financial managers, even though they are rarely expressed as such
[@figge2004]. We see ecological portfolio management happening in one of three
ways: (1) considering and promoting existing management structures that promote
diversified portfolios, (2) using Modern Portfolio Theory (MPT) to optimize
ecological resource extraction, or (3) using MPT to optimize an ecological
system itself.

First, we can consider existing management structures that create systems
analogous to diversified portfolios. For example, fishers can engage in
catch-pooling cooperatives where fishers share the profits from their catches
according to predefined rules. @sethi2012 showed that this portfolio-like
scheme reduces risk for red king crab fishers in the Bering Sea by up to 40%.
Other fisheries management tools, such as community-based management,
individual transferable quotas (ITQs), and licensing systems that allow for
fishing a diversity of species, can create diversified catch portfolios for
fishers and buffer fishers against the risk of poor profits [@hilborn2001;
@kasperski2013]. Alternatively, we can consider the properties of a diversified
portfolio, such as representation, resilience, and redundancy, and look for
management strategies that promote these properties in ecological systems
[@haak2012]

Second, we can use MPT directly to optimally allocate harvesting efforts. This
suggestion is not new — some of the earliest references to ecological
portfolios suggest portfolio theory as a management tool [@baldursson1997;
@costanza2000] but few studies have explored the idea to its full extent and
interest in the topic has expanded strongly in recent years [e.g.
@edwards2004; @sanchirico2008; @halpern2011; @moloney2011]. In conservation
biology, portfolio optimization can be applied spatially. For example,
@halpern2011 used MPT to maximize fishing profits while minimizing spatial
unevenness. MPT has also been used to optimize decisions about whether to
clearcut or retain standing trees [@hyytiainen2008; @hildebrandt2011]. As a
third example, @moloney2011 used MPT to optimize the choice of grazing animals
on Australia's rangelands. With few exceptions, however, the application of MPT
for harvesting decisions has been limited to fishery and forestry examples.

Third, we can use ecological portfolio management to choose how we allocate
conservation efforts to manage risk for an ecological system as a whole. For
example, portfolio optimization can be used to spatially allocate conservation
activity for wetlands to maximize ecosystem services while minimizing
uncertainty due to climate change [@ando2011; @ando2012]. In forestry, MPT has
been used to select the optimal weighting of seed sources for regenerating
forests under a variety of climate change scenarios [@crowe2008]. We see this
as a promising but largely unexplored use of ecological portfolio theory, and
we revisit this topic in the *Opportunities* section of this paper.

# Ecological theory to draw from

Portfolio theory can unite many existing ecological theories (Table
\ref{tab:theory}). For example, community ecology, the theory of island
biogeography, metapopulation dynamics, and functional-group ecology can all
generate portfolio-like ecological structure. Importantly, the portfolios
produced by these scenarios have specific features, which affect portfolio
dynamics. For example, in community portfolios, predator assets can eat prey
assets, which has no direct equivalent in financial portfolios. In
metapopulation portfolios, subpopulation assets can exchange individuals
between each other and rescue subpopulation assets at low abundance or value.

Other ecological theories can inform expected patterns of diversification and
portfolio dynamics (Table \ref{tab:theory}). For instance, the Moran effect
suggests that ecological assets that are further apart from each other are more
likely to experience diverse environments and therefore provide greater
portfolio diversification. The unified neutral theory of biodiversity and
biogeography asks what we would observe if species were functionally
equivalent. We can think of this neutral community as an undiversified
portfolio and compare it to observed communities to examine the benefit of
functional diversity. This comparison is analogous to the portfolio-effect
metric in recent literature [e.g. @doak1998; @schindler2010; @anderson2013].

Finally, a variety of mechanisms can generate ecological portfolio
diversification (Table \ref{tab:theory}). For example, intraspecific trait
variation, response diversity, and even personality variation can be thought of
as sources of portfolio diversification. Ecological portfolios therefore can
have multiple levels of diversification, just as financial portfolios can be
diversified across multiple levels such as investment types, geography,
business sectors, and companies. Ecological-portfolio research can focus on one
or multiple levels of diversification. Whereas research on many of these
ecological disciplines typically exists in its own niche, ecological portfolio
theory encourages us to consider many elements in conjunction.

<!--The definition of an asset in ecological portfolios has been broad. Recent work has, for example, considered protected areas [@ando2012], salmon abundance [@greene2010; @moore2010; @schindler2010; @carlson2011; @yeakel2014], moth abundance [@anderson2013], reef fish abundance [@anderson2013; @mellin2014], and shark habitat [@yates2012] as assets in ecological portfolios. But we have only begun to see the types of ecological assets that can be considered. -->

<!--An ecological example would be a fisher allocating harvesting resources into fishing a suite of species [@baldursson1997; @edwards2004; @kasperski2013]. Alternatively, a grizzly bear might consume fish from a number of streams (Fig. \ref{fig:salmonport}a). -->

# Attributes of financial and ecological data

Ecological and financial data differ in many fundamental ways that will affect
how financial portfolio theory can be applied to ecological systems (Table
\ref{tab:data}). For example, ecological data are often of short duration,
recorded at low frequency (e.g. each year), and often contain missing values.
Financial data, on the other hand, can be recorded by the minute for decades
and rarely contain missing values. Econometric techniques built to manage
high-frequency irregularly-spaced financial data [e.g. @hautsch2012] may not
apply to much of today's ecological data. However, these techniques may become
increasingly useful as similar types of ecological data become more common
[e.g. the Ocean Tracking Network, @cooke2011]. Another difference between
financial and ecological data, is that ecological data often include
considerable measurement error that adds uncertainty around the true value of
ecological assets. Financial stock returns, however, reflect the trading value
of a stock by definition. Therefore, to accurately apply financial portfolio
optimization to ecological portfolios, we may need to adopt methods that can
incorporate measurement error. Solutions may include Bayesian modelling, Monte
Carlo simulation, and state space models [@morgan1990].

# Opportunities

## Ecological portfolio optimization

A central focus of financial portfolio theory is selecting an optimal weighting
of assets to maximize return for a given level of risk or minimize risk for a
given level of return [@markowitz1952]. In this paper, we have discussed
optimizing ecological resource use to improve the income of ecological resource
harvesters. However, we have mentioned only two examples of portfolio
optimization that benefit a purely conservation outcome [@crowe2008;
@ando2012]. We suggest taking the ecological portfolio management concept to
its logical extension: consider optimizing portfolios of ecological assets with
the goal of maximizing ecological productivity while minimizing the risk of low
productivity.

Any ecological scenario that produces time series analogous to typical
financial stock time series may be a candidate for ecological conservation
portfolio optimization. Population growth rate within a metapopulation context
is one possibility and will generally represent a stationary time series in the
same way that the first difference of returns are frequently used in financial
portfolio analysis (Fig. \ref{fig:risk}). The central issue with applying
conservation-oriented ecological portfolio optimization will be deciding what
precisely constitutes “investment” and how that investment re-allocation will
occur. For example, if the abundance of fish stocks is considered investment
how does one increase or decrease that investment through time
(Fig. \ref{fig:salmonport})? Perhaps these adjustments could be made through
changes in harvesting limits, stock supplementation, or habitat restoration.
Realistic re-investment strategies may be taxa, region, or case-specific, and
are thus far mostly unexplored.

## Ecological risk metrics

Risk assessment is a critical component to biological conservation and
management [@burgman2005]. Conservation biology has typically used metrics of
symmetric variability such as the standard deviation or the coefficient of
variation of a time series [e.g. @greene2010] and sometimes loosely referred to
the result as risk; but, risk specifically refers to both the probability of an
undesired event happening and the magnitude of loss associated with that event
[@morgan1990; @burgman2005 Fig. \ref{fig:risk}]. For example, if a precise
outcome is unknown or variable but can only end positively, it presents little
risk. Therefore, ecological risk metrics should allow for an asymmetry in this
loss function [@reckhow1994]. Furthermore, recent work in ecology has noted the
frequency and influence of “ecological surprises” [@lindenmayer2010; @doak2008]
and counterintuitive responses of populations to management [@pine-iii2009].
Therefore, like financial risk metrics, ecological risk metrics should allow
for long-tailed probability distributions [@hummel2009]. The financial
literature is rich with methods to rapidly assess the risk properties of time
series — methods that are particularly useful when used as part of portfolio
optimization [@rachev2008].

Recent financial literature has focused on downside risk metrics [@ang2006],
which emphasize the probability of an undesired event; we see great opportunity
for their application in conservation biology (Fig. \ref{fig:risk}). A variety
of downside risk metrics measure different properties of risk. Therefore, how
do different metrics reflect the goals of different “investors” in ecological
portfolios? Conservation organizations, for example, may be concerned with
avoiding catastrophic single years that could influence future productivity or
have downstream effects on predators or prey. They might use the probability of
ruin, which measures the probability of an event worse than some threshold
occurring [@vasicek1987] or the conditional value-at-risk (CVaR) to
characterize the average magnitude of an extremely bad event
[@rockafellar2002; @sethi2012a; @sethi2012b]. Resource users, on the other
hand, might wish to minimize year-to-year fluctuations to ensure a stable
income. Their interests could be reflected in the semideviation or
semivariance, which characterizes the typical “badness” or severity of an event
[@markowitz1959; @sethi2012a; @sethi2012b]. Moving forward, a fruitful area of
research may be matching risk metrics to specific conservation-management goals
[@sethi2012a].

# Outlook

Ecological portfolio theory is still a young discipline and there exist many
important future questions to address: For example:

1.  Across taxa, geography, and time, how pervasive is the stabilizing
    ecological portfolio effect and what factors affect its strength? Recent
    work suggests the effect may vary greatly across systems, but the general
    pervasiveness and the factors that promote it remain largely unclear
    [@anderson2013; @mellin2014].

2.  How can the portfolio effect and portfolio optimization inform management
    and conservation and in what other contexts can it be applied? For
    instance, how might portfolio optimization inform the debate about the
    advantages of forming single large or several small reserves (SLOSS)? As
    another example, what can portfolio optimization tell us about managing the
    recovery of impacted ecological systems?

3.  How can we integrate established principles of conservation management with
    portfolio theory? Furthermore, what elements of portfolio theory can we
    integrate with traditional principles of ecological management?

4.  How can we move Ecological portfolio theory beyond an academic exercise to
    using its principles in applied management? Recent work has shown clear
    theoretical advantages to ecological conservation that considers MPT
    [@crowe2008; @ando2012], but, to our knowledge, MPT has yet to be
    integrated into real-word conservation planning.

In conclusion, we emphasize the importance of thinking about ecological
portfolios from all dimensions — as metaphors, metrics, and management tools.
In particular, management, or specifically the application of ecological
portfolio concepts to decision making, represents an exciting area of research
that conservation biology has just begun exploring. Ecological portfolios can
apply to a wide variety of ecological assets, ecological investors, and
investment styles, but we need to carefully consider both imprecision in the
metaphor and how fundamental differences between financial and ecological data
may restrict the financial portfolio methods we can apply in conservation
biology. Ecological Portfolio Theory's greatest strength may be that it unites
a wide variety of ecological theories along with concepts of risk, uncertainty,
and variability. Critically, it unites these sometimes-abstract variance
concepts in a way that can be clearly communicated to conservation managers and
the public.

# Acknowledgements

We thank T.A. Branch, J.W. Moore, and S.M. O'Regan for comments and discussions
on earlier drafts. We thank M.P. Beakes for help developing the Fraser River
map. Funding was provided by Simon Fraser University, NSERC (ABC, NKD, SCA),
the Canada Research Chairs Program (NKD), Fulbright Canada (SCA), and a
Garfield Weston Foundation/B.C. Packers Ltd. Graduate Fellowship in Marine
Sciences (SCA).
