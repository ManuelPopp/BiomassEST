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
    if(is.na(key)){
      warning("Unknown species. Currently supported species:\n", paste(dataset$Genus, dataset$Epithet, collapse = ", "))
    }
  }else if(is.na(Author) & is.na(Species)){
    warning("Neither author nor species name provided.")
  }else if(!is.na(Author) & is.na(Species)){
    key <- BiomassEST:::Citations$Citekey[which(BiomassEST:::Citations$AuthorFirst == Author)[1]]
    if(is.na(key)){
      warning("Unknown author name. List of author names:\n", unique(BiomassEST:::Citations$AuthorFirst))
    }
  }
  if(Bibtex){
    out <- BiomassEST:::Citations$Bibtex[which(BiomassEST:::Citations$Citekey == key)]
  }else{
    out <- BiomassEST:::Citations$PlainText[which(BiomassEST:::Citations$Citekey == key)]
  }
  cat(paste(out))
}
