\name{L4.mar}
\alias{L4.mar}
\docType{data}
\title{
L4 plankton abundance time-series prepared for MAR modeling
}
\description{
Plankton abundance data collected at the Western Channel Observatory L4 station, formatted for use in \code{\link{run.mar}}.  The dataset was prepared for MAR analysis with a call to \cr
\code{\link{prepare.data}(data=L4.AllDates, increment="month", fill.gap=0, replace.0s="rand.half",} \cr
\code{log=T, z.method="deseason")}
}
\usage{data(L4.mar)}
\format{
  A data frame with 179 observations on the following 21 variables.
  \tabular{rll}{
    \tab \code{contin} \tab a numeric vector where matching values indicate blocks of continuous sampling dates\cr
    \tab \code{date} \tab dates\cr
    \tab \code{cnidarian} \tab e.g., hydromedusae and siphonophores\cr
    \tab \code{amphipod} \tab e.g., gammarids\cr
    \tab \code{chaetognath} \tab \emph{Sagitta spp.}\cr
    \tab \code{krill} \tab Euphausiids (all stages)\cr
    \tab \code{pteropod} \tab \emph{Clione} and \emph{Limacina}\cr
    \tab \code{tunicate} \tab larvaceans\cr
    \tab \code{cladoceran} \tab \emph{Evadne spp.} and \emph{Podon spp.}\cr
    \tab \code{calanoid.lg} \tab large calanoid copepods (>2 mm)\cr
    \tab \code{calanoid.sm} \tab small calanoid copepods (<2 mm)\cr
    \tab \code{cyclopoid} \tab cyclopoid copepods\cr
    \tab \code{poecilostom} \tab poecilostomatoid copepods\cr
    \tab \code{harpact} \tab harpacticoid copepods\cr
    \tab \code{diatom} \tab phytoplankton: diatoms\cr
    \tab \code{dino} \tab phytoplankton: dinoflagellates\cr
    \tab \code{other.algae} \tab phytoplankton: e.g., coccolithophores, green\cr
    \tab \code{cirripedia} \tab meroplankton: barnacle nauplii and cyprids\cr
    \tab \code{mero.grazers} \tab meroplankton: other grazers, e.g., gastropod and bivalve larvae\cr
    \tab \code{decapod} \tab meroplankton: e.g., crab and shrimp larvae\cr
    \tab \code{surface.temp} \tab sea surface temperature\cr
  }
}

\source{
http://www.westernchannelobservatory.org.uk/data.php
}
\seealso{
\code{\link{L4.AllDates}},	\code{\link{prepare.data}}
}

\examples{
data(L4.mar)
summary(L4.mar)
}

\keyword{datasets}
