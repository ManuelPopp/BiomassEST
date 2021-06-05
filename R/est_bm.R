est.bm <- function(Species, RCD = NA, BHD = NA, H = NA, use = NA, H_meas = NA){
  if(all(is.na(RCD)) & !anyNA(BHD) & !anyNA(H_meas)){
    RCD <- BHD
  }
  if(all(is.na(RCD)) & all(is.na(BHD)) & all(is.na(H))){
    warning("No parameters set. Provide at least one (ore more) of the following: RCD, BHD, H.")
  }
  if(all(is.na(H)) & !is.numeric(H_meas)){
    warning("Parameter H_meas not set. Please provide the height of your measurement.")
  }
  if(all(is.na(use))){
    use <- "opportunistic"
  }
  if(is.numeric(RCD) & !is.numeric(H) | is.numeric(RCD) & all(use == "RCD")){
    if(anyNA(H_meas)){
      warning("Mode RCD (explicitly set or no H provided) missing value: H_meas")
    }
    if(length(Species) > 1 & length(H_meas) == 1){
      H_meas <- rep(H_meas, length(Species))
    }
    AGB <- mapply(FUN = BiomassEST::est.bm.RCD, Species = Species, RCD = RCD, H_meas = H_meas)
  }else if(is.numeric(H) & !is.numeric(RCD) | is.numeric(H) & all(use == "H")){
    AGB <- mapply(FUN = BiomassEST::est.bm.H, Species = Species, H = H)
  }else if(is.numeric(RCD) & is.numeric(H)){
    if(length(Species) > 1 & length(H_meas) == 1){
      H_meas <- rep(H_meas, length(Species))
    }
    if(!anyNA(RCD) & !anyNA(H) & !anyNA(H_meas) & all(use == "opportunistic") | all(use == "RCD2H")){
      AGB <- mapply(FUN = BiomassEST::est.bm.RCD2H, Species = Species, RCD = RCD, H = H, H_meas = H_meas)
    }else if(any(anyNA(RCD), anyNA(H), anyNA(H_meas)) & all(use == "opportunistic") | all(use == "RCD2H")){
      warning("Data contains NA.")
      AGB <- NA
    }else if(!all(use == "opportunistic") & !all(use == "RCD2H")){
      AGB <- vector()
      for(i in 1:length(Species)){
        if(use[i] == "RCD"){
          AGB[i] <- BiomassEST::est.bm.RCD(Species = Species[i], RCD = RCD[i], H_meas = H_meas[i])
        }else if(use[i] == "H"){
          AGB[i] <- BiomassEST::est.bm.H(Species = Species[i], H = H[i])
        }else if(is.na(use[i]) | use == "RCD2H"){
          AGB[i] <- BiomassEST::est.bm.RCD2H(Species = Species[i], RCD = RCD[i], H = H[i], H_meas = H_meas[i])
        }
      }
    }
  }
  return(AGB)
}
