est.bm.RCD <- function(Species, RCD, H_meas){
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
  Conifer <- Conifers$Conifer[which(Conifers$Genus == Genus)[1]]
  Tx <- Corrections$Tx[Corrections$Height == H_meas & Corrections$Conifer == Conifer]
  # Check if a valid value was set for H_meas
  if(anyNA(H_meas)){
    warning("Argument H_meas is missing or NA.")
  }else{
    if(length(Tx) < 1){
      warning("No correction factor for H_meas = ", H_meas, ".\nSupported values:\n",
              paste(unique(Corrections$Height), collapse = ", "))
    }
  }
  # Correct RCD using H_meas and estimate biomass
  RCD_corrected <- RCD*Tx
  b1 <- Parameters_RCD$beta_1[Parameters_RCD$Genus == Genus &
                                             Parameters_RCD$Epithet == Epithet]
  b2 <- Parameters_RCD$beta_2[Parameters_RCD$Genus == Genus &
                                             Parameters_RCD$Epithet == Epithet]
  if(length(b1) < 1){
    warning("Unknown species. Currently supported species:\n",
            paste(Parameters_RCD$Genus,
                  Parameters_RCD$Epithet, collapse = ", "))
  }else{
    AGB <- b1*RCD_corrected^b2
    return(AGB)
  }
}
