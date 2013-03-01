\name{export.MAR}
\alias{export.MAR}

\title{
Export all elements of a MAR object to a new directory
}
\description{
Creates a new directory and writes all elements of an object of class \code{MAR} to that directory as csv files.
}
\usage{
export.MAR(model.out,export=TRUE)
}

\arguments{

\item{model.out}{
	Object of class \code{MAR} to be saved as csv files
}

\item{export}{
	Optionally allows the name of the new directory to be set equal to a character string.  Otherwise, the name of the new directory will be "MAR.results \emph{Sys.time}"
}

}

\details{
All elements of the given MAR class object are converted to csv format and written to a new directory created within the current working directory.  The name of the new directory can be chosen by setting the \code{export} argument equal to a character string.  If the name of the new directory matches one already present in the working directory, the name will be amended with \code{Sys.time()} to avoid overwriting the previous folder
}


\author{
LP Scheef
}


\seealso{
\code{\link{run.mar}}
}
