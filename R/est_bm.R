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
  if(is.na(use)){
    use <- "opportunistic"
  }
  if(is.numeric(RCD) & !is.numeric(H) | is.numeric(RCD) & use == "RCD"){
    AGB <- BiomassEST::est.bm.RCD(Species = Species, RCD = RCD, H_meas = H_meas)
  }else if(is.numeric(H) & !is.numeric(RCD) | is.numeric(H) & use == "H"){
    AGB <- BiomassEST::est.bm.H(Species = Species, H = H)
  }else if(is.numeric(RCD) & is.numeric(H) & use == "opportunistic"){
    AGB <- BiomassEST::est.bm.RCD2H(Species = Species, RCD = RCD, H = H, H_meas = H_meas)
  }
  return(AGB)
}
