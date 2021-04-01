
require('common');

local standard_client = {}

standard_client.parse = function(packet)
    local result = {
		x = struct.unpack('f', packet, 0x04+1),
        z = struct.unpack('f', packet, 0x08+1),
        y = struct.unpack('f', packet, 0x0C+1),
        run_count = struct.unpack('H', packet, 0x12+1),
        rotation = struct.unpack('B', packet, 0x14+1),
        target_index = struct.unpack('B', packet, 0x16+1)
	};


    return result;

end


return standard_client;