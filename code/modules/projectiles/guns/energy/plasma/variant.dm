/obj/item/gun/hydrogen/pistol
	name = "\improper \"Classia\" hydrogen-plasma pistol"
	desc = "A volatile but powerful weapon that uses hydrogen flasks to fire destructive plasma bolts. The brainchild of Soteria Director Nakharan Mkne, meant to compete with and exceed capabilities of Absolutist \
	own plasma weapon designs, it succeeded. However, it did so by being extremely dangerous, requiring an intelligent and careful operator who can correctly manage the weapon's extreme heat generation over heating without being \
	burnt to a crisp. This variant is a pistol, capable of fitting a holster for discrete travel and easy drawing."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "pistol"
	twohanded = FALSE
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 6, TECH_PLASMA = 5)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_MHYDROGEN = 1, MATERIAL_TRITIUM = 1)
	projectile_type = /obj/item/projectile/hydrogen/pistol
	use_plasma_cost = 10 // How much plasma is used per shot
	heat_per_shot = 25

	init_firemodes = list(
		list(mode_name = "standard", mode_desc="A large ball of hydrogen to blow up bulwarks or weak targets", projectile_type = /obj/item/projectile/hydrogen/pistol, fire_sound = 'sound/weapons/energy/lasercannonfire.ogg', icon = "destroy", heat_per_shot = 25, use_plasma_cost = 10),
		list(mode_name = "overclock", mode_desc="A large ball of volatile hydrogen to blow up cover or targets", projectile_type = /obj/item/projectile/hydrogen/pistol/max, fire_sound = 'sound/effects/supermatter.ogg', icon = "kill", heat_per_shot = 40, use_plasma_cost = 20)
	)

/obj/item/gun/hydrogen/cannon
	name = "\improper \"Sollex\" hydrogen-plasma cannon"
	desc = "A volatile but powerful weapon that uses hydrogen flasks to fire destructive plasma bolts. The brainchild of Soteria Director Nakharan Mkne, meant to compete with and exceed capabilities of Absolutist \
	own plasma weapon designs, it succeeded. However, it did so by being extremely dangerous, requiring an intelligent and careful operator who can correctly manage the weapon's extreme heat generation over heating without being \
	burnt to a crisp."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "cannon"
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_MHYDROGEN = 2, MATERIAL_TRITIUM = 1)
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 7, TECH_PLASMA = 10)
	projectile_type = /obj/item/projectile/hydrogen/cannon
	use_plasma_cost = 20 // How much plasma is used per shot
	heat_per_shot = 50
	vent_level_timer = 10 SECONDS //10 seconds between vents, but builds heat a lot faster.
	init_firemodes = list(
		list(mode_name = "standard", mode_desc="A large ball of hydrogen to blow up bulwarks or weak targets", projectile_type = /obj/item/projectile/hydrogen/cannon, fire_sound = 'sound/weapons/energy/lasercannonfire.ogg', fire_delay = 30, icon = "destroy", use_plasma_cost = 20),
		list(mode_name = "overclock", mode_desc="A large ball of volatile hydrogen to blow up cover or targets", projectile_type = /obj/item/projectile/hydrogen/cannon/max, fire_sound = 'sound/effects/supermatter.ogg', fire_delay = 50, icon = "kill", use_plasma_cost = 40)
	)
	twohanded = TRUE
	can_dual = FALSE

// Blue cross weapon, no overheat.
/obj/item/gun/hydrogen/incinerator
	name = "\improper \"Reclaimator\" hydrogen-plasma gun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	This plasma gun doesn't seems to heat up."
	icon_state = "prifle"
	use_plasma_cost = 10
	heat_per_shot = 0 // No heat gain.
	origin_tech = list(TECH_COMBAT = 15, TECH_MATERIAL = 7, TECH_PLASMA = 25)
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_MHYDROGEN = 3, MATERIAL_TRITIUM = 2)
	init_firemodes = list(
		list(mode_name = "standard", mode_desc="A large ball of hydrogen to blow up bulwarks or weak targets", projectile_type = /obj/item/projectile/hydrogen, fire_sound = 'sound/weapons/energy/lasercannonfire.ogg', fire_delay = 30, icon = "destroy", use_plasma_cost = 10, icon_state = "prifle"),
		list(mode_name = "overclock", mode_desc="A large ball of volatile hydrogen to blow up cover or targets", projectile_type = /obj/item/projectile/hydrogen/max, fire_sound = 'sound/effects/supermatter.ogg', fire_delay = 50, icon = "kill", use_plasma_cost = 20, icon_state = "prifle_crit")
	)
	serial_type = "BlueCross"

/obj/item/gun/hydrogen/plasma_torch
	name = "\improper Welder Gun"
	desc = "A plasma welder converted to shoot plasma bolts. Has less range than a \"Classia\"-Pattern Plasma Pistol."
	icon_state = "welder"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_MHYDROGEN = 1, MATERIAL_TRITIUM = 1)
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 7, TECH_PLASMA = 7)
	projectile_type = /obj/item/projectile/hydrogen/pistol/welder
	twohanded = FALSE
	w_class = ITEM_SIZE_SMALL
	init_firemodes = list()
	safety = FALSE // It's a welder turned into a gun, it doesn't have any nifty safeties, and even if it did, the player had to deactivate them to turn the welder into a gun in the first place.
	restrict_safety = TRUE // Can't change the safety on something that doesn't have any. Look here ^ - R4d6
	var/obj/item/tool/plasma_torch/welder = null // Hold the welder the gun turns into.
	serial_type = "INDEX"
	serial_shown = FALSE


// This is where the gun turn into a welder
/obj/item/gun/hydrogen/plasma_torch/verb/switch_to_welder()
	set name = "Enable Safeties"
	set desc = "Enable the safeties, making the welder gun able to weld once more."
	set category = "Object"

	if(!welder) // Safety check if there isn't a welder.
		welder = new /obj/item/tool/plasma_torch(src)
		welder.gun = src
	if(flask) // Give the welder the same flask the gun has, but only if there's a flask.
		welder.flask = flask // Link the flask to the welder
		flask.forceMove(welder) // Give the flask to the welder
		flask = null // The gun has no more flask
	usr.remove_from_mob(src) // Remove the gun from the user
	usr.put_in_hands(welder) // Put the welder in the user's hand.
	src.forceMove(welder) // Move the gun into the welder
	usr.visible_message(
						SPAN_NOTICE("[usr] activate the safeties of the [src.name]."),
						SPAN_NOTICE("You activate the safeties of the [src.name].")
						)

/obj/item/gun/hydrogen/plasma_torch/Destroy()

	if (welder)
		welder.gun = null
		welder = null

	. = ..()
