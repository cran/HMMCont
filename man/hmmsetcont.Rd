\name{hmmsetcont}
\alias{hmmsetcont}
\alias{print.ContObservHMM}
\alias{summary.ContObservHMM}
\alias{plot.ContObservHMM}

\title{
Setting an initial HMM object
}
\description{
The function sets an initial Hidden Markov Model object with initial set of model parameters. It returns the object of class ContObservHMM that can be analysed with Baum-Welch (function \code{baumwelchcont}) and Viterbi algorithms (\code{viterbicont}).
}
\usage{
hmmsetcont(Observations, Pi1 = 0.5, Pi2 = 0.5, A11 = 0.7, A12 = 0.3, 
A21 = 0.3, A22 = 0.7, Mu1 = 5, Mu2 = (-5), Var1 = 10, Var2 = 10)

\method{print}{ContObservHMM}(x, ...)
\method{summary}{ContObservHMM}(object, ...)
\method{plot}{ContObservHMM}(x, Series=x$Observations, 
ylabel="Observation series", xlabel="Time", ...)

}

\arguments{
  \item{Observations}{
Vector of observations (class "numeric"), a weakly stationary process (e.g. returns time series).
}
  \item{Pi1}{
Initial probability of state 1.
}
  \item{Pi2}{
Initial probability of state 2.
}
  \item{A11}{
Initial transition probability from state 1 to state 1.
}
  \item{A12}{
Initial transition probability from state 1 to state 2.
}
  \item{A21}{
Initial transition probability from state 2 to state 1.
}
  \item{A22}{
Initial transition probability from state 2 to state 2.
}
  \item{Mu1}{
Initial mean for Gaussian PDF for state 1.
}
  \item{Mu2}{
Initial mean for Gaussian PDF for state 2.
}
  \item{Var1}{
Initial variance for Gaussian PDF for state 1.
}
  \item{Var2}{
Initial variance for Gaussian PDF for state 2.
}

\item{x}{
An object returned by the function \code{hmmsetcont}. }
\item{object}{
An object returned by the function \code{hmmsetcont}. }
\item{Series}{
Observations time series to be plotted along the Markov states. }
\item{ylabel}{
Y axis label. }
\item{xlabel}{
X axis label. }
\item{...}{Not used. }
}


\value{
The function returns an object of the class ContObservHMM that is a list comprising the observations, tables accumulating the model parameters and results after each Baum-Welch iterations (i.e. after each execution of the function \code{baumwelchcont}), table for the state sequence derived by the Viterbi algorithm (function \code{viterbicont}), and table of the b-probabilities. The object can be analysed with the class-specific functions \code{print}, \code{summary}, and \code{plot}.
}

\author{
Mikhail A. Beketov
}
\seealso{
Functions: \code{\link{baumwelchcont}}, 
\code{\link{viterbicont}}, and
\code{\link{statesDistributionsPlot}}.
}
\examples{

Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values

hmm<-hmmsetcont(Returns) 	# Creating a HMM object
print(hmm) 					# Checking the initial parameters

for(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is 
# executed 6 times and results are accumulated
hmmcomplete<-viterbicont(hmm) # Viterbi execution
print(hmm) 		# Checking the accumulated parameters
summary(hmm) 	# Getting more detailed information
par(mfrow=c(2,1))
plot(hmmcomplete, Prices, ylabel="Price") 
plot(hmmcomplete, ylabel="Returns") # the revealed 
# Markov chain and the observations are plotted
}

\keyword{ Hidden Markov Model }
\keyword{ Time series }
