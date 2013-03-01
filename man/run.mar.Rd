\name{run.mar}
\alias{run.mar}

\title{
Initiate MAR analysis
}
\description{
Allows the user to select variables and restrict interactions, finds best-fit MAR model, and applies a bootstrap to the best-fit model
}
\usage{
run.mar(data, variables=NULL, restrictions=NULL, search=c("random","exhaustive",
	"fwdstep","exhaustive.true"), boot=500, ntop=10, export=FALSE)
}

\arguments{

\item{data}{
	Data frame with continuous time-block variable in first column, ordered by dates in second column, followed by columns of taxa abundance time-series
}

\item{variables}{
	A vector as long as the number of columns in \code{data} indicating how each taxon column should be assigned 
	for the analysis (first two values for the time-block and date columns should be 0):
	\itemize{
	\item 0 :\code{   }  not included
	\item 1 :\code{   }  included as a variate
	\item 2 :\code{   }  included as a covariate}
	Alternatively, an object of class \code{MAR} resulting from a previous call to 
	\code{run.mar} from which to extract variable assignments
}

\item{restrictions}{
	A matrix with \var{n} variate rows and \var{n} variate + \var{n} covariate columns of values indicating 
	the potential of a direct effect of each column variable on each row variable: 
	\itemize{
	\item 0.5 :\code{ }  possible (may be included in model)
	\item 0 :\code{   }  unlikely/implausible (won't be included in model)
	\item 1 :\code{   }  probable (will be included in model)}
	Alternatively, on object of class \code{MAR} resulting from a previous call to 
	\code{run.mar} from which to extract interaction restrictions
}

\item{search}{
	A character string indicating the type of search that should be used to find the best-fit model; either "random" (default), "exhaustive", "fwdstep", or "exhaustive.true"; see "Details" section below for descriptions of search types
}

\item{boot}{
	Either an integer indicating the number of iterations that should be performed in the model bootstrap 
	or \code{FALSE} to skip bootstrapping
}

\item{ntop}{
	If \code{search="random"}, \code{"exhaustive"}, or \code{"exhaustive.true"}, the number of top best-fit models from the random search to be returned for potential comparison to the selected best-fit model
}

\item{export}{
	If set to TRUE, a call to \code{\link{export.MAR}} is executed at the end of the analysis.  \code{export.MAR} creates a new directory and saves all components of the MAR model object in that directory as csv files
}

}

\details{
\bold{Variables and Constraints:} \cr

If the \code{variables} or \code{restrictions} arguments are not provided, the function creates 
windows that allow the user to pick which column variables in \code{data} should be included in the MAR model as variates or covariates and to set restrictions on potential interactions between model variables.  Unless the \code{variables} argument is provided in the function call, the \code{restrictions} argument must be \code{NULL}.  \cr 

\bold{Search Types:} \cr

If \code{search="random"}, which is the default, a random search is performed to find the best-fit model (as determined by AIC) for the included variate time-series.  For each variate, 100 random models are constructed according to the restrictions that were set, and the model with the lowest AIC of these models is retained.  This process is repeated 100 times, resulting in 100 "best-of-100" models.  If any variable occurs in less than 15 of the 100 "best-of-100" models, that variable is discarded (i.e., the probability of that variable occurring in the random search is set to 0) and the search is repeated until the number of variables in successive searches remains constant (resulting in at least 2 search iterations per variate unless all variables are retained in the first iteration).  The model with the lowest AIC of the final 100 "best-of-100" models is retained.  \cr 

If \code{search="exhaustive"}, a search through possible models for each variate with respect to \code{restrictions} is performed using a leap and bound algorithm (Furnival and Wilson,1974) to find the "best-fit" (lowest AIC) model of all potential variable combinations without explicitly examining all possible subsets.	\cr

If \code{search="fwdstep"}, the best-fit model for each variate is built up from the NULL intercept model by sequentially adding whichever variable most improves the model AIC from the pool of potential variables.  The model from the series with the lowest AIC is retained.	\cr

If \code{search="exhaustive.true"}, a true exhaustive search through all potential variable combinations with respect to \code{restrictions} is performed.	\cr

\bold{Statistics:}

The coefficients of the final "best-fit" MAR model for all variates are attained using least-squares estimation.  The coefficients of the B- and C-matrices represent interaction strengths of the column variables on the row variables.  If the data were z-scored prior to analysis (see \code{\link{prepare.data}}), the A intercept values will not be significantly different from 0.  Estimates of the stationary distribution mean and covariance for each variate, of the process errors, and of community stability (resilience and reactivity) are calculated following Ives (2003).  If \code{bootstrap} is not set to FALSE, these statistics are also calculated for the bootstrapped model.
}

\value{
Returns a list of class \code{MAR} containing:

  \item{variables.selected	}{corresponds to \code{variables} argument}
  \item{restrictions.set	}{corresponds to \code{restrictions} argument}
  \item{search.type			}{corresponds to \code{search} argument}
  \item{search.time.s		}{time (in seconds) the best-fit model search took} \cr

And for each of \code{$bestfit} and \code{$bootstrap}:
  \item{A					}{each row is the a-value for the variate}
  \item{B					}{B-matrix interaction coefficients of columns on rows}
  \item{C					}{C-matrix interaction coefficients of columns on rows}
  \item{log.likelihood		}{log.likelihood value for model}
  \item{AIC					}{AIC value for model}
  \item{BIC					}{BIC value for model}
  \item{R2.values			}{\var{R}^2 and conditional \var{R}^2 values for each variate} \cr
  
  \item{stationary.distribution}{
    \code{mean       } means of variates' stationary distributions \cr
    \code{covariance } covariance matrix of stationary distribution
  } \cr

  \item{process.errors}{
    \code{ } \cr
	\code{residuals   } E					\cr
	\code{covariance  }	sigma				\cr
	\code{corrmatrix  }	correlation matrix
  } \cr

  \item{stability}{\code{ }}
  \item{\code{ }\code{ }\code{ }\code{ }\code{ }\code{ }\code{ }\code{ }resilience}{
		\code{eigB       } eigenvalues of the B matrix \cr
		\code{detB       } determinant of the B matrix \cr
		\code{maxeigB    } max eigenvalue of B matrix \cr
		\code{maxeigkrB  } max eigenvalue of B matrix kronecker products}
	\item{\code{ }\code{ }\code{ }\code{ }\code{ }\code{ }\code{ }\code{ }reactivity}{
		\code{sigma.over.Vinf  } -tr(sigma)/tr(Vinf) \cr
		\code{maxeigBxB        } max eigenvalue of B'B matrix  ("worst-case" reactivity) 
  } \cr
								
If bootstrapping is not performed, \code{$bootstrap} will be NULL.  Otherwise, in addition to the statistics above, \code{$bootstrap} will also contain a \code{$limits} list with the upper and lower 95\% confidence limits of the best-fit model elements.

If \code{search="random"}, \code{"exhaustive"}, or \code{"exhaustive.true"}, the result will also contain \code{$top.bestfit}, an array of the top best-fit models tested during the model search (the first of which is the best-fit model that was selected).  The number of top models returned may be less than the value set for the \code{ntop} argument if \code{ntop} exceeds the potential number of model configurations that can be tested for the selected variables and search method.  The dimension of the array in which each top best-fit model is stored is named by its respective AIC value.
}

\references{
Furnival GM, Wilson Jr RW (1974) Regressions by leaps and bounds. Technometrics 16:499-511

Ives AR, Dennis B, Cottingham KL, and Carpenter SR (2003) Estimating community stability and ecological interactions from time-series data. Ecological Monographs 73:301-330
}

\author{
LP Scheef
}


\section{Warning}{
The "random" model search may select different best-fit models when run multiple times on the same data, particularly for searches including a large number of variables.

The "exhaustive.true" search can become very time-consuming for models with more than 12 variables.
}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
\code{\link{prepare.data}}, \code{\link{plot.MAR}}, \code{\link{export.MAR}}

Packages used for exhaustive search methods:\cr
\code{\link{leaps}}, \code{\link{bestglm}}

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

run1  # only some elements of the object are printed
str(run1) # to see all elements
summary(run1) # some summary statistics for the model
plot(run1)

# set a few restrictions on taxa interactions
myres[1,c(1,6,9)]<-c(1,0,0)  # included, not included, not included

# re-run the analysis with same variates as 'run1' and new restrictions
run1b<-run.mar(L4.mar,run1,myres,"exhaustive")
plot(run1,run1b)

# 'run1' variables and restrictions with a different search method
run1c<-run.mar(L4.mar,run1,run1,"fwdstep")
plot(run1,run1c,legend=TRUE)  # plot with legend

## construct a MAR model using windows to select variables and restrictions ##
run2<-run.mar(L4.mar,search="exhaustive")
run2
summary(run2)
plot(run2)
}
}
