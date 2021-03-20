

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

return mechanics;