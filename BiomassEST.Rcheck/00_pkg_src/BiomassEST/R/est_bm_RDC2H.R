est.bm.RCD2H <- function(Species, RCD, H, H_meas){
  if(is.character(Species)){
    Genus <- strsplit(Species, "[ _]")[[1]][1]
    Epithet <- strsplit(Species, "[ _]")[[1]][2]
  }else{
    warning("Invalid Species argument: ", Species)
  }
  Conifer <- Conifers$Conifer[which(Conifer$Genus == Genus)[1]]
  Tx <- Corrections$Tx[Corrections$Height == H_meas & Corrections$Conifer == Conifer]
  RCD_corrected <- RCD*Tx
  AGB <- b1*(RCD_corrected^2 * H)^b2
  return(AGB)
}
