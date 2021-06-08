\name{est.bm}
\alias{est.bm}
\title{Estimate biomass based on available proxy data}
\usage{
  est.bm(Species, RCD = NA, BHD = NA, H = NA, use = NA, H_meas = NA)
}
\description{
  Wrapper function that runs est.bm.RCD(), est.bm.H(), or est.bm.RDC2H() based on the input arguments.
}
\arguments{
  \item{Species}{
A species name, e.g, "Abies alba".
}
\item{RCD}{
Root collar diameter in cm.
}
\item{BHD}{
Diameter at breast height in cm.
}
\item{H}{
Height of the tree in cm.
}
\item{use}{
Either NA, "RCD", or "H". If RCD or H is specified, the respective function is executed independently of the availability of other input data that would allow the use of the RCD2H.
}
\item{H_meas}{
Height of the measurement in cm; transformations are available for 5, 10, 50, and 130 cm.
}
}
\value{
Returns estimated tree biomass in g as a numeric value.
}
\references{
Anninghoefer et al., 2016. Species-specific and generic biomass equations for seedlings and saplings of European tree species. Eur J Forest Res 135 2016, pp 313–329. doi: 10.1007/s10342-016-0937-z
}
\examples{
  est.bm(Species = "Abies alba", RCD = 15, H_meas = 10)
  est.bm(Species = "Abies alba", RCD = 15, H = 3.2, H_meas = 10)
}
