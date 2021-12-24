

require('common');

local mechanics = {};

mechanics.health_percent_to_status = function(percentage)
	if percentage > .75 then
		return 'ok';
	elseif percentage > .50 then
		return 'caution';
	elseif percentage > .25 then
		return 'danger';
	else
		return 'critical';
	end
	return 'dead';
end

mechanics.is_ability_waiting_recast = function(ability_id)
	local result = false
	for i = 0, 31 do
		local id = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimerId(i);
		local timer = AshitaCore:GetMemoryManager():GetRecast():GetAbilityTimer(i);
		
		if ((id ~= 0 or i == 0) and timer > 0 and id == ability_id) then
			result = true
		end
	end	
	return result
end

mechanics.is_spell_waiting_recast = function(spell_id)
	local timer = AshitaCore:GetMemoryManager():GetRecast():GetSpellTimer(spell_id);
	return timer > 0
end

mechanics.is_status_active = function(status_id)
	local applied = false
	local status_list = AshitaCore:GetMemoryManager():GetPlayer():GetStatusIcons();
	for slot = 1, 32 do
		if status_list[slot] ~= nil then
			local buffid = status_list[slot]
			if buffid == status_id then
				applied = true
			end
		end
	end
	return applied
end

return mechanics;