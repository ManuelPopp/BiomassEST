\name{cite.datasource}
\alias{cite.datasource}
\title{Cite original source of parameter values used for biomass calculations}
\usage{
cite.datasource(Species = NA, Parameter = "RCD", Author = NA, Bibtex = TRUE)
}
\description{
Prints out the citation of the original paper from which parameters for the calculation of biomass values were obtained. Input is either a species name, in which case the database is searched for the citation of the corresponding values, or the family name of an author.
}
\examples{
cite.datasource(Species = "Abies alba")
cite.datasource(Author = "Anninghoefer")
}
