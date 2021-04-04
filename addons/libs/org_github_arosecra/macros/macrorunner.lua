
require('common');

local macrorunner = {}

macrorunner.run_macro = function(macro, macro_arguments)
    if macro.send_target ~= nil then
        local command = string.gsub('/ms sendto $Name /target [t]', "%$(%w+)", macro_arguments)
        AshitaCore:GetChatManager():QueueCommand(1, command)
    end
    local command = nil;
    if macro.script ~= nil then
        command = '/exec "' .. macro.script;
    elseif macro.command ~= nil then
        command = macro.command;
    elseif macro.send_to ~= nil then
        command = '/ms sendto $Name ' .. macro.send_to;
    end
    if command ~= nil then
        command = string.gsub(command, "%$(%S+)", macro_arguments);
        --print(command);
        AshitaCore:GetChatManager():QueueCommand(1, command);
    end

end


return macrorunner