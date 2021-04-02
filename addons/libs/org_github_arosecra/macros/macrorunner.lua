
require('common');

local macrorunner = {}

macrorunner.run_macro = function(macro, macro_arguments)
    if macro.send_target ~= nil then
        AshitaCore:GetChatManager():QueueCommand(1, '/ms sendto ' .. macro_arguments.Name .. ' /target [t]')
        coroutine.sleepf(1)
    end
    if macro.script ~= nil then
        AshitaCore:GetChatManager():QueueCommand(1, '/exec "' .. macro.script);
    elseif macro.command ~= nil then
        AshitaCore:GetChatManager():QueueCommand(1, macro.command);
    elseif macro.send_to ~= nil then
        AshitaCore:GetChatManager():QueueCommand(1, '/ms sendto ' .. macro_arguments.Name .. ' ' .. macro.send_to);
    end

end


return macrorunner