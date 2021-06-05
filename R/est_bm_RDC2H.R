est.bm.RCD2H <- function(Species, RCD, H, H_meas){
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
  Tx <- BiomassEST:::Corrections$Tx[BiomassEST:::Corrections$Height == H_meas & BiomassEST:::Corrections$Conifer == Conifer]
  RCD_corrected <- RCD*Tx
  b1 <- BiomassEST:::Parameters_RCD2H$beta_1[BiomassEST:::Parameters_RCD2H$Genus == Genus &
                                             BiomassEST:::Parameters_RCD2H$Epithet == Epithet]
  b2 <- BiomassEST:::Parameters_RCD2H$beta_2[BiomassEST:::Parameters_RCD2H$Genus == Genus &
                                             BiomassEST:::Parameters_RCD2H$Epithet == Epithet]
  AGB <- b1*(RCD_corrected^2 * H)^b2
  return(AGB)
}
