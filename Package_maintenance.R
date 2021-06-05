library("readxl")
dat <- "C:/Users/Manuel/Nextcloud/Geobotanik/dat/Biomass_estimation.xlsx"
Parameters_RCD <- read_excel(dat, sheet = "Parameters_RCD")
Parameters_RCD <- as.data.frame(Parameters_RCD)
Parameters_H <- read_excel(dat, sheet = "Parameters_H")
Parameters_H <- as.data.frame(Parameters_H)
Parameters_RCD2H <- read_excel(dat, sheet = "Parameters_RCD2H")
Parameters_RCD2H <- as.data.frame(Parameters_RCD2H)
Citations <- read_excel(dat, sheet = "Citations")
Citations <- as.data.frame(Citations)
Corrections <- read_excel(dat, sheet = "Corrections")
Corrections <- as.data.frame(Corrections)
Conifers <- read_excel(dat, sheet = "Conifers")
Conifers <- as.data.frame(Conifers)
for(i in 1:nrow(Citations)){
  Citations$Bibtex[i] <- gsub("\\n", "\n", Citations$Bibtex[i])
}
usethis::use_data(Parameters_RCD, Parameters_H, Parameters_RCD2H,
                  Citations, Corrections, Conifers,
                  internal = TRUE, overwrite = TRUE)
# after changing a data set: Run this script. Check. Build. Push to Github main.
