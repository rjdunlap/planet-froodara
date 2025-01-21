local utils = require("__any-planet-start__.utils")

data.raw.technology["planet-discovery-vulcanus"].hidden = true

utils.set_trigger("tungsten-carbide", {type = "mine-entity", entity = "big-volcanic-rock"})

utils.set_prerequisites("foundry", {"tungsten-carbide","concrete", "lubricant"})
