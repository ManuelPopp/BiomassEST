cite.datasource <- function(Species = NA, Parameter = "RCD", Author = NA, Bibtex = TRUE){
  if(is.na(Author) & !is.na(Species)){
    if(is.character(Species)){
      Genus <- strsplit(Species, "[ _]")[[1]][1]
      Epithet <- strsplit(Species, "[ _]")[[1]][2]
      if(is.na(Epithet)){
        Epithet <- "spec"
      }
    }else{
      warning("Invalid Species argument: ", Species)
    }
    dataset <- get(paste("Parameters", Parameter, sep = "_"))
    key <- dataset$Citation[which(
      dataset$Genus == Genus & dataset$Epithet == Epithet
    )]
    if(length(key) < 1){
      warning("Unknown species. Currently supported species:\n", paste(dataset$Genus, dataset$Epithet, collapse = ", "))
    }
  }else if(is.na(Author) & is.na(Species)){
    warning("Neither author nor species name provided.")
  }else if(!is.na(Author) & is.na(Species)){
    key <- Citations$Citekey[which(Citations$AuthorFirst == Author)[1]]
    if(is.na(key)){
      warning("Unknown author name. List of author names:\n", unique(Citations$AuthorFirst))
    }
  }
  if(Bibtex){
    out <- Citations$Bibtex[which(Citations$Citekey == key)]
  }else{
    out <- Citations$PlainText[which(Citations$Citekey == key)]
  }
  cat(paste(out))
}
