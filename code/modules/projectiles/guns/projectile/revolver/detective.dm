/obj/item/gun/projectile/revolver/detective
	name = "\"Havelock\" revolver"
	desc = "A cheap H&S J-frame revolver, simple, reliable, uses 9mm."
	icon = 'icons/obj/guns/projectile/detective.dmi'
	fire_sound = 'sound/weapons/guns/fire/9mm_revolver.ogg'
	icon_state = "detective"
	drawChargeMeter = FALSE
	w_class = ITEM_SIZE_SMALL
	max_shells = 6
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_STEEL = 8, MATERIAL_WOOD = 6)
	price_tag = 250 //cheap civ peashooter revolver, something similar to olivav
	damage_multiplier = 1.15 //because pistol round
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(0.5) //Rule of Cool
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_SILENCABLE)
	serial_type = "H&S"

/obj/item/gun/projectile/revolver/detective/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
