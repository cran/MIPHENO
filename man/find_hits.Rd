\name{find_hits}
\alias{find_hits}
\title{Identification of putative hits using Zvalues or MIPHENO empirical pval}
\usage{
  find_hits(data=data, ID= 'LOCUS', source=NULL, values=list(start=11, stop=21),
  var.cuts=FALSE, low.cut=NULL, high.cut=NULL, cutoff=0.05, Z=NULL, ...)
}
\arguments{
  \item{data}{Dataframe containing a column of identifiers and column(s) of
  assay data providing scores to determine if an individual is a putative hit.}
  \item{ID}{The name of the column containing individual identifiers. Must
  contain same values or as \code{source}.}
  \item{source}{A list of individuals (contained in \code{data}) to be tested
  to see if they are a hit.}
  \item{values}{Values (or columns) in \code{data} that are to be used to
  determine if an observation is a putative hit.}
  \item{var.cuts}{Logical, will variable cutoffs be used for each of the
  assays (columns)? Must provide high.cut and low.cut if TRUE}
  \item{low.cut}{A list of values (same length as the number of assay columns)
  giving the MAXIMUM value for an observation to be considered BELOW 'normal'.}
  \item{high.cut}{A list of values (same length as the number of assay columns)
  giving the MINIMUM value for an observation to be considered ABOVE 'normal'.}
  \item{cutoff}{p value below which observations are considered a putative hit.}
  \item{Z}{ Z score which is considered a hit.}
  \item{...}{Other parameters.}
}
\description{
    Returns a dataframe containing all the 'hits' here 2 or more observations in
    \code{source} and/or in \code{ID} passing the threshold set by the supplied
    criteria.
}
\details{
    This function uses data coming out of the \code{\link{cdf.pval}} function or
    data with Zscores. Suggestions for using pvalue data are given below.
    The whole data object can be used, including if there are additional
    descriptors. \code{ID} refers to the identifier for individuals. Does not
    need to be unique. \code{source} is optional and contains a list of
    identifiers to be test for putative hits. If there are multiple individuals
    with the same \code{ID} (ex, in the same test group) then over half of them
    need to meet the criteria to be a putative hit. \code{values} indicates the
    columns containing values to evaluate, with start = the position of the first
    column and stop = the position of the last column. 
    
    If you wish to use a different cutoff for each column, then set
    \code{var.cuts} = TRUE and supply lists for both \code{low.cut} and
    \code{high.cut} that correspond to the largest value to be considered a hit
    on the low side (ex low abundance) and the smallest value to be considered
    a hit on the high side (ex high abundance), respectively. Alternatively,
    \code{cutoff} is used for data coming out of \code{\link{cdf.pval}}.
    \code{cutoff}=0.05 then values <=0.025 and values >= 0.975 will be
    considered putative hits. If Zscores are provided (or other criteria where
    values >= abs(x) are considered a hit), then \code{Z} should be used to
    define a cutoff.
    
    \code{data} are subsetted based on the column (\code{ID}) either by all
    levels (e.g. group A, group B) or by \code{source}, if provided. Each column
    in \code{values} (e.g. assay) is evaluated to see if any individuals in that
    column meet the criteria for a putative hit. If more than half of the
    individuals meet the criteria to be a putative hit for that column, all the
    individuals belonging to that level are put into the output data frame. If
    not, then the remaining columns are evaluated or it moves to the next level.
    Individual responses that are low or high are evaluated separately.
}
\value{
    \code{find_hits} returns a dataframe containing putative hits and data for
    other individuals in their group.
}
\author{Shannon M. Bell}
\references{
  Bell SM, Burgoon LD, Last RL. MIPHENO: Data normalization
  for high throughput metabolite analysis. \emph{BMC Bioinformatics} 2012, 13(10)
  }
\examples{
 #See the sweave document in the corresponding paper for examples
}