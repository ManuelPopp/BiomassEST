cite.datasource <- function(Species = NA, Parameter = "RCD", Author = NA, Bibtex = TRUE){
  if(is.na(Author) & !is.na(Species)){
    dataset <- get(paste("BiomassEST:::Parameters", Parameter, sep = "_"))
    key <- dataset$Citation[which(
      dataset$Genus == Genus & dataset$Epithet == Epithet
    )]
  }else if(is.na(Author) & is.na(Species)){
    warning("Neither author nor species name provided.")
  }else if(!is.na(Author) & is.na(Species)){
    key <- BiomassEST:::Citations$Citekey[which(BiomassEST:::Citations$AuthorFirst == Author)[1]]
  }
  if(Bibtex){
    out <- BiomassEST:::Citations$Bibtex[which(BiomassEST:::Citations$Citekey == key)]
  }else{
    out <- BiomassEST:::Citations$PlainText[which(BiomassEST:::Citations$Citekey == key)]
  }
  cat(paste(out))
}
