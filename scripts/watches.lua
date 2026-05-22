-- MMX4 AP PopTracker - watches.lua
-- Handles location section changes to:
-- 1. Advance Maverick progressive to defeated state when boss section is checked
-- 2. Set spaceportcleared flag when Space Port Colonel is checked

BOSS_DEFEATED_TO_PROGRESSIVE = {
    ["Web Spider Defeated"]     = "webspiderstageaccess",
    ["Cyber Peacock Defeated"]  = "cyberpeacockstageaccess",
    ["Storm Owl Defeated"]      = "stormowlstageaccess",
    ["Magma Dragoon Defeated"]  = "magmadragoonstageaccess",
    ["Jet Stingray Defeated"]   = "jetstingraydefeated",
    ["Split Mushroom Defeated"] = "splitmushroomstageaccess",
    ["Slash Beast Defeated"]    = "slashbeaststageaccess",
    ["Frost Walrus Defeated"]   = "frostwalrusstageaccess",
}

function LocationHandler(section)
    local section_name = section.Name

    -- Advance Maverick progressive to stage 2 on boss defeat
    local progressive_code = BOSS_DEFEATED_TO_PROGRESSIVE[section_name]
    if progressive_code then
        local item_obj = Tracker:FindObjectForCode(progressive_code)
        if item_obj and item_obj.AcquiredCount < 2 then
            item_obj.AcquiredCount = 2
            print("[MMX4] " .. section_name .. " -> stage 2 (defeated)")
        end
    end

    -- Set spaceportcleared when Space Port Colonel is checked off
    if section_name == "Space Port Colonel Defeated" then
        local cleared = section.AvailableChestCount == 0
        local flag = Tracker:FindObjectForCode("spaceportcleared")
        if flag then
            flag.Active = cleared
            print("[MMX4] Space Port cleared = " .. tostring(cleared))
        end
    end
end

function StateChanged(code)
end
