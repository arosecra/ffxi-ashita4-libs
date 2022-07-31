require('common')

local light = {
	name = "Light",
	burst_elements = T{
		"Fire", "Light", "Wind", "Thunder"
	}
}

local radiance = {
	name = "Radiance",
	burst_elements = T{
		"Fire", "Light", "Wind", "Thunder"
	}
}

local darkness = {
	name = "Darkness",
	burst_elements = T{
		"Dark", "Stone", "Ice", "Water"
	}
}

local umbra = {
	name = "Umbra",
	burst_elements = T{
		"Dark", "Stone", "Ice", "Water"
	}
}

local gravitation = {
	name = "Gravitation",
	burst_elements = T{
		"Dark", "Stone"
	}
}

local fragmentation = {
	name = "Fragmentation",
	burst_elements = T{
		"Wind", "Thunder"
	}
}

local distortion = {
	name = "Distortion",
	burst_elements = T{
		"Water"
	}
}

local fusion = {
	name = "Fusion",
	burst_elements = T{
		"Light", "Fire"
	}
}

local compression = {
	name = "Compression",
	burst_elements = T{
		"Dark"
	}
}

local liquefaction = {
	name = "Liquefaction",
	burst_elements = T{
		"Fire"
	}
}

local induration = {
	name = "Induration",
	burst_elements = T{
		"Ice"
	}
}

local reverberation = {
	name = "Reverberation",
	burst_elements = T{
		"Water"
	}
}

local transfixion = {
	name = "Transfixion",
	burst_elements = T{
		"Light"
	}
}

local scission = {
	name = "Scission",
	burst_elements = T{
		"Stone"
	}
}

local detonation = {
	name = "Detonation",
	burst_elements = T{
		"Wind"
	}
}

local impaction = {
	name = "Impaction",
	burst_elements = T{
		"Thunder"
	}
}


local skillchains = {
	by_action_message_ids = {
	  [288] = light,
	  [289] = darkness,
	  [290] = gravitation,
	  [291] = fragmentation,
	  [292] = distortion,
	  [293] = fusion,
	  [294] = compression,
	  [295] = liquefaction,
	  [296] = induration,
	  [297] = reverberation,
	  [298] = transfixion,
	  [299] = scission,
	  [300] = detonation,
	  [301] = impaction,
	  [385] = light,
	  [386] = darkness,
	  [387] = gravitation,
	  [388] = fragmentation,
	  [389] = distortion,
	  [390] = fusion,
	  [391] = compression,
	  [392] = liquefaction,
	  [393] = induration,
	  [394] = reverberation,
	  [395] = transfixion,
	  [396] = scission,
	  [397] = detonation,
	  [398] = impaction,
	  [767] = radiance,
	  [768] = umbra,
      [769] = radiance,
      [770] = umbra,
	},
	by_name = {
		[light.name]=light,
		[darkness.name]=darkness,
		[gravitation.name]=gravitation,
		[fragmentation.name]=fragmentation,
		[distortion.name]=distortion,
		[fusion.name]=fusion,
		[compression.name]=compression,
		[liquefaction.name]=liquefaction,
		[induration.name]=induration,
		[reverberation.name]=reverberation,
		[transfixion.name]=transfixion,
		[scission.name]=scission,
		[detonation.name]=detonation,
		[impaction.name]=impaction,
		[radiance.name]=radiance,
		[umbra.name]=umbra
	}
}

return skillchains