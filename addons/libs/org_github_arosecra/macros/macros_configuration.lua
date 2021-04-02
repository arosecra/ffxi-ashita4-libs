
require("common");

local macros_configuration = {}

macros_configuration.load = function()
	AshitaCore:GetConfigurationManager():Load("macros", 'macros\\macros.ini');
end


macros_configuration.get_macro_by_id = function(macro_id)
	local configMgr = AshitaCore:GetConfigurationManager();
	local macro = {
		spacer = true,
		macro_id = macro_id
	}
	local macro_name = configMgr:GetString("macros", "macros", macro_id .. ".name");
	if macro_name ~= nil then
		macro.name = macro_name
		macro.command = configMgr:GetString("macros", "macros", macro_id .. ".command");
		macro.script =  configMgr:GetString("macros", "macros", macro_id .. ".script");
		macro.send_to = configMgr:GetString("macros", "macros", macro_id .. ".send_to");
		macro.send_target = configMgr:GetString("macros", "macros", macro_id .. ".send_target");
		macro.spacer = configMgr:GetString("macros", "macros", macro_id .. ".spacer");
		macro.recast = configMgr:GetString("macros", "macros", macro_id .. ".recast");
	end
	return macro
end


return macros_configuration;