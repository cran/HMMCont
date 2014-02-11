\name{HMMCont-package}
\alias{HMMCont-package}
\alias{HMMCont}
\docType{package}
\title{
Hidden Markov Model for Continuous Observations Processes
}
\description{
The package includes the functions designed to analyse continuous observations processes with the Hidden Markov Model approach. They include Baum-Welch and Viterbi algorithms and additional visualisation functions. The observations are assumed to have Gaussian distribution and to be weakly stationary processes. The package was created for analyses of financial time series, but can also be applied to any continuous observations processes.
}
\details{
\tabular{ll}{
Package: \tab HMMCont\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2014-02-11\cr
License: \tab GPL 3\cr
}
A Hidden Markov Model (HMM) is a statistical model in which the process being modelled is assumed to be a Markov process with unobserved, i.e. hidden states. This unobserved Markov process can be revealed from an observable process that is dependent on the states of the underlying Markov process. The HMMCont package compiles the functions that can analyse the continuous observable processes (i.e. continuous in space, discrete in time) and identify the underlying two-states Markov processes. The observable process should be weakly stationary (e.g. in case of financial time series the returns, but not the prices should be analysed). The state-dependent probabilities of the observations are modelled with Gaussian probability density functions (Rabiner, 1989). The implemented analysis procedure includes: (i) setting the initial model parameters and loading the data (function \code{hmmsetcont}), repeated execution of the Baum-Welch algorithm (function \code{baumwelchcont}), and execution of the Viterbi algorithm (\code{viterbicont}). The function \code{baumwelchcont} allows to control the model parameters after each Baum-Welch iteration, and accumulates the information on the model evolution. The model object can be analysed with tailored \code{print}, \code{summary}, and \code{plot} functions (S3 methods). For details on HMMs see the publications by Viterbi (1967), Baum et al (1970), and Rabiner (1989).
}
\author{
Mikhail A. Beketov

Maintainer: Mikhail A. Beketov <mikhail.beketov@gmx.de>
}
\references{
Baum, L.E., Petrie, T., Soules, G., and Weiss, N. 1970. A maximization technique occurring in the statistical analysis of probabilistic functions of Markov chains. The Annals of Mathematical Statistics. 41: 164-171.Rabiner, L.R. 1989. A tutorial on hidden Markov models and selected applications in speech recognition. Proceedings of the IEEE. 77: 257-286.Viterbi, A.J. 1967. Error bounds for convolutional codes and an asymptotically optimum decoding algorithm. IEEE Transactions on Information Theory. 13: 260-269.
}

\keyword{ 
Hidden Markov Model
Time series
Continuous observations
Econometrics
Quantitative Finance
}
\seealso{
Functions: \code{\link{hmmsetcont}}, 
\code{\link{baumwelchcont}}, 
\code{\link{viterbicont}}, 
\code{\link{statesDistributionsPlot}}, and
\code{\link{logreturns}}.
}
\examples{
# Step-by-step analysis example.Returns<-logreturns(Prices) # Getting a stationary processReturns<-Returns*10 		# Scaling the valueshmm<-hmmsetcont(Returns) 	# Creating a HMM objectprint(hmm) 		# Checking the initial parametersfor(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is # executed 6 times and results are accumulatedprint(hmm) 		# Checking the accumulated parameterssummary(hmm) 	# Getting more detailed informationhmmcomplete<-viterbicont(hmm) # Viterbi executionstatesDistributionsPlot(hmmcomplete, sc=10) # PDFs of # the whole data set and two states are plotted par(mfrow=c(2,1))plot(hmmcomplete, Prices, ylabel="Price") plot(hmmcomplete, ylabel="Returns") # the revealed # Markov chain and the observations are plotted
}
