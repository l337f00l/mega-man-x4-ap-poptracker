-- MMX4 AP - Base Logic

MAVERICK_DEFEATED_CODES = {
    "webspiderdefeated", "cyberpeacockdefeated", "stormowldefeated",
    "magmadragoondefeated", "jetstingraydefeated", "splitmushroomdefeated",
    "slashbeastdefeated", "frostwalrusdefeated",
}

MAVERICK_WATCH_CODES = {
    "webspiderstageaccess", "cyberpeacockstageaccess", "stormowlstageaccess",
    "magmadragoonstageaccess", "jetstingraystageaccess", "splitmushroomstageaccess",
    "slashbeaststageaccess", "frostwalrusstageaccess",
}

function count_mavericks_defeated()
    local count = 0
    for _, code in ipairs(MAVERICK_DEFEATED_CODES) do
        if Tracker:ProviderCountForCode(code) > 0 then count = count + 1 end
    end
    return count
end

function has_four_bosses_defeated()
    return count_mavericks_defeated() >= 4
end

function has_all_bosses_defeated()
    return count_mavericks_defeated() >= 8
end

-- Final Weapon unlocks when the player manually toggles "Space Port Cleared"
-- in the settings popup after defeating Colonel
function has_space_port_cleared()
    return Tracker:ProviderCountForCode("spaceportcleared") > 0
end

function MMX4_StateChanged(code)
end

for _, code in ipairs(MAVERICK_WATCH_CODES) do
    ScriptHost:AddWatchForCode("maverick_watch_" .. code, code, MMX4_StateChanged)
end
ScriptHost:AddWatchForCode("space_port_watch", "spaceportcleared", MMX4_StateChanged)

-- Watch weapon/armor codes so access_rules re-evaluate when items are toggled
local WEAPON_WATCH_CODES = {
    "lightningweb", "risingfire", "twinslasher", "doublecyclone",
    "stockchargeupgrade", "plasmashotupgrade",
    "playing_as_x", "playing_as_zero", "legsupgrade",
}
for _, code in ipairs(WEAPON_WATCH_CODES) do
    ScriptHost:AddWatchForCode("weapon_watch_" .. code, code, MMX4_StateChanged)
end
