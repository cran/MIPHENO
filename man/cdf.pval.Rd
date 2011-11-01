\name{cdf.pval}
\alias{cdf.pval}
\title{Generate Empirical pvalues from Cumulative Distribution Function}
\usage{
cdf.pval(cdf.data, sample.data=NULL, ...)
}
\arguments{
  \item{cdf.data}{Dataframe or Matrix of inputs used to make the CDF
  (ie the NULL distribution or wt distribution, if known),
  or the sample data if a NULL distribution is unavailable.}
  \item{sample.data}{Optional. Dataframe or Matrix of inputs for which a pvalue
  is to be determined in the event that a seperate NULL distribution is used.}
  \item{...}{Other parameters.}
}
\description{
    Returns the pvalue for the probability of observing a response equal to 
    the input data ( /code{cdf.data} or /code{sample.data}) or more extreme (smaller)
    based on an empirical distribution function (ecdf) of the \code{cdf.data}.
    Observations with a high pvalue (-> 1) are also rare, thus calculating
    1-pvalue or 1-F will return the probability at the other end of the
    distribution. See ecdf for details \code{\link{ecdf}}.
}
\details{
    Data should be presorted if you are going to match it to labels
    (ie sample descriptors) as the labels need to be removed prior to processing.
    Only numeric and NA data are permitted. Columns in \code{cdf.data} and
    \code{sample.data} should be corresponding if using both.

    Each column in the \code{cdf.data} is used for generating the CDF.
    For columns (assays or probes) where <2 observations were made,
    the column is omitted from the CDF calculation. This step generates a CDF
    function for each column. Data from /code{cdf.data}
    or /code{sample.data}, if supplied, is run through the corresponding CDF
    function by column (assay), where the probability of observing the response
    (row value) is calculated.
}
\value{
    \code{cdf.pval} returns a dataframe containing rows= observations (input
    order preserved) and columns = assays. The column order may have changed to
    match \code{sample.data}, if provided. Values will be between 0 and 1.
}
\author{Shannon M. Bell}
\references{
  Shannon M. Bell, Lyle D. Burgoon, Robert L. Last. MIPHENO: Data normalization
  for high throughput metabolite analysis. BMC Bioinformatics, in review}
\seealso{\code{\link{ecdf}}}
\examples{
 #See the sweave document in the corresponding paper for examples
}