\name{L4.AllDates}
\alias{L4.AllDates}
\docType{data}
\title{
L4 plankton abundance time-series
}
\description{
This dataset is a plankton abundance time-series collected at the Western Channel Observatory L4 station.  It contains zooplankton abundances in #/m^3, phytoplankton abundances in #/ml, and sea surface temperature in degrees C.  Sampling dates for zooplankton, phytoplankton, and surface temperature values are not always aligned, resulting in NA values within the time-series.
}
\usage{data(L4.AllDates)}
\format{
  A data frame with 1123 observations on the following 20 variables.
  \tabular{rll}{
    \tab \code{date} \tab sampling dates; often read into R as a factor variable\cr
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
    \tab \code{surface.temp} \tab sea surface temperature (degrees C)\cr
  }
}

\source{
http://www.westernchannelobservatory.org.uk/data.php
}
\references{
Eloire D, Somerfield PJ, Conway DVP, Halsband-Lenk C, Harris R, and Bonnet D (2010) Temporal variability and community composition of zooplankton at station L4 in the Western Channel: 20 years of sampling. Journal of Plankton Research 32:657-679 [doi:10.1093/plankt/fbq009]

Southward AJ, Langmead O, Hardman-Mountford NJ, Aiken J, Boalch GT, Dando PR, Genner MJ, Joint I, Kendall MA, Halliday NC, Harris RP, Leaper R, Mieszkowska N, Pingree RD, Richardson AJ, Sims DW, Smith T, Walne AW, and Hawkins SJ (2005) Long-term oceanographic and ecological research in the western English Channel. Advances in Marine Biology 47:1-105 [doi:10.1016/S0065-2881(04)47001-1]

Scheef, LP, DE Pendleton, SE Hampton, SL Katz, EE Holmes, ME Scheuerell, and DG Johns (2012) Assessing marine plankton community structure from long-term monitoring data with multivariate autoregressive (MAR) models: a comparison of fixed station vs. spatially distributed sampling data. Limnology & Oceanography: Methods 10:54-64.
}

\seealso{
\code{\link{L4.mar}}
}

\examples{
data(L4.AllDates)
summary(L4.AllDates)
}

\keyword{datasets}
