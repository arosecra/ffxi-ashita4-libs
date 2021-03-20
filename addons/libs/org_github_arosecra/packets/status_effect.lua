
local bit = require("bit");
local bits = require('org_github_arosecra/bits');
local packets_status_effect = {}

--0x76


packets_status_effect.parse = function(packet)
	local new_party_status_effects = {}
	for i = 0, 4 do
		local userIndex = struct.unpack('H', packet, 8+1 + (i * 0x30));
		
		new_party_status_effects[i] = {}
		
		if (AshitaCore:GetMemoryManager():GetEntity():GetName(userIndex) ~= nil) then
		
			new_party_status_effects[i].Name = AshitaCore:GetMemoryManager():GetEntity():GetName(userIndex);
			new_party_status_effects[i].Statuses = {}
			
			for j = 0, 31 do
				local BitMask = bit.band(bit.rshift(struct.unpack('b', packet, bit.rshift(j, 2) + 0x0C + (i * 0x30) + 1), 2 * (j % 4)), 3);
				if (struct.unpack('b', packet, 0x14 + (i * 0x30) + j + 1) ~= -1 or BitMask > 0) then
					local buffid = bit.bor(struct.unpack('B', packet, 0x14 + (i * 0x30) + j + 1), bit.lshift(BitMask, 8));
					
					new_party_status_effects[i].Statuses[j] = {}
					new_party_status_effects[i].Statuses[j].Id = buffid;
					new_party_status_effects[i].Statuses[j].StatusName =	AshitaCore:GetResourceManager():GetString("statusnames", buffid, 2)
					print('got a status update for ' .. new_party_status_effects[i].Name .. ' ' .. new_party_status_effects[i].Statuses[j].Id .. ' ' .. new_party_status_effects[i].Statuses[j].StatusName)
				end
			end
		end
	end
	return new_party_status_effects;



end




return packets_status_effect;