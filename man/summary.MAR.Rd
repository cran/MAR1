\name{summary.MAR}
\alias{summary.MAR}

\title{
Produce a summary of a MAR model
}
\description{
Method for producing a summary of an object of class \code{MAR}.  Calculates the number of zero, non-zero, positive, and negative coefficients in the best-fit and bootstrapped models, gives the AIC, BIC, and summary of the R^2 values for the models, and lists the calculated stability statistics associated with the models.
}
\usage{
\method{summary}{MAR}(object,...)
}

\arguments{

\item{object}{
	Object of class \code{MAR}
}

\item{...}{
	Further arguments passed to or from other methods
}

}

\author{
LP Scheef
}

\seealso{
\code{\link{run.mar}}
}
