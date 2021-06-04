est.bm.H <- function(Species, H){
  if(is.character(Species)){
    Genus <- strsplit(Species, "[ _]")[[1]][1]
    Epithet <- strsplit(Species, "[ _]")[[1]][2]
  }else{
    warning("Invalid Species argument: ", Species)
  }
  AGB <- b1*H^b2
  return(AGB)
}
