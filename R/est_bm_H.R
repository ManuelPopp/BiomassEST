est.bm.H <- function(Species, H){
  if(is.character(Species)){
    Genus <- strsplit(Species, "[ _]")[[1]][1]
    Epithet <- strsplit(Species, "[ _]")[[1]][2]
    if(is.na(Epithet)){
      Epithet <- "spec"
    }
  }else{
    warning("Invalid Species argument: ", Species)
  }
  b1 <- BiomassEST:::Parameters_H$beta_1[BiomassEST:::Parameters_H$Genus == Genus &
                                           BiomassEST:::Parameters_H$Epithet == Epithet]
  b2 <- BiomassEST:::Parameters_H$beta_2[BiomassEST:::Parameters_H$Genus == Genus &
                                           BiomassEST:::Parameters_H$Epithet == Epithet]
  if(length(b1) < 1){
    warning("Unknown species. Currently supported species:\n",
            paste(BiomassEST:::Parameters_H$Genus,
                  BiomassEST:::Parameters_H$Epithet, collapse = ", "))
  }else{
    AGB <- b1*H^b2
    return(AGB)
  }
}
