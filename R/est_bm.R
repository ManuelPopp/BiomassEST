est.bm <- function(Species, RCD = NA, BHD = NA, H = NA, use = NA, H_meas = NA){
  if(all(is.na(RCD)) & !anyNA(BHD) & !anyNA(H_meas)){
    RCD <- BHD
  }
  # Check if at least some parameters were provided
  if(all(is.na(RCD)) & all(is.na(BHD)) & all(is.na(H))){
    warning("No parameters set. Provide at least one (ore more) of the following: RCD or BHD including H_meas, H.")
  }
  # Error if neither H nor H_meas is provided
  if(all(is.na(H)) & !is.numeric(H_meas)){
    warning("Parameter H_meas not set. Please provide the height of your measurement.")
  }
  # See if RCD is provided in some cases without H_meas, but H is provided (-> estimate biomass only based on H in this case)
  if(!anyNA(use)){
    if(all(is.na(H_meas)) & !anyNA(H) & !all(is.na(RCD)) & !all(use == "H")){
      warning("RCD provided but H_meas missing. Calculating based on H.")
      use <- rep("H", length(Species))
    }
  }else{
    if(all(is.na(H_meas)) & !anyNA(H) & !all(is.na(RCD))){
      warning("RCD provided but H_meas missing. Calculating based on H.")
      use <- rep("H", length(Species))
    }
  }
  # Set use to opportunistic if no argument was set (estimate biomass utilising as many as possible of the given values)
  if(all(is.na(use))){
    use <- "opportunistic"
  }
  # If RCD is provided and H is missing or RCD was set explicitly: Estimate biomass based on RCD
  if(is.numeric(RCD) & !is.numeric(H) | is.numeric(RCD) & all(use == "RCD")){
    # Warning if H_meas is missing
    if(anyNA(H_meas)){
      warning("Mode RCD (explicitly set or no H provided) missing value: H_meas")
    }
    # Use H_meas for all instances in case only a single value (rather than a multi value vector) was provided
    if(length(Species) > 1 & length(H_meas) == 1){
      H_meas <- rep(H_meas, length(Species))
    }
    # Apply est.bm.RCD to all values
    AGB <- mapply(FUN = BiomassEST::est.bm.RCD, Species = Species, RCD = RCD, H_meas = H_meas)
  # If H is provided and RCD is missing or use of H was set explicitly: Estimate biomass based on H
  }else if(is.numeric(H) & !is.numeric(RCD) | is.numeric(H) & all(use == "H")){
    AGB <- mapply(FUN = BiomassEST::est.bm.H, Species = Species, H = H)
  # If both, RCD and H are provided in at least some cases...
  }else if(is.numeric(RCD) & is.numeric(H)){
    # ...set H_meas for all instances if only provided once
    if(length(Species) > 1 & length(H_meas) == 1){
      H_meas <- rep(H_meas, length(Species))
    }
    # ...use RCD2H if all required values are provided without missing values
    if(!anyNA(RCD) & !anyNA(H) & !anyNA(H_meas) & all(use == "opportunistic") | all(use == "RCD2H")){
      AGB <- mapply(FUN = BiomassEST::est.bm.RCD2H, Species = Species, RCD = RCD, H = H, H_meas = H_meas)
    # ...or print a warning, in case some values are missing
    }else if(any(anyNA(RCD), anyNA(H), anyNA(H_meas)) & all(use == "opportunistic") | all(use == "RCD2H")){
      warning("Data contains NA.")
      AGB <- NA
    # In case use was set to different values for each instance, use a loop
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
