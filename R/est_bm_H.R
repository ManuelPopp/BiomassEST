est.bm.H <- function(Species, H){
  if(is.character(Species)){
    Genus <- strsplit(Species, "[ _]")[[1]][1]
    Epithet <- strsplit(Species, "[ _]")[[1]][2]
    if(is.na(Epithet)){
      ConiferListEntry <- which(Conifers$Genus == Genus)
      if(length(ConiferListEntry) >= 1){
        if(Conifers$Conifer[ConiferListEntry]){
          Genus <- "Conifer"
        }else{
          Genus <- "Broadleaf"
        }
      }
      Epithet <- "spec"
    }
  }else{
    warning("Invalid Species argument: ", Species)
  }
  b1 <- Parameters_H$beta_1[Parameters_H$Genus == Genus &
                                           Parameters_H$Epithet == Epithet]
  b2 <- Parameters_H$beta_2[Parameters_H$Genus == Genus &
                                           Parameters_H$Epithet == Epithet]
  if(length(b1) < 1){
    warning("Unknown species. Currently supported species:\n",
            paste(Parameters_H$Genus,
                  Parameters_H$Epithet, collapse = ", "))
  }else{
    AGB <- b1*H^b2
    return(AGB)
  }
}
