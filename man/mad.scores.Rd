\name{mad.scores}
\alias{mad.scores}
\title{Calculates the mad score (zscore)}
\usage{
mad.scores(data, parameter='FLATCODE', n=3, out=c('Zscore', 'label'), ...)
}
\arguments{
  \item{data}{Dataframe or Matrix of inputs for which the zscore is to be
  calculated} 
  \item{parameter}{The parameter (given by column name) on which the mad score
  is to be calculated. This is the only non-numeric column allowed.}
  \item{n}{the number of Median Absolute Deviations (MAD) from the center which
  is considered a 'mutant' or putative hit.}
  \item{out}{The desired output value, either the 'Zscore' (quantitative) or
  'label' (qualitative, 3 classes).}
  \item{...}{Other parameters.}
}
\description{
    Returns a dataframe with the desired score (e.g. Zscore) for observation
    based on the algorithm for calculating Z scores described in Lu et al 2008.
    Calculations are done based on value of \code{parameter}.
}
\details{
    Data should be presorted according to any identifiers and \code{parameter}
    as labels not used in the calculations will be removed. \code{data} should
    be a dataframe with \code{parameter} as a factor (or character) and the
    rest of the values numeric.

    Each column (other than \code{parameter}) is considered independent. Rows
    (individual responses) are extracted from \code{data} according to
    \code{parameter} and the MAD is calculated for each column (assay).
    If out = 'label', then a test is done to see if the result (Zscore) is
    greater or less than abs(\code{n}) and scored 'high' or 'low' accordingly.
    }
\value{
    \code{mad.scores} returns a dataframe containing the Zscores or labels for
    the observations. The first column will contain the \code{parameter} label.
    If data will be returned in the same order as it was input so long as a sort
    based on \code{parameter} was completed ahead of time.
}
\author{Shannon M. Bell}
\references{
  Bell SM, Burgoon LD, Last RL. MIPHENO: Data normalization
  for high throughput metabolite analysis. \emph{BMC Bioinformatics} 2012, 13(10)
  
  Lu Y, et al. New connections across pathways and cellular processes:
  Industrialized mutant screening reveals novel associations between diverse
  phenotypes in Arabidopsis. \emph{Plant Physiol} 2010, 152(2):529-540
  }
\examples{
 #See the sweave document in the corresponding paper for examples
}