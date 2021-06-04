\name{est.bm.H}
\alias{est.bm.H}
\title{
Estimate biomass based on tree height
}
\description{
This function uses equations and parameters obtained from peer reviewed publications to estimate tree biomass based on the species and the tree height
}
\usage{
est.bm.H(Species, H)
}
\arguments{
  \item{Species}{
A species name, e.g, "Abies alba".
}
\item{H}{
Height of the tree in cm.
}
}
\value{
Returns a numeric value.
}
\examples{
est.bm.H(Species = "Abies alba", H = 120)
}
