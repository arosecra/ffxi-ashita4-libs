

local imgui = require('imgui');
local common = require('common');
local libs2config = require('org_github_arosecra/config');

local libs2imgui = {};

libs2imgui.get_color = function(category, status)
	local configMgr = AshitaCore:GetConfigurationManager();
	return {
		configMgr:GetFloat("imguistyle", "colors", category .. '.' .. status .. ".x", 0), 
		configMgr:GetFloat("imguistyle", "colors", category .. '.' .. status .. ".y", 0), 
		configMgr:GetFloat("imguistyle", "colors", category .. '.' .. status .. ".w", 0), 
		configMgr:GetFloat("imguistyle", "colors", category .. '.' .. status .. ".z", 0), 
	}
end

libs2imgui.gui_style_table_to_var = function(alias, section, key)
	local t = libs2config.get_string_table(alias, section, key)
	local result = 0;
	t:each(function(v, i)
		if _G[v] ~= nil then
			result = bit.bor(result, _G[v]);
		end
	end);

	return result;
end

libs2imgui.imgui_set_window = function(section)
	local window_position_x = AshitaCore:GetConfigurationManager():GetFloat("imguistyle", section, "window.position.x", 0);
	local window_position_y = AshitaCore:GetConfigurationManager():GetFloat("imguistyle", section, "window.position.y", 0);
	local window_position_style = libs2imgui.gui_style_table_to_var("imguistyle", section, "window.position.style");
	if window_position_x ~= 0 or window_position_y ~= 0 then
		imgui.SetNextWindowPos({ window_position_x, window_position_y }, window_position_style);
	end
	
	local window_size_height = AshitaCore:GetConfigurationManager():GetFloat("imguistyle", section, "window.size.height", 0);
	local window_size_width = AshitaCore:GetConfigurationManager():GetFloat("imguistyle", section, "window.size.width", 0);
	local window_size_style = libs2imgui.gui_style_table_to_var("imguistyle", section, "window.size.style");
	if window_size_height ~= 0 or window_size_width ~= 0 then
		imgui.SetNextWindowSize({ window_size_width, window_size_height }, window_size_style);
	end

end

return libs2imgui;