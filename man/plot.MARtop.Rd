\name{plot.MARtop}
\alias{plot.MARtop}

\title{
Plot coefficients of top MAR models
}
\description{
Plots the coefficients of the best-fit models contained in the \code{$top.bestfit} component of an object of class \code{MAR}
}
\usage{
\method{plot}{MARtop}(x, ...)
}

\arguments{

\item{x}{
	The \code{$top.bestfit} component of an object of class \code{MAR}
}

\item{...}{
	Further arguments passed to or from other methods
}

}

\details{
The \bold{B}- and \bold{C}-matrix coefficients of the top best-fit models are plotted as a grid of bar graphs, with the selected best-fit model represented by the top-most set of bars.
}

\value{
A graphics device containing the coefficient plot
}


\author{
LP Scheef
}

\seealso{
\code{\link{run.mar}}

}
