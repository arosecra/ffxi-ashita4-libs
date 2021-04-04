
require("common");

local macros_configuration = {}

macros_configuration.load = function()
	AshitaCore:GetConfigurationManager():Load("macros", 'macros\\macros.ini');
end

macros_configuration.get_macro_by_id = function(macro_id)
	local configMgr = AshitaCore:GetConfigurationManager();
	local macro = {
		macro_id = macro_id,
		macro_name = configMgr:GetString("macros", "macros", macro_id .. ".name"),
		command = configMgr:GetString("macros", "macros", macro_id .. ".command"),
		script =  configMgr:GetString("macros", "macros", macro_id .. ".script"),
		send_to = configMgr:GetString("macros", "macros", macro_id .. ".send_to"),
		send_target = configMgr:GetString("macros", "macros", macro_id .. ".send_target"),
		spacer = configMgr:GetString("macros", "macros", macro_id .. ".spacer"),
		recast = configMgr:GetString("macros", "macros", macro_id .. ".recast"),
	}

	if #macro == 1 then
		macro = {
			macro_id = macro_id,
			spacer = true
		}
	end
	return macro;
end


return macros_configuration;