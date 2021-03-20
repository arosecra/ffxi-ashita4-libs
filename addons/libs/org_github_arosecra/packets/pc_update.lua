
local bit = require("bit");
local bits = require('org_github_arosecra/bits');
local pc_update = {}

--0x0D


pc_update.parse = function(packet)
	local pkt = {
		id = struct.unpack('i4', packet, 0x04+1), 
		index = struct.unpack('H', packet, 0x08+1),
		update = {
			raw = struct.unpack('B', packet, 0x0A+1)
		},
		heading = struct.unpack('B', packet, 0x0B+1),
		x = struct.unpack('f', packet, 0x0C+1),
		y = struct.unpack('f', packet, 0x10+1),
		z = struct.unpack('f', packet, 0x14+1),
		race = struct.unpack('B', packet, 0x49+1)
	}
	pkt.update.position = bit.band(pkt.update.raw, 0x01)
	pkt.update.status   = bit.band(pkt.update.raw, 0x02)
	pkt.update.hp       = bit.band(pkt.update.raw, 0x04)
	pkt.update.combat   = bit.band(pkt.update.raw, 0x07)
	pkt.update.name     = bit.band(pkt.update.raw, 0x08)
	pkt.update.look     = bit.band(pkt.update.raw, 0x10)
	pkt.update.mob      = bit.band(pkt.update.raw, 0x0F)
	pkt.update.all      = bit.band(pkt.update.raw, 0x1F)
	pkt.update.despawn  = bit.band(pkt.update.raw, 0x20)
	local e = GetEntity(pkt.index);
	if (e ~= nil) then
		pkt.entity = e
	end
	
end




return pc_update;