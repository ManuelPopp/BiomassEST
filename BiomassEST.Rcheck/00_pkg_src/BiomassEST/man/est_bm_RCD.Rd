\name{est.bm.RCD}
\alias{est.bm.RCD}
\title{Estimate biomass based on root collar diameter (RCD)}
\usage{
  est.bm.RCD(Species, RCD, H_meas)
}
\description{
This function uses equations and parameters obtained from peer reviewed publications to estimate tree biomass based on the species and the (root collar) diameter (RCD).
}
\arguments{
  \item{Species}{
A species name, e.g, "Abies alba".
}
\item{RCD}{
Root collar diameter in cm.
}
\item{H_meas}{
Height of the measurement in cm; transformations are available for 5, 10, 50, and 130 cm.
}
}
\value{
Returns a numeric value.
}
\examples{
  est.bm.RCD(Species = "Abies alba", RCD = 15, H_meas = 10)
}
\references{
Anninghoefer et al., 2016. Species-specific and generic biomass equations for seedlings and saplings of European tree species. Eur J Forest Res 135 2016, pp 313–329. doi: 10.1007/s10342-016-0937-z
}
