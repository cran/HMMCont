\name{hmmcontSimul}
\alias{hmmcontSimul}

\title{
Simulation of an observation and underlying Markov processes according to a given model
}
\description{
The function simulates (i) two observation processes that correspond to the distributions of the two states in an HMM, (ii) the underlying Markov process, and (iii) an observation process that correspond to an HMM in terms of both the underlying Markov and observations processes. The function uses the last-iteration parameters, when the HMM-object was modified by function \code{baumwelchcont} previously.
}
\usage{
hmmcontSimul(hmm, n)
}

\arguments{
  \item{hmm}{
An object of the class ContObservHMM
}
  \item{n}{
Number of observations to be simulated.
}
}

\value{
The function returns an object of the class SimulContHMM that is a list comprising the two observations processes (each corresponds to the distribution of one of the two states), the Markov chain (i.e. the underlying process consisting of two states), and the observation process that correspond to that Markov chain and the two distributions. Hence, the latter is the process simulated according a given HMM.
}

\author{
Mikhail A. Beketov
}

\seealso{
Functions: \code{\link{hmmsetcont}},
\code{\link{baumwelchcont}}, and 
\code{\link{viterbicont}}.
}
\examples{

Returns<-(logreturns(Prices))*10
hmm<-hmmsetcont(Returns)
for(i in 1:6){hmm<-baumwelchcont(hmm)} 
hmmcomplete<-viterbicont(hmm)

sim<-hmmcontSimul(hmmcomplete, n=100) # simulating the processes

plot(sim$StateProcess1, type="l", ylab="State 1 Process")
plot(sim$StateProcess2, type="l", ylab="State 2 Process")
plot(sim$MarkovChain, type="l", ylab="Markov chain")
plot(sim$SimulatedObservation, type="l", ylab="Full HMM Process")
}

\keyword{ Simulation }
\keyword{ Hidden Markov Model }
