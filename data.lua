--data.lua
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")
require("froodara")

--START MAP GEN
function MapGen_Froodara()
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)
    map_gen_setting.property_expression_names =
    {
        ["entity:tungsten-ore:probability"] = "vulcanus_tungsten_ore_probability",
        ["entity:tungsten-ore:richness"] = "vulcanus_tungsten_ore_richness",
        ["entity:calcite:probability"] = "vulcanus_calcite_probability",
        ["entity:calcite:richness"] = "vulcanus_calcite_richness",
    }
    map_gen_setting.autoplace_controls = {
        
        ["enemy-base"] = { frequency = 2, size = 1.25, richness = 1.25},
        ["stone"] = { frequency = 1, size = 1, richness = 1},
        ["iron-ore"] = { frequency = 1.5, size = 1, richness = 1},
        ["coal"] = { frequency = 2, size = 1, richness = 0.75},
        ["copper-ore"] = { frequency = 1, size = 1, richness = 1},
        ["crude-oil"] = { frequency = 1.25, size = 1, richness = 1},
        ["trees"] = { frequency = 2, size = 2, richness = 1 },
        ["water"] = { frequency = 1.75, size = 1.75, richness = 1.75},
        ["nauvis_cliff"] = { frequency = 0.75, size = 1, richness = 1},
        ["vulcanus_volcanism"] = {},
        ["tungsten_ore"] = {},
        ["calcite"] = {},
    }

    map_gen_setting.territory_settings = {
        units = {"small-demolisher", "medium-demolisher", "big-demolisher"},
        territory_index_expression = "demolisher_territory_expression",
        territory_variation_expression = "demolisher_variation_expression",
        minimum_territory_size = 10
      }

    map_gen_setting.autoplace_settings["tile"] =
    {
        settings =
        {
            ["grass-1"] = {},
            ["grass-2"] = {},
            ["grass-3"] = {},
            ["grass-4"] = {},
            ["dry-dirt"] = {},
            ["dirt-1"] = {},
            ["dirt-2"] = {},
            ["dirt-3"] = {},
            ["dirt-4"] = {},
            ["dirt-5"] = {},
            ["dirt-6"] = {},
            ["dirt-7"] = {},
            ["sand-1"] = {},
            ["sand-2"] = {},
            ["sand-3"] = {},
            ["red-desert-0"] = {},
            ["red-desert-1"] = {},
            ["red-desert-2"] = {},
            ["red-desert-3"] = {},
            ["water"] = {},
            ["deepwater"] = {},

          --nauvis tiles
          ["volcanic-soil-dark"] = {},
          ["volcanic-soil-light"] = {},
          ["volcanic-ash-soil"] = {},
          --end of nauvis tiles
          ["volcanic-ash-flats"] = {},
          ["volcanic-ash-light"] = {},
          ["volcanic-ash-dark"] = {},
          ["volcanic-cracks"] = {},
          ["volcanic-cracks-warm"] = {},
          ["volcanic-folds"] = {},
          ["volcanic-folds-flat"] = {},
          ["lava"] = {},
          ["lava-hot"] = {},
          ["volcanic-folds-warm"] = {},
          ["volcanic-pumice-stones"] = {},
          ["volcanic-cracks-hot"] = {},
          ["volcanic-jagged-ground"] = {},
          ["volcanic-smooth-stone"] = {},
          ["volcanic-smooth-stone-warm"] = {},
          ["volcanic-ash-cracks"] = {},
        }
    }

    map_gen_setting.autoplace_settings["decorative"] =
    {
      settings =
      {
        -- nauvis decoratives
        ["v-brown-carpet-grass"] = {},
        ["v-green-hairy-grass"] = {},
        ["v-brown-hairy-grass"] = {},
        ["v-red-pita"] = {},
        -- end of nauvis
        ["vulcanus-rock-decal-large"] = {},
        ["vulcanus-crack-decal-large"] = {},
        ["vulcanus-crack-decal-huge-warm"] = {},
        ["vulcanus-dune-decal"] = {},
        ["vulcanus-sand-decal"] = {},
        ["vulcanus-lava-fire"] = {},
        ["calcite-stain"] = {},
        ["calcite-stain-small"] = {},
        ["sulfur-stain"] = {},
        ["sulfur-stain-small"] = {},
        ["sulfuric-acid-puddle"] = {},
        ["sulfuric-acid-puddle-small"] = {},
        ["crater-small"] = {},
        ["crater-large"] = {},
        ["pumice-relief-decal"] = {},
        ["small-volcanic-rock"] = {},
        ["medium-volcanic-rock"] = {},
        ["tiny-volcanic-rock"] = {},
        ["tiny-rock-cluster"] = {},
        ["small-sulfur-rock"] = {},
        ["tiny-sulfur-rock"] = {},
        ["sulfur-rock-cluster"] = {},
        ["waves-decal"] = {},
      }
    }

    map_gen_setting.autoplace_settings["entity"] =  { 
        settings =
        {
        ["calcite"] = {},
        ["tungsten-ore"] = {},
        ["iron-ore"] = {},
        ["copper-ore"] = {},
        ["stone"] = {},
        ["coal"] = {},
        ["crude-oil"] = {},
        ["huge-volcanic-rock"] = {},
        ["big-volcanic-rock"] = {},
        ["crater-cliff"] = {},
        ["vulcanus-chimney"] = {},
        ["vulcanus-chimney-faded"] = {},
        ["vulcanus-chimney-cold"] = {},
        ["vulcanus-chimney-short"] = {},
        ["vulcanus-chimney-truncated"] = {},
        ["ashland-lichen-tree"] = {},
        ["ashland-lichen-tree-flaming"] = {},
        }
    }
     

    return map_gen_setting
end
-- increse stone patch size in start area
-- data.raw["resource"]["stone"]["autoplace"]["starting_area_size"] = 5500 * (0.005 / 3)

--END MAP GEN

local nauvis = data.raw["planet"]["nauvis"]
local planet_lib = require("__PlanetsLib__.lib.planet")

local start_astroid_spawn_rate =
{
  probability_on_range_chunk =
  {
    {position = 0.1, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle},
    {position = 0.9, probability = asteroid_util.nauvis_chunks, angle_when_stopped = asteroid_util.chunk_angle}
  },
  type_ratios =
  {
    {position = 0.1, ratios = asteroid_util.nauvis_ratio},
    {position = 0.9, ratios = asteroid_util.nauvis_ratio},
  }
}
local start_astroid_spawn = asteroid_util.spawn_definitions(start_astroid_spawn_rate, 0.1)


local froodara = 
{
    type = "planet",
    name = "froodara", 
    solar_power_in_space = 300,
    icon = "__planet-froodara__/graphics/planet-froodara.png",
    icon_size = 512,
    label_orientation = 0.55,
    starmap_icon = "__planet-froodara__/graphics/planet-froodara.png",
    starmap_icon_size = 512,
    magnitude = nauvis.magnitude,
    surface_properties = {
        ["solar-power"] = 200,
        ["pressure"] = data.raw["planet"]["vulcanus"].surface_properties["pressure"],
        ["magnetic-field"] = nauvis.surface_properties["magnetic-field"],
        ["day-night-cycle"] = nauvis.surface_properties["day-night-cycle"],
    },
    map_gen_settings = MapGen_Froodara(),
    asteroid_spawn_influence = 1,
    asteroid_spawn_definitions = start_astroid_spawn,
    pollutant_type = "pollution"
}

froodara.orbit = {
    parent = {
        type = "space-location",
        name = "star",
    },
    distance = 12,
    orientation = 0.26
}

local froodara_connection = {
    type = "space-connection",
    name = "nauvis-froodara",
    from = "nauvis",
    to = "froodara",
    subgroup = data.raw["space-connection"]["nauvis-vulcanus"].subgroup,
    length = 15000,
    asteroid_spawn_definitions = asteroid_util.spawn_definitions(asteroid_util.nauvis_vulcanus),
  }

PlanetsLib:extend({froodara})

data:extend{froodara_connection}

data:extend {{
    type = "technology",
    name = "planet-discovery-froodara",
    icons = util.technology_icon_constant_planet("__planet-froodara__/graphics/planet-froodara.png"),
    icon_size = 512,
    essential = true,
    localised_description = {"space-location-description.froodara"},
    effects = {
        {
            type = "unlock-space-location",
            space_location = "froodara",
            use_icon_overlay_constant = true
        }
    },
    prerequisites = {
        "space-science-pack",
    },
    unit = {
        count = 200,
        ingredients = {
            {"automation-science-pack",      1},
            {"logistic-science-pack",        1},
            {"chemical-science-pack",        1},
            {"space-science-pack",           1}
        },
        time = 60,
    },
    order = "ea[froodara]",
}}


APS.add_planet{name = "froodara", filename = "__planet-froodara__/froodara.lua", technology = "planet-discovery-froodara"}