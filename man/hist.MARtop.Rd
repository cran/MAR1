\name{hist.MARtop}
\alias{hist.MARtop}

\title{
Plot histogram of AIC values of top MAR models
}
\description{
Plots a histogram of the AIC values of the best-fit models contained in the \code{$top.bestfit} component of an object of class \code{MAR}
}
\usage{
\method{hist}{MARtop}(x, ...)
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
The AIC values of the top best-fit models are plotted as a frequency histogram.  A blue asterisk indicates the AIC value of the selected best-fit model.
}

\value{
A graphics device containing the histogram of top best-fit model AIC values
}


\author{
LP Scheef
}

\seealso{
\code{\link{plot.MARtop}}

}
