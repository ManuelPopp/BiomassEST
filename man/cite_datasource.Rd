\name{cite.datasource}
\alias{cite.datasource}
\title{Cite original source of parameter values used for biomass calculations}
\usage{
cite.datasource(Species = NA, Parameter = "RCD", Author = NA, Bibtex = TRUE)
}
\description{
Prints out the citation of the original paper from which parameters for the calculation of biomass values were obtained. Input is either a species name, in which case the database is searched for the citation of the corresponding values, or the family name of an author.
}
\arguments{
\item{Species}{
A species name, e.g, "Abies alba", for which the source of the corresponding database entry is to be printed.
}
\item{Author}{
Last name of the first author of a publication that was used as data source.
}
\item{Parameter}{
One of the methods that can be chosen in the functions of this package. Used in case various methods published in different publications could be used for estimating the biomass of a specific tree species.
}
\item{Bibtex}{
If TRUE, the output will be generated in form of a BibTeX entry.
}
}
\examples{
cite.datasource(Species = "Abies alba")
cite.datasource(Author = "Anninghoefer")
}
