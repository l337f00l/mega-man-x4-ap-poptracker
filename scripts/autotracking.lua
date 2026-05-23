-- Configuration
AUTOTRACKER_ENABLE_ITEM_TRACKING = true
AUTOTRACKER_ENABLE_LOCATION_TRACKING = true
AUTOTRACKER_ENABLE_DEBUG_LOGGING = true and ENABLE_DEBUG_LOG
AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP = true and AUTOTRACKER_ENABLE_DEBUG_LOGGING
AUTOTRACKER_ENABLE_DEBUG_LOGGING_SNES = true and AUTOTRACKER_ENABLE_DEBUG_LOGGING

print("")
print("Active Auto-Tracker Configuration")
print("---------------------------------------------------------------------")
print("Enable Item Tracking:         ", AUTOTRACKER_ENABLE_ITEM_TRACKING)
print("Enable Location Tracking:     ", AUTOTRACKER_ENABLE_LOCATION_TRACKING)
print("Enable Debug Logging:         ", AUTOTRACKER_ENABLE_DEBUG_LOGGING)
print("---------------------------------------------------------------------")
print("")

require("scripts/autotracking/archipelago")
