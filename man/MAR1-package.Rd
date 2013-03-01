\name{MAR1-package}
\alias{MAR1-package}
\alias{MAR1}
\docType{package}
\title{
Multivariate Autoregressive Modeling for Analysis of Community Time-Series Data
}
\description{
Ives et al. (2003) describe the model framework implemented in this package:

\bold{X}(\var{t}) = \bold{A} + \bold{BX}(\var{t}-1) + \bold{CU}(\var{t}-1) + \bold{E}(\var{t})

The first order multivariate autoregressive model may include both variates (factors expected to affect their own dynamics and the dynamics of other variates) and covariates (factors that may affect the dynamics of variates but are unlikely to be correspondingly influenced by them).  The model estimates the value of each variate at time \var{t} as a linear function of the values of all variates and covariates at time \var{t}-1.  The coefficients estimated in the MAR model represent the relative interaction strengths between each variate and covariate included in the analysis.\cr\cr
}

\details{
The \pkg{MAR1} package includes the following basic functions:\cr

\code{\link{prepare.data}}{
  Formats a dataset into evenly-spaced time-steps and marks continuous blocks of time-steps in preparation for MAR analysis.  The data can also be log-transformed or z-scored with this function.}

\code{\link{run.mar}}{
  Searches for and estimates a MAR model for a given dataset.  The random best-fit model search and conditional least squares calculation components of this function are derived from Matlab scripts originally written by AR Ives and subsequently refined by SR Carpenter, KL Cottingham, and MD Scheuerell.  Returns a list object of class MAR for which there are \code{\link[=print.MAR]{print}}, \code{\link[=summary.MAR]{summary}}, and \code{\link[=plot.MAR]{plot}} methods.
}

\code{\link{export.MAR}}{
  Creates a new directory and exports all components of a MAR object into that directory as csv files.
}

}

\note{
This package uses the \pkg{tcltk} package to create pop-up windows.  On Mac OS X systems, installation of the \href{http://cran.r-project.org/bin/macosx/tools/tcltk-8.5.5-x11.dmg}{Tcl/Tk 8.5.5 library for X11} may be necessary before the Tcl/Tk interface can successfully load.  See \url{http://cran.r-project.org/bin/macosx/tools/} for details.
}

\author{
Lindsay P. Scheef

Maintainer: <\email{scheef@utexas.edu}>
}

\references{
Ives AR, Dennis B, Cottingham KL, and Carpenter SR (2003) Estimating community stability and ecological interactions from time-series data. Ecological Monographs 73:301-330
}
