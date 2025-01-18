
for _,connection in pairs (data.raw["space-connection"]) do 
    if connection == nil then
        break
    end
    if connection.from == "vulcanus" then
        data.raw["space-connection"][connection.name].from = "froodara"
    end 
    if connection.to == "vulcanus" then
        data.raw["space-connection"][connection.name].to = "froodara"
    end
end
	

data.raw.planet["vulcanus"].hidden = true
data.raw.planet["vulcanus"].map_gen_settings = nil