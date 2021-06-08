BiomassEst.Info <- function(topic = NA){
  if(is.na(topic)){
    cat("BiomassEST is a package that provides functions to estimate the biomass of trees.\n",
        "Run Info('Species') in order to view a list of supported species. For some functions, generic parameters might also be available. You can use 'Conifer' and 'Broadleaf' for species that fall into the respective class, but for which no specific parameters exist. However, note that generic parameters don't fit all species of the respective group equally well.\n"
    )
  }else if(topic == "Species"){
    Supported_species <- unique(paste(Parameters_RCD$Genus, Parameters_RCD$Epithet))
    return(Supported_species)
  }
}
