# BiomassEST
 BiomassEstimations based on easy-to-obtain data (e.g., stem diameter, tree height)

# Installation
To install the package, you can use `devtools::install_github()`. If missing, install first:<br/>
`install.packages("devtools")`<br/>
`require("devtools")`<br/>

Then install BiomassEST from Github:<br/>
`install_github("ManuelPopp/BiomassEST")`<br/>
`require("BiomassEST")`

# Usage
In order to estimate the biomass of a tree, you can simply run the `est.bm()` function which has the following defaults:<br/>
`est.bm(Species, RCD = NA, BHD = NA, H = NA, use = NA, H_meas = NA)`<br/>
As an example, we will estimate the biomass of *Picea abies* with a height of 340 cm:<br/>
`est.bm("Picea abies", H = 130)`<br/>
which outputs a numeric value, the estimated biomass in g:<br/>
`[1] 511.2756`<br/>
<br/>
Alternatively, the a measurement of the stem diameter (root collar diameter, RCD, or diameter at breast height, BHD) can be passed using the `RCD` or the `BHD` argument. In this case, the height at which the measurement was taken must also be provided in the `H_meas` argument. Currently, there are only transformations available for <img src="https://render.githubusercontent.com/render/math?math=H_{meas} \in \left{5, 10, 50, 130\right}">.<br/>
In version 0.0.1, there is no difference between `RCD` and `BHD`.<br/>
Example:<br/>
`est.bm("Picea abies", RCD = 20, H_meas = 130)`<br/>
<br/>
Passing both tree height and RCD values will invoke the RCD2H method, unless an other method ("RCD" or "H") is explicitly set using the `use` argument.