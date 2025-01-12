--data.lua
local asteroid_util = require("__space-age__.prototypes.planet.asteroid-spawn-definitions")


--START MAP GEN
function MapGen_Froodara()
    -- Vulcanus-based generation
    local map_gen_setting = table.deepcopy(data.raw.planet.nauvis.map_gen_settings)

    --map_gen_setting.terrain_segmentation = "very-high"

    map_gen_setting.autoplace_controls = {
        
        ["enemy-base"] = { frequency = 1, size = 1, richness = 1},
        ["stone"] = { frequency = 2, size = 2, richness = 2},
        ["iron-ore"] = { frequency = 2, size = 1, richness = 2},
        ["coal"] = { frequency = 2, size = 1, richness = 2},
        ["copper-ore"] = { frequency = 2, size = 1, richness = 2},
        ["crude-oil"] = { frequency = 2, size = 2, richness = 3},
        ["trees"] = { frequency = 2, size = 2, richness = 1 },
        ["water"] = { frequency = 2, size = 2, richness = 2 },
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

local froodara = 
{
    type = "planet",
    name = "froodara", 
    solar_power_in_space = nauvis.solar_power_in_space,
    icon = "__planet-froodara__/graphics/planet-froodara.png",
    icon_size = 512,
    label_orientation = 0.55,
    starmap_icon = "__planet-froodara__/graphics/planet-froodara.png",
    starmap_icon_size = 512,
    magnitude = nauvis.magnitude,
    surface_properties = {
        ["solar-power"] = 150,
        ["pressure"] = nauvis.surface_properties["pressure"],
        ["magnetic-field"] = nauvis.surface_properties["magnetic-field"],
        ["day-night-cycle"] = nauvis.surface_properties["day-night-cycle"],
    },
    map_gen_settings = MapGen_Froodara()
}

froodara.orbit = {
    parent = {
        type = "space-location",
        name = "star",
    },
    distance = 0.66,
    orientation = 0.42
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
    icon_size = 256,
    essential = true,
    localised_description = {"space-location-description.froodara"},
    effects = {
        {
            type = "unlock-space-location",
            space_location = "froodara",
            use_icon_overlay_constant = true
        },
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