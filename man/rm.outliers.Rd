\name{rm.outliers}
\alias{rm.outliers}
\title{Post-Hoc outlier removal for high throughput data}
\usage{
rm.outliers(data, parameter='FLATCODE', n=3, ...)
}
\arguments{
  \item{data}{Dataframe or Matrix of inputs for which outliers are to be removed} 
  \item{parameter}{The parameter (given by column name) on which defines a
  subgroup. This is the only non-numeric column allowed.}
  \item{n}{the number of Median Absolute Deviations (MAD) from the global median
  a subgroup is allowed to be before it is considered an outlier.}
  \item{...}{Other parameters.}
}
\description{
    Returns a dataframe with outlier groups removed. Note that each column
    (other than the \code{parameter} column) is treated as a separate assay.
    Therefore if one 'group' does not meet the criteria for inclusion in 1
    assay (column value), but does for all others, only the data for the assay
    failing the quality control will be removed.
}
\details{
    Data should be presorted according to both identifier and \code{parameter}
    prior to running command. Order will be retained if this is followed.
    \code{data} should be a dataframe with a \code{parameter} serving as a label
    and the rest of the values numeric. Note that \code{parameter} should be the
    attribute where the most error is expected. A visual inspection using box
    and whisker plots may be helpful in determining the best variable to use.
    \code{data} is first broken down into groups based on \code{parameter}. Both
    the group median and the median of all groups (global median) is calculated.
    Groups where the absolute value of the difference between the group median
    and global median is greater than \code{n} * MAD(group medians) for a
    given attribute (column) have their values removed (ie set to NA). Data for
    the group is retained for columns that pass this criteria.
    }
\value{
    \code{rm.outliers} returns a dataframe containing data with values not
    passing the filter converted to NA.
}
\author{Shannon M. Bell}
\references{
  Bell SM, Burgoon LD, Last RL. MIPHENO: Data normalization
  for high throughput metabolite analysis. \emph{BMC Bioinformatics} 2012, 13(10)
  }
\examples{
 #See the sweave document in the corresponding paper for examples
}