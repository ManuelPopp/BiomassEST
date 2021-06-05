est.bm.RCD <- function(Species, RCD, H_meas){
  if(is.character(Species)){
    Genus <- strsplit(Species, "[ _]")[[1]][1]
    Epithet <- strsplit(Species, "[ _]")[[1]][2]
    if(is.na(Epithet)){
      Epithet <- "spec"
    }
  }else{
    warning("Invalid Species argument: ", Species)
  }
  Conifer <- BiomassEST:::Conifers$Conifer[which(BiomassEST:::Conifers$Genus == Genus)[1]]
  Tx <- BiomassEST:::Corrections$Tx[Corrections$Height == H_meas & BiomassEST:::Corrections$Conifer == Conifer]
  RCD_corrected <- RCD*Tx
  b1 <- BiomassEST:::Parameters_RCD$beta_1[BiomassEST:::Parameters_RCD$Genus == Genus &
                                           BiomassEST:::Parameters_RCD$Epithet == Epithet]
  b2 <- BiomassEST:::Parameters_RCD$beta_2[BiomassEST:::Parameters_RCD$Genus == Genus &
                                           BiomassEST:::Parameters_RCD$Epithet == Epithet]
  if(is.na(b1)){
    warning("Unknown species. Currently supported species:\n",
            paste(BiomassEST:::Parameters_RCD$Genus,
                  BiomassEST:::Parameters_RCD$Epithet, collapse = ", "))
  }else{
    AGB <- b1*RCD_corrected^b2
    return(AGB)
  }
}
