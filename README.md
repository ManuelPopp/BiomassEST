# BiomassEST
 BiomassEstimations based on easy-to-obtain data (e.g., stem diameter, tree height)

# Installation
To install the package, you can use `devtools::install_github()`. If missing, install devtools first:<br/>
   `install.packages("devtools")`<br/>
   `require("devtools")`<br/>

Then install BiomassEST from Github:<br/>
   `install_github("ManuelPopp/BiomassEST")`<br/>
   `require("BiomassEST")`

# Usage
## Estimating tree biomass
In order to estimate the biomass of a tree, you can simply run the `est.bm()` function which has the following defaults:<br/>
   `est.bm(Species, RCD = NA, BHD = NA, H = NA, use = NA, H_meas = NA)`<br/>
As an example, we will estimate the biomass of *Picea abies* with a height of 340 cm:<br/>
   `est.bm("Picea abies", H = 340)`<br/>
which outputs a named numeric, the estimated biomass in g:<br/>
   `Picea abies`<br/>
   `2856.944`<br/>
<br/>
Alternatively, the a measurement of the stem diameter (root collar diameter, RCD, or diameter at breast height, BHD) can be passed using the `RCD` or the `BHD` argument. In this case, the height at which the measurement was taken must also be provided in the `H_meas` argument. Currently, there are only transformations available for <img src="https://render.githubusercontent.com/render/math?math=H_{meas} \in \{5, 10, 50, 130\}">.<br/>
In BiomassEST version 0.0.1, there is no difference between `RCD` and `BHD`.<br/>
Example:<br/>
   `est.bm("Picea abies", RCD = 20, H_meas = 130)`<br/>
<br/>
Passing both tree height and RCD values will invoke the RCD2H method, unless an other method ("RCD" or "H") is explicitly set using the `use` argument.

## Cite the package or surce data
If you want to cite this package, simply use<br/>
`citation("BiomassEST")`<br/>
The functions and parameters used to estimate tree biomass were extracted from peer-reviedwd publications. In order to cite those data sources, run<br/>
`cite.datasource()`<br/>
using either the argument `Species` or `Author`. If providing only a character string, the function will assume it is a species name.<br/>
Defaults are:<br/>
`cite.datasource(Species = NA, Parameter = "RCD", Author = NA, Bibtex = TRUE)`<br/>
Examples:<br/>
1) Return citation of the data source the package uses when calculating biomass of *Abies alba* from RCD<br/>
`cite.datasource("Abies alba")`<br/>
2) Return citation for a specific author occurring in the database of this package:<br/>
`cite.datasource(Author = "Annighoefer")`