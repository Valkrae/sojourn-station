/obj/item/gun/energy/laser
	name = "\"Lightfall\" laser rifle"
	desc = "\"Old Testament\" brand laser carbine. Deadly and radiant, like the divine wrath it represents."
	icon = 'icons/obj/guns/energy/laser.dmi'
	icon_state = "laser"
	item_state = "laser"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/Laser.ogg'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 8, MATERIAL_SILVER = 5)
	price_tag = 550
	projectile_type = /obj/item/projectile/beam/midlaser
	fire_delay = 5
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = TRUE
	serial_type = "Absolute"

/obj/item/gun/energy/laser/mounted
	self_recharge = TRUE
	use_external_power = TRUE
	safety = FALSE
	restrict_safety = TRUE
	damage_multiplier = 0.7
	twohanded = FALSE
	serial_type = "SI"

/obj/item/gun/energy/laser/mounted/blitz
	name = "SDF LR \"Strahl\""
	desc = "A miniaturized laser rifle, remounted for robotic use only."
	icon_state = "laser_turret"
	damage_multiplier = 0.9
	charge_meter = FALSE
	twohanded = FALSE
	serial_type = "GP"

/obj/item/gun/energy/laser/mounted/cyborg
	name = "integrated \"Cog\" lasgun"
	desc = "A Greyson Positronic design, cheap and widely produced. In the distant past - this was the main weapon of low-rank police forces, billions of copies of this gun were made."
	icon = 'icons/obj/guns/energy/cog.dmi'
	icon_state = "cog"
	recharge_time = 4 //Time it takes for shots to recharge (in ticks)
	damage_multiplier = 0.8
	projectile_type = /obj/item/projectile/beam/heavylaser
	cell_type = /obj/item/cell/medium/moebius/high
	charge_cost = 50

/obj/item/gun/energy/laser/practice
	name = "OT LG \"Lightfall\" - P"
	desc = "A modified version of \"Old Testament\" brand laser carbine, this one fires less concentrated energy bolts, designed for target practice."
	matter = list(MATERIAL_STEEL = 10, MATERIAL_WOOD = 2)
	price_tag = 150
	projectile_type = /obj/item/projectile/beam/practice

/obj/item/gun/energy/captain
	name = "\"Destiny\" energy pistol"
	icon = 'icons/obj/guns/energy/capgun.dmi'
	icon_state = "caplaser"
	item_state = "caplaser"
	item_charge_meter = TRUE
	desc = "This weapon is old, yet still robust and reliable. It's marked with an old Greyson Positronic brand, a distant reminder of what this corporation was, before it fell to ruin."
	force = WEAPON_FORCE_PAINFUL
	fire_sound = 'sound/weapons/energy/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam
	origin_tech = null
	self_recharge = TRUE
	price_tag = 2250
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	serial_type = "GP"

/obj/item/gun/energy/zwang
	name = "\"Zwang\" energy revolver"
	desc = "The \"Zwang\" is a law enforcer's best friend of a sidearm. Carrying both an extremely effective lethal and non-lethal firemode. \
	Luckily it does not sacrifice style for effiency neither. The 'revolver' spins its cell while firing, mimicking that of a double-action to make use of multiple connection points."
	icon = 'icons/obj/guns/energy/zwang.dmi'
	icon_state = "zwang"
	item_state = "zwang"
	item_charge_meter = TRUE
	can_dual = TRUE
	charge_cost = 160
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 6)
	price_tag = 1400

	init_firemodes = list(
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_sound = 'sound/weapons/energy/Taser.ogg', fire_delay=35, icon="stun"),
		list(mode_name="lethal", projectile_type=/obj/item/projectile/beam/midlaser, fire_sound='sound/weapons/energy/Laser.ogg', fire_delay=10, icon="kill"),
	)
	serial_type = "NM"

/obj/item/gun/energy/zwang/update_icon()
	..()
	overlays.Cut()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stunshot")
		add_overlay("tazer_zwang")
	else
		add_overlay("laser_zwang")
