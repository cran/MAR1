\name{ss.mar1}
\alias{ss.mar1}

\title{
Fit a state-space MAR model using the MARSS package.
}
\description{
Uses a fitted MAR object from the function \code{run.mar} and an aggregated data.frame from the function \code{transform.data} to fit a state-space MAR model.  The bestfit model in the MAR object is used to determine where the 0s are in the B and C matrices.  Users can specify the form of the observation error variance-covariance matrix (R) and process error variance-covariance matrix (Q).
}
\usage{
ss.mar1(aggregated.data, MAR.obj=NULL, model=list(), control=list(), silent=FALSE)
}

\arguments{

\item{aggregated.data}{
	Data frame with continuous time-block variable in first column, ordered by dates in second column, followed by columns of taxa abundance time-series.  This type of data frame is output by the function \code{transform.data}.
}
\item{MAR.obj}{
A fitted MAR.obj as output by the function \code{\link{run.mar}}.
}
\item{model}{
An optional list with elements B, C, Q, or R that specify the form of those matrices.  For Q and R, a numeric matrix can be used in which case Q or R will be fixed to those values.  The text string ``unconstrained'' can be used for Q to specify that all elements are estimated (the default).  The text string ``diagonal and equal'' can be used for Q or R to specify that the variance-covariance matrix is diagonal with one variance on the diagonal. The text string ``diagonal and unequal'' can be used for Q or R to specify that the variance-covariance matrix is diagonal but the variances on the diagonal are unconstrained.  The text strings ``zero'' and ``identity'' can also be used for R or Q to specify those matrix forms. B and Q can be passed into the model list in order to use a B or C matrix other than the bestfit B and C in \code{MAR.obj}.  In this case B and C must be a numeric matrix with 0s in the elements that will be fixed at 0.  All non-zero values will be estimated. See ?MARSS (after installing the MARSS package) for a discussion of the model argument.
}

\item{control}{
	A list of control elements for the MARSS package functions.  The most useful may be \code{minit} to set a minimum number of iterations and \code{maxit} to set a maximum number of iterations.
}
\item{silent}{
 If FALSE, the output from the MARSS fitting function is suppressed.
}
}
\details{
The functions fits a simple observation model where each species in the B matrix is assumed to be observed with independent observation error.  The covariates are assumed to be observed with no error.  Missing variates and covariates are allowed.

The B and C matrices are constrained by default by the bestfit model in the \code{MLE.obj}.  ss.mar1 will use the 0 locations in the bestfit model and constrain those B and C elements to be 0.  Other B or C matrices can be passed in via the model argument and will override this behavior.
}

\references{
The MARSS User Guide:  Holmes, E. E., E. J. Ward, and M. D. Scheuerell (2012) Analysis of multivariate time-series using the MARSS package. NOAA Fisheries, Northwest Fisheries Science
Center, 2725 Montlake Blvd E., Seattle, WA 98112.  Available at \url{http://cran.r-project.org/web/packages/MARSS/index.html}.
}

\author{
Eli Holmes
}

\examples{
\dontrun{
## These examples take 1-2 minutes to run

## construct a MAR model using 'run.mar' arguments to set variables and restrictions ##

data(L4.mar)

myvar<-c(0,0,0,1,1,0,0,0,1,1,1,1,0,0,1,1,0,0,2,2,2)  # 8 variates, 3 covariates
myres<-matrix(0.5,nrow=length(which(myvar==1)),
  	ncol=length(which(myvar!=0)))  # no restrictions (all 0.5)

run1<-run.mar(L4.mar, variables=myvar, restrictions=myres, search="exhaustive")

#control can be passed in to limit the number of iterations run.
ss.fit=ss.mar1(L4.mar,run1,control=list(maxit=50))

#compare to best fit model
ss.fit$B
run1$bestfit$B

#Use a known observation error
R=diag(0.2,8)
ss.fit=ss.mar1(L4.mar,run1,model=list(R=R),control=list(maxit=50))
}
}
