ENABLE_DEBUG_LOG = true

local variant = Tracker.ActiveVariantUID

if ENABLE_DEBUG_LOG then
    print("MMX4 AP Tracker loading, variant: " .. tostring(variant))
end

-- Logic (must load before locations so access rule functions exist)
ScriptHost:LoadScript("scripts/logic/base_logic.lua")

-- Items (flat array, loaded first)
Tracker:AddItems("items/items.json")

-- Maps and Locations
Tracker:AddMaps("maps/maps.json")

if PopVersion and PopVersion >= "0.23.0" then
    Tracker:AddLocations("locations/locations.json")
end

-- Layouts (named keys, loaded in order)
Tracker:AddLayouts("layouts/settings_popup.json")
Tracker:AddLayouts("layouts/items_standard.json")
Tracker:AddLayouts("layouts/layouttabs.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

-- AutoTracking
if PopVersion and PopVersion >= "0.26.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end

-- watches.lua for location section change handlers
ScriptHost:LoadScript("scripts/watches.lua")

if ENABLE_DEBUG_LOG then
    print("MMX4 AP Tracker loaded successfully")
end
