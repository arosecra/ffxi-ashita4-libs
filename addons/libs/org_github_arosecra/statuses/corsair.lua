local corsair = {
	status_effects = {
		by_id = {},
		by_name = {}
	}
}

corsair.status_effects.by_name['Double-Up Chance']  = 308
corsair.status_effects.by_name['Bust']              = 309
corsair.status_effects.by_name['Fighter\'s Roll']   = 310
corsair.status_effects.by_name['Monk\'s Roll']      = 311
corsair.status_effects.by_name['Healer\'s Roll']    = 312
corsair.status_effects.by_name['Wizard\'s Roll']    = 313
corsair.status_effects.by_name['Warlock\'s Roll']   = 314
corsair.status_effects.by_name['Rogue\'s Roll']     = 315
corsair.status_effects.by_name['Gallant\'s Roll']   = 316
corsair.status_effects.by_name['Chaos Roll']        = 317
corsair.status_effects.by_name['Beast Roll']        = 318
corsair.status_effects.by_name['Choral Roll']       = 319
corsair.status_effects.by_name['Hunter\'s Roll']    = 320
corsair.status_effects.by_name['Samurai Roll']      = 321
corsair.status_effects.by_name['Ninja Roll']        = 322
corsair.status_effects.by_name['Drachen Roll']      = 323
corsair.status_effects.by_name['Evoker\'s Roll']    = 324
corsair.status_effects.by_name['Magus\'s Roll']     = 325
corsair.status_effects.by_name['Corsair\'s Roll']   = 326
corsair.status_effects.by_name['Puppet Roll']       = 327
corsair.status_effects.by_name['Dancer\'s Roll']    = 328
corsair.status_effects.by_name['Scholar\'s Roll']   = 329
corsair.status_effects.by_name['Bolter\'s Roll']    = 330
corsair.status_effects.by_name['Caster\'s Roll']    = 331
corsair.status_effects.by_name['Courser\'s Roll']   = 332
corsair.status_effects.by_name['Blitzer\'s Roll']   = 333
corsair.status_effects.by_name['Tactician\'s Roll'] = 334
corsair.status_effects.by_name['Allies\'s Roll']    = 335
corsair.status_effects.by_name['Miser\'s Roll']     = 336
corsair.status_effects.by_name['Companion\'s Roll'] = 337
corsair.status_effects.by_name['Avenger\'s Roll']   = 338
corsair.status_effects.by_name['Naturalist\'s Roll']= 339
corsair.status_effects.by_name['Runeist\'s Roll']   = 600

corsair.status_effects.by_id[308] = {name='Double-Up Chance'  , category='roll_status'}
corsair.status_effects.by_id[309] = {name='Bust'              , category='roll_status'}
corsair.status_effects.by_id[310] = {name='Fighter\'s Roll'   , lucky='5', category='roll'}
corsair.status_effects.by_id[311] = {name='Monk\'s Roll'      , lucky='3', category='roll'}
corsair.status_effects.by_id[312] = {name='Healer\'s Roll'    , lucky='3', category='roll'}
corsair.status_effects.by_id[313] = {name='Wizard\'s Roll'    , lucky='4', category='roll'}
corsair.status_effects.by_id[314] = {name='Warlock\'s Roll'   , lucky='4', category='roll'}
corsair.status_effects.by_id[315] = {name='Rogue\'s Roll'     , lucky='5', category='roll'}
corsair.status_effects.by_id[316] = {name='Gallant\'s Roll'   , lucky='3', category='roll'}
corsair.status_effects.by_id[317] = {name='Chaos Roll'        , lucky='4', category='roll'}
corsair.status_effects.by_id[318] = {name='Beast Roll'        , lucky='4', category='roll'}
corsair.status_effects.by_id[319] = {name='Choral Roll'       , lucky='2', category='roll'}
corsair.status_effects.by_id[320] = {name='Hunter\'s Roll'    , lucky='4', category='roll'}
corsair.status_effects.by_id[321] = {name='Samurai Roll'      , lucky='2', category='roll'}
corsair.status_effects.by_id[322] = {name='Ninja Roll'        , lucky='4', category='roll'}
corsair.status_effects.by_id[323] = {name='Drachen Roll'      , lucky='4', category='roll'}
corsair.status_effects.by_id[324] = {name='Evoker\'s Roll'    , lucky='5', category='roll'}
corsair.status_effects.by_id[325] = {name='Magus\'s Roll'     , lucky='2', category='roll'}
corsair.status_effects.by_id[326] = {name='Corsair\'s Roll'   , lucky='5', category='roll'}
corsair.status_effects.by_id[327] = {name='Puppet Roll'       , lucky='3', category='roll'}
corsair.status_effects.by_id[328] = {name='Dancer\'s Roll'    , lucky='3', category='roll'}
corsair.status_effects.by_id[329] = {name='Scholar\'s Roll'   , lucky='2', category='roll'}
corsair.status_effects.by_id[330] = {name='Bolter\'s Roll'    , lucky='3', category='roll'}
corsair.status_effects.by_id[331] = {name='Caster\'s Roll'    , lucky='2', category='roll'}
corsair.status_effects.by_id[332] = {name='Courser\'s Roll'   , lucky='3', category='roll'}
corsair.status_effects.by_id[333] = {name='Blitzer\'s Roll'   , lucky='4', category='roll'}
corsair.status_effects.by_id[334] = {name='Tactician\'s Roll' , lucky='5', category='roll'}
corsair.status_effects.by_id[335] = {name='Allies\'s Roll'    , lucky='3', category='roll'}
corsair.status_effects.by_id[336] = {name='Miser\'s Roll'     , lucky='5', category='roll'}
corsair.status_effects.by_id[337] = {name='Companion\'s Roll' , lucky='2', category='roll'}
corsair.status_effects.by_id[338] = {name='Avenger\'s Roll'   , lucky='4', category='roll'}
corsair.status_effects.by_id[339] = {name='Naturalist\'s Roll', lucky='3', category='roll'}
corsair.status_effects.by_id[600] = {name='Runeist\'s Roll'   , lucky='4', category='roll'}


return corsair;