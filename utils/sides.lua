H = wesnoth.require "lua/helper.lua"
_ = wesnoth.textdomain "wesnoth-The_Haunted_Woods"
unit = setmetatable({}, { __newindex = function(t, k, v) modu(k, v) end })
-- Define your global constants here.


H.set_wml_var_metatable(_G)

-- Define your global functions here.
function side_info()
	local s = 0
	local team_names = {}
	for t in H.all_teams() do
		s = s + 1
		table.insert(team_names,s,t.team_name)
	end
--	wesnoth.message("LUA_team_names",table.concat((team_names),", "))
	return s,team_names
end
local total_sides,team_names = side_info()

wesnoth.set_variable("thw_total_sides",total_sides)
wesnoth.set_variable("thw_total_sides_temp",total_sides)
H.set_variable_array("lua_side_info",team_names)
