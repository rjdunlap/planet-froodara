local utils = require("__any-planet-start__.utils")

data.raw.technology["planet-discovery-vulcanus"].hidden = true

utils.set_prerequisites("tungsten-carbide", nil)
utils.set_prerequisites("calcite-processing", nil)


utils.set_trigger("tungsten-carbide", {type = "mine-entity", entity = "big-volcanic-rock"})

utils.set_prerequisites("foundry", {"tungsten-carbide","concrete", "lubricant"})