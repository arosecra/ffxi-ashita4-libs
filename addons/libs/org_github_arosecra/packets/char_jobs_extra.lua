
local bit = require("bit");
local bits = require('org_github_arosecra/bits');
local char_jobs_extra = {}

--0x44


char_jobs_extra.parse = function(packet)
	local pkt = {
		job        = struct.unpack('B', packet, 0x04 + 1),
		subjob     = struct.unpack('i2', packet, 0x05 + 1),
		unknown1   = struct.unpack('i1', packet, 0x06 + 1),
		auto       = {}
	}
	if pkt.job == 0x012 then
		pkt.auto = {
			head = struct.unpack('B', packet, 0x08 + 1),
			frame = struct.unpack('B', packet, 0x09 + 1),
			slots = {},
			
			name = struct.unpack('c16', packet, 0x58 + 1),
		}
		for i = 1, 12 do
			pkt.auto.slots[i] = struct.unpack('B', packet, 0x09+1+i)
		end
	end

	return pkt;
	
end




return char_jobs_extra;