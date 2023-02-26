--- modulename
--
-- Module description.
--
-- @header Description to put at the top of the compiled file.
--
-- @author TFM:authorname#0000 DC:authorname#8263
pshy.require("pshy.essentials")
pshy.require("pshy.events")
pshy.require("pshy.perms")
pshy.require("pshy.bases.version")


-- Disables ground parsing
local mapinfo = pshy.require("pshy.rotations.mapinfo")
mapinfo.max_grounds = 0



--- Maps
local rotations = pshy.require("pshy.rotations.list")
local newgame = pshy.require("pshy.rotations.newgame")
local Rotation = pshy.require("pshy.utils.rotation")
local maps = pshy.require("pshy.maps.list")

local levels = pshy.require("trap_levels")


rotations["module"] = Rotation:New({items = {}, autoskip = false, is_random = false, shamans = 0})
local map_list = rotations["module"].items


-- Test Level
maps["test"] = {author = "Lays#1146", xml = levels["test"].xml, duration = 8 * 60}
maps["test"].traps = levels["test"].traps
table.insert(map_list, "test")



--- TFM Settings:
--system.disableChatCommandDisplay(nil, true)
--tfm.exec.disableAfkDeath(true)
--tfm.exec.disableAutoNewGame(true)
--tfm.exec.disableAutoScore(true)
--tfm.exec.disableAutoShaman(true)
--tfm.exec.disableAutoTimeLeft(true)
--tfm.exec.disableDebugCommand(true)
--tfm.exec.disableMinimalistMode(true)
--tfm.exec.disablePhysicalConsumables(true)



--local loadersync = pshy.require("pshy.anticheats.loadersync")
--loadersync.enabled = true										-- Enable to force the sync player (this can cause problems with some scrips).
--local mapinfo = pshy.require("pshy.rotations.mapinfo")
--mapinfo.max_grounds = 50										-- Set the maximum amount of grounds parsed by `pshy_mapinfo`.
--local newgame = pshy.require("pshy.rotations.newgame")
--newgame.update_map_name_on_new_player = true					-- Enable or disable updating UI informations for new players.
local perms = pshy.require("pshy.perms")
perms.authors["Pshy#3752"] = true								-- Replace with your account name.
perms.auto_admin_authors = false								-- Allow the use of `!adminme` for authors in funcorp rooms.
local version = pshy.require("pshy.bases.version")
version.days_before_update_suggested = 14						-- How old the script should be before suggesting an update (`nil` to disable).
version.days_before_update_advised = 30							-- How old the script should be before requesting an update (`nil` to disable).
version.days_before_update_required = nil						-- How old the script should be before refusing to start (`nil` to disable).



function eventInit()
	newgame.SetRotation("module")
	tfm.exec.newGame("module")
end
