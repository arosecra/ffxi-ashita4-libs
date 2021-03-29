
local bit = require("bit");
local ffi = require('ffi');
require('win32types');

local bits = {}

local function extract_be(cast_type, lByteOffset, lBitOffset, bitmask, data)
		local ptr = ffi.cast('uint8_t*', data);
		local realBitMask = ffi.cast(cast_type, bitmask);
		local enclosedData = ffi.cast(cast_type .. '*', ptr+lByteOffset)
		local bandedBitMask = bit.band(enclosedData[0], realBitMask);
		return bit.rshift(bandedBitMask, lBitOffset);
end

--based off of UnpackBitsBE in BinaryData.h from Ashita
-- should be a temporary work around
bits.unpack_bits_be = function(data, byteOffset, bitOffset, length)
	local lByteOffset = byteOffset + bitOffset;
	lByteOffset = bit.rshift(bitOffset, 3);
	
	local lBitOffset = bitOffset %8;
	
	local bitmask = 0xFFFFFFFFFFFFFFFFLL;
	local bitmaskLength = 64- length;
	bitmask = bit.rshift(bitmask, bitmaskLength);
	bitmask = bit.lshift(bitmask, lBitOffset);
	
	local result = 0;
	local l = length + lBitOffset;
	if(l <= 8) then
		result = extract_be('uint8_t', lByteOffset, lBitOffset, bitmask, data);
	elseif (l <= 16) then
		result = extract_be('uint16_t', lByteOffset, lBitOffset, bitmask, data);
	elseif (l <= 32) then
		result = extract_be('uint32_t', lByteOffset, lBitOffset, bitmask, data);
	elseif (l <= 64) then
		result = extract_be('uint64_t', lByteOffset, lBitOffset, bitmask, data);
	end
	
	return tonumber(result);
end

return bits;