\name{prepare.data}
\alias{prepare.data}

\title{
Prepare data frame for MAR analysis
}
\description{
Formats a data frame of variable time-series for use in \code{run.mar}
}
\usage{
prepare.data(data, increment=c("month","year","week","day"), fill.gap=0, 
	replace.0s=c(FALSE,"rand.half","add.ones"),	log=FALSE, 
	z.method=c(FALSE,"standard","deseason"), order=NULL)
}

\arguments{

\item{data}{
	Data frame to be transformed: first column dates, following columns variable time-series
}

\item{increment}{
	Time-step increment data are to be averaged into: "month", "year", "week", or "day"
}

\item{fill.gap}{
	Maximum length of gap between time-steps to be filled by linear interpolation
}

\item{replace.0s}{
	How zeros in the time-series should be dealt with: \tabular{rrcl}{
		 \tab \tab "rand.half" : \tab replace zeros with random values less than 1/2 the minimum non-zero value for the variable\cr
		 \tab \tab "add.ones" : \tab add 1 to all values in time-series\cr
		 \tab \tab FALSE : \tab leave zeros in the data}
}

\item{log}{
	Should the data be log-transformed?
}

\item{z.method}{
	Standardize the data so all variables have equal means and standard deviations: \tabular{rrcl}{
		 \tab \tab "standard" : \tab subtracts the overall variable mean and divides by the overall variable standard deviation\cr
		 \tab \tab "deseason" : \tab subtracts the variable mean for the increment (across years) and divides by the variable \cr 
		 \tab \tab \tab standard deviation for the increment\cr
		 \tab \tab FALSE : \tab do not standardize the data}
}

\item{order}{
	The order in which year, month, and day are recorded in the date format in the first column of \code{data}.  Defaults to \code{NULL}, for which an attempt is made by the function to distinguish the date format, but the argument should be provided as "ymd", "mdy", etc., if the function cannot distinguish the order on its own
}

}

\details{
The \code{\link{run.mar}} function requires a data frame consisting of a continuous time-block indicator variable in the first column, dates/time-steps in the second column, and variable time-series with evenly spaced time-step increments in the remaining columns.  This function automatically creates the continuous time-block variable column and aggregates the time-series into evenly spaced increments as indicated by the \code{increment} argument.  Although it automatically tries to assess the format of the dates in \code{data}, the \code{order} argument may have to be provided if this fails (for example, in the case where all dates in the dataset fall before the 12th of each month).

Other transformations that are commonly applied to ecological data prior to MAR modeling (e.g., Hampton et al. 2006, Ives et al. 2003) can optionally be performed, but are skipped by default with their respective arguments set to FALSE.
}

\value{
A data frame with a continuous time-block indicator variable in the first column, dates/time-steps in the second column, and variable time-series with evenly spaced time-step increments in the remaining columns
}

\references{
Hampton SE, Scheuerell MD, and Schindler DE (2006) Coalescence in the Lake Washington story: Interaction strengths in a planktonic food web. Limnology and Oceanography 51:2042-2051

Ives AR, Dennis B, Cottingham KL, and Carpenter SR (2003) Estimating community stability and ecological interactions from time-series data. Ecological Monographs 73:301-330
}

\author{
LP Scheef
}

\examples{
data(L4.AllDates)
L4.mar<-prepare.data(data=L4.AllDates, increment="month", fill.gap=0, 
replace.0s="rand.half", log=TRUE, z.method="deseason")
}
