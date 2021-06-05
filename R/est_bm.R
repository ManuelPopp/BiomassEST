est.bm <- function(Species, RCD = NA, BHD = NA, H = NA, use = NA, H_meas = NA){
  if(is.na(RCD) & !is.na(BHD) & !is.na(H_meas)){
    RCD <- BHD
  }
  if(is.na(RCD) & is.na(BHD) & is.na(H)){
    warning("No parameters set. Provide at least one (ore more) of the following: RCD, BHD, H.")
  }
  if(is.na(H) & !is.numeric(H_meas)){
    warning("Parameter H_meas not set. Please provide the height of your measurement.")
  }
  if(all(is.na(use))){
    use <- "opportunistic"
  }
  if(is.numeric(RCD) & !is.numeric(H) | is.numeric(RCD) & all(use == "RCD")){
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
    if(!anyNA(RCD) & !anyNA(H) & !anyNA(H_meas) & use == "opportunistic" | all(use == "RCD2H")){
      AGB <- mapply(FUN = BiomassEST::est.bm.RCD2H, Species = Species, RCD = RCD, H = H, H_meas = H_meas)
    }else if(any(anyNA(RCD), anyNA(H), anyNA(H_meas)) & use == "opportunistic" | all(use == "RCD2H")){
      warning("Data contains NA.")
    }else if(!use == "opportunistic" & !all(use == "RCD2H")){
      AGB <- vector()
      for(i in 1:length(Species)){
        if(use[i] == "RCD"){
          AGB[i] <- BiomassEST::est.bm.RCD(Species = Species, RCD = RCD, H_meas = H_meas)
        }else if(use[i] == "H"){
          AGB[i] <- BiomassEST::est.bm.H(Species = Species, H = H)
        }else if(is.na(use[i]) | use == "RCD2H"){
          AGB <- BiomassEST::est.bm.RCD2H(Species = Species, RCD = RCD, H = H, H_meas = H_meas)
        }
      }
    }
  }
  return(AGB)
}
