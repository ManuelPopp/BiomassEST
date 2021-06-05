\name{est.bm.RCD2H}
\alias{est.bm.RCD2H}
\title{
Estimate tree biomass based on root collar diameter and height
}
\description{
This function uses equations and parameters obtained from peer reviewed publications to estimate tree biomass based on the species, the (root collar) diameter (RCD) and the tree height
}
\usage{
est.bm.RCD2H(Species, RCD, H, H_meas)
}
\arguments{
  \item{Species}{
A species name, e.g, "Abies alba".
}
\item{RCD}{
Root collar diameter in cm.
}
\item{H}{
Height of the tree in cm.
}
\item{H_meas}{
Height of the measurement in cm; transformations are available for 5, 10, 50, and 130 cm.
}
}
\value{
Returns a numeric value.
}
\references{
Anninghoefer et al., 2016. Species-specific and generic biomass equations for seedlings and saplings of European tree species. Eur J Forest Res 135 2016, pp 313–329. doi: 10.1007/s10342-016-0937-z
}
\examples{
est.bm.RCD2H(Species = "Abies alba", RCD = 15, H = 230, H_meas = 10)
}
