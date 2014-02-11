\name{baumwelchcont}
\alias{baumwelchcont}

\title{
Baum-Welch Algorithm
}
\description{
The function performs Baum-Welch algorithm with Gaussian PDFs (Baum et al, 1970; Rabiner, 1989). It allows to control the model parameters after each iteration, and accumulates the information on the model evolution. The intended use is to perform repeated executions and to save the returned object into the argument object (see examples below).
}
\usage{
baumwelchcont(hmm)
}

\arguments{
  \item{hmm}{
An object of the class ContObservHMM.
}
}

\value{
An object of the class ContObservHMM (see section on the function \code{hmmsetcont}). After sufficient number of iterations the object can be used to derive the Markov states sequence by the Viterbi algorithm (function \code{viterbicont}). The object can be analysed with the class-specific functions \code{print}, \code{summary}, and \code{plot}.
}
\references{
Baum, L.E., Petrie, T., Soules, G., and Weiss, N. 1970. A maximization technique occurring in the statistical analysis of probabilistic functions of Markov chains. The Annals of Mathematical Statistics. 41: 164-171.

Rabiner, L.R. 1989. A tutorial on hidden Markov models and selected applications in speech recognition. Proceedings of the IEEE. 77: 257-286.

}
\author{
Mikhail A. Beketov
}
\seealso{
Functions: \code{\link{hmmsetcont}}, 
\code{\link{viterbicont}}, and
\code{\link{statesDistributionsPlot}}.
}
\examples{

Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values
hmm<-hmmsetcont(Returns) 	# Creating a HMM object
print(hmm) 					# Checking the initial parameters

hmm<-baumwelchcont(hmm) 	# First iteration
print(hmm)					# Inspecting

for(i in 1:5){hmm<-baumwelchcont(hmm)} # Subsequent iterations 
print(hmm)					# Inspecting

hmmcomplete<-viterbicont(hmm) # Viterbi execution
par(mfrow=c(2,1))
plot(hmmcomplete, Prices, ylabel="Price") 
plot(hmmcomplete, ylabel="Returns") # the revealed 
# Markov chain and the observations are plotted
}

\keyword{ Baum-Welch }
\keyword{ Hidden Markov Model }
