
require("common");

local macros_configuration = {}

macros_configuration.load = function()
	AshitaCore:GetConfigurationManager():Load("macros", 'macros\\macros.ini');
end


macros_configuration.get_macro_by_id = function(macro_id)
	local macro = {
		spacer = true
	} 
	local macro_name = AshitaCore:GetConfigurationManager():GetString("macros", "macros", macro_id .. ".name");
	if macro_name ~= nil then
		macro.name = macro_name
		macro.command = AshitaCore:GetConfigurationManager():GetString("macros", "macros", macro_id .. ".command");
		macro.cycle = AshitaCore:GetConfigurationManager():GetString("macros", "macros", macro_id .. ".cycle");
		macro.script = AshitaCore:GetConfigurationManager():GetString("macros", "macros", macro_id .. ".script");
		macro.send_to = AshitaCore:GetConfigurationManager():GetString("macros", "macros", macro_id .. ".send_to");
		macro.send_target = AshitaCore:GetConfigurationManager():GetString("macros", "macros", macro_id .. ".send_target");
		macro.spacer = AshitaCore:GetConfigurationManager():GetString("macros", "macros", macro_id .. ".spacer");
	end
	return macro
end


return macros_configuration;