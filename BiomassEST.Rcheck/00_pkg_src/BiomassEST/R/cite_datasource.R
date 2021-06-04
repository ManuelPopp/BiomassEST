cite.datasource <- function(Species = NA, Parameter = "RCD", Author = NA, Bibtex = TRUE){
  if(is.na(Author) & !is.na(Species)){
    dataset <- get(paste("Parameters", Parameter, sep = "_"))
    key <- dataset$Citation[which(
      dataset$Genus == Genus & dataset$Epithet == Epithet
    )]
  }else if(is.na(Author) & is.na(Species)){
    warning("Neither author nor species name provided.")
  }else if(!is.na(Author) & is.na(Species)){
    key <- Citations$Citekey[which(Citations$AuthorFirst == Author)[1]]
  }
  if(Bibtex){
    out <- Citations$Bibtex[which(Citations$Citekey == key)]
  }else{
    out <- Citations$PlainText[which(Citations$Citekey == key)]
  }
  cat(paste(out))
}
