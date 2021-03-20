
local bits = require('org.github.arosecra/bits');
local packets_action = {}

packets_action.parse = function(packet)
-- Collect top-level metadata. The category field will provide the context
    -- for the rest of the packet - that should be enough information to figure
    -- out what each target and action field are used for.
    local action = {
        -- Windower code leads me to believe param and recast might be at
        -- different indices - 102 and 134, respectively. Confusing.
        actor_id     = bits.unpack_bits_be(packet, 0,  40, 32),
        target_count = bits.unpack_bits_be(packet, 0,  72,  8),
        category     = bits.unpack_bits_be(packet, 0,  82,  4),
        param        = bits.unpack_bits_be(packet, 0,  86, 10),
        recast       = bits.unpack_bits_be(packet, 0, 118, 10),
        unknown      = 0,
        targets      = {}
    }

    local bit_offset = 150

    -- Collect target information. The ID is the server ID, not the entity idx.
    for i = 1, action.target_count do
        action.targets[i] = {
            id           = bits.unpack_bits_be(packet, 0, bit_offset,      32),
            action_count = bits.unpack_bits_be(packet, 0, bit_offset + 32,  4),
            actions      = {}
        }

        -- Collect per-target action information. This is where more identifiers
        -- for what's being used lie - often the animation can be used for that
        -- purpose. Otherwise the message may be what you want.
        for j = 1, action.targets[i].action_count do
            action.targets[i].actions[j] = {
                reaction  = bits.unpack_bits_be(packet, 0, bit_offset + 36,  5),
                animation = bits.unpack_bits_be(packet, 0, bit_offset + 41, 11),
                effect    = bits.unpack_bits_be(packet, 0, bit_offset + 53,  2),
                stagger   = bits.unpack_bits_be(packet, 0, bit_offset + 55,  7),
                param     = bits.unpack_bits_be(packet, 0, bit_offset + 63, 17),
                message   = bits.unpack_bits_be(packet, 0, bit_offset + 80, 10),
                unknown   = bits.unpack_bits_be(packet, 0, bit_offset + 90, 31)
            }

            -- Collect additional effect information for the action. This is
            -- where you'll find information about skillchains, enspell damage,
            -- et cetera.
            if bits.unpack_bits_be(packet, 0, bit_offset + 121, 1) == 1 then
                action.targets[i].actions[j].has_add_effect       = true
                action.targets[i].actions[j].add_effect_animation = bits.unpack_bits_be(packet, 0, bit_offset + 122, 10)
                action.targets[i].actions[j].add_effect_effect    = nil -- unknown value
                action.targets[i].actions[j].add_effect_param     = bits.unpack_bits_be(packet, 0, bit_offset + 132, 17)
                action.targets[i].actions[j].add_effect_message   = bits.unpack_bits_be(packet, 0, bit_offset + 149, 10)

                bit_offset = bit_offset + 37
            else
                action.targets[i].actions[j].has_add_effect       = false
                action.targets[i].actions[j].add_effect_animation = nil
                action.targets[i].actions[j].add_effect_effect    = nil
                action.targets[i].actions[j].add_effect_param     = nil
                action.targets[i].actions[j].add_effect_message   = nil
            end

            -- Collect spike effect information for the action.
            if bits.unpack_bits_be(packet, bit_offset + 122, 1) == 1 then
                action.targets[i].actions[j].has_spike_effect       = true
                action.targets[i].actions[j].spike_effect_animation = bits.unpack_bits_be(packet, 0, bit_offset + 123, 10)
                action.targets[i].actions[j].spike_effect_effect    = nil -- unknown value
                action.targets[i].actions[j].spike_effect_param     = bits.unpack_bits_be(packet, 0, bit_offset + 133, 14)
                action.targets[i].actions[j].spike_effect_message   = bits.unpack_bits_be(packet, 0, bit_offset + 147, 10)

                bit_offset = bit_offset + 34
            else
                action.targets[i].actions[j].has_spike_effect       = false
                action.targets[i].actions[j].spike_effect_animation = nil
                action.targets[i].actions[j].spike_effect_effect    = nil
                action.targets[i].actions[j].spike_effect_param     = nil
                action.targets[i].actions[j].spike_effect_message   = nil
            end

            bit_offset = bit_offset + 87
        end

        bit_offset = bit_offset + 36
    end

    return action
end





return packets_action;