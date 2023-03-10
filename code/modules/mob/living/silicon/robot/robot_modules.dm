/obj/item/robot_module
	name = "robot module"
	icon = 'icons/obj/module.dmi'
	icon_state = "std_module"
	w_class = 100.0
	item_state = "electronic"
	flags = FPRINT|TABLEPASS | CONDUCT

	var/list/modules = list()
	var/obj/item/emag = null
	var/obj/item/borg/upgrade/jetpack = null


	emp_act(severity)
		if(modules)
			for(var/obj/O in modules)
				O.emp_act(severity)
		if(emag)
			emag.emp_act(severity)
		..()
		return


	New()
		src.modules += new /obj/item/device/flashlight(src)
		src.modules += new /obj/item/device/flash(src)
		src.emag = new /obj/item/toy/sword(src)
		src.emag.name = "Placeholder Emag Item"
//		src.jetpack = new /obj/item/toy/sword(src)
//		src.jetpack.name = "Placeholder Upgrade Item"
		return


/obj/item/robot_module/proc/respawn_consumable(var/mob/living/silicon/robot/R)
	return

/obj/item/robot_module/proc/rebuild()//Rebuilds the list so it's possible to add/remove items from the module
	var/list/temp_list = modules
	modules = list()
	for(var/obj/O in temp_list)
		if(O)
			modules += O

/obj/item/robot_module/standard
	name = "standard robot module"


	New()
		..()
		src.modules += new /obj/item/melee/baton(src)
		src.modules += new /obj/item/extinguisher(src)
		src.modules += new /obj/item/wrench(src)
		src.modules += new /obj/item/crowbar(src)
		src.modules += new /obj/item/device/healthanalyzer(src)
		src.emag = new /obj/item/melee/energy/sword(src)
		return



/obj/item/robot_module/medical
	name = "medical robot module"


	New()
		..()
		src.modules += new /obj/item/borg/sight/hud/med(src)
		src.modules += new /obj/item/device/healthanalyzer(src)
		src.modules += new /obj/item/device/reagent_scanner/adv(src)
		src.modules += new /obj/item/reagent_containers/borghypo(src)
		src.modules += new /obj/item/reagent_containers/glass/beaker/large(src)
		src.modules += new /obj/item/reagent_containers/robodropper(src)
		src.modules += new /obj/item/reagent_containers/syringe(src)
		src.modules += new /obj/item/extinguisher/mini(src)
		src.emag = new /obj/item/reagent_containers/spray(src)

		src.emag.reagents.add_reagent("pacid", 250)
		src.emag.name = "Polyacid spray"
		return



/obj/item/robot_module/engineering
	name = "engineering robot module"


	New()
		..()
		src.modules += new /obj/item/borg/sight/meson(src)
		src.emag = new /obj/item/borg/stun(src)
		src.modules += new /obj/item/rcd/borg(src)
		src.modules += new /obj/item/extinguisher(src)
//		src.modules += new /obj/item/device/flashlight(src)
		src.modules += new /obj/item/weldingtool/largetank(src)
		src.modules += new /obj/item/screwdriver(src)
		src.modules += new /obj/item/wrench(src)
		src.modules += new /obj/item/crowbar(src)
		src.modules += new /obj/item/wirecutters(src)
		src.modules += new /obj/item/device/multitool(src)
		src.modules += new /obj/item/device/t_scanner(src)
		src.modules += new /obj/item/device/analyzer(src)

		var/obj/item/stack/sheet/metal/cyborg/M = new /obj/item/stack/sheet/metal/cyborg(src)
		M.amount = 50
		src.modules += M

		var/obj/item/stack/sheet/rglass/cyborg/G = new /obj/item/stack/sheet/rglass/cyborg(src)
		G.amount = 50
		src.modules += G

		var/obj/item/stack/cable_coil/W = new /obj/item/stack/cable_coil(src)
		W.amount = 50
		src.modules += W

		return


	respawn_consumable(var/mob/living/silicon/robot/R)
		var/list/what = list (
			/obj/item/stack/sheet/metal,
			/obj/item/stack/sheet/rglass,
			/obj/item/stack/cable_coil,
		)
		for (var/T in what)
			if (!(locate(T) in src.modules))
				src.modules -= null
				var/O = new T(src)
				src.modules += O
				O:amount = 1
		return



/obj/item/robot_module/security
	name = "security robot module"


	New()
		..()
		src.modules += new /obj/item/borg/sight/hud/sec(src)
		src.modules += new /obj/item/handcuffs/cyborg(src)
		src.modules += new /obj/item/melee/baton(src)


		return



/obj/item/robot_module/janitor
	name = "janitorial robot module"


	New()
		..()
		src.modules += new /obj/item/soap/nanotrasen(src)
		src.modules += new /obj/item/storage/bag/trash(src)
		src.modules += new /obj/item/mop(src)
		src.modules += new /obj/item/device/lightreplacer(src)
		src.emag = new /obj/item/reagent_containers/spray(src)

		src.emag.reagents.add_reagent("lube", 250)
		src.emag.name = "Lube spray"
		return



/obj/item/robot_module/butler
	name = "service robot module"


	New()
		..()
		src.modules += new /obj/item/reagent_containers/glass/bottle/beer(src)
		src.modules += new /obj/item/reagent_containers/food/condiment/enzyme(src)
		src.modules += new /obj/item/pen/robopen(src)

		var/obj/item/rsf/M = new /obj/item/rsf(src)
		M.matter = 30
		src.modules += M

		src.modules += new /obj/item/reagent_containers/robodropper(src)

		var/obj/item/flame/lighter/zippo/L = new /obj/item/flame/lighter/zippo(src)
		L.lit = 1
		src.modules += L

		src.modules += new /obj/item/tray/robotray(src)
		src.modules += new /obj/item/reagent_containers/food/drinks/shaker(src)
		src.emag = new /obj/item/reagent_containers/glass/bottle/beer(src)

		var/datum/reagents/R = new/datum/reagents(50)
		src.emag.reagents = R
		R.my_atom = src.emag
		R.add_reagent("beer2", 50)
		src.emag.name = "Mickey Finn's Special Brew"
		return



/obj/item/robot_module/miner
	name = "miner robot module"


	New()
		..()
		src.modules += new /obj/item/borg/sight/meson(src)
		src.emag = new /obj/item/borg/stun(src)
		src.modules += new /obj/item/storage/bag/ore(src)
		src.modules += new /obj/item/pickaxe/borgdrill(src)
		src.modules += new /obj/item/storage/bag/sheetsnatcher/borg(src)
//		src.modules += new /obj/item/shovel(src) Uneeded due to buffed drill
		return


/obj/item/robot_module/syndicate
	name = "syndicate robot module"


	New()
		src.modules += new /obj/item/melee/energy/sword(src)

		src.modules += new /obj/item/card/emag(src)
		return

/obj/item/robot_module/combat
	name = "combat robot module"

	New()
		src.modules += new /obj/item/borg/sight/thermal(src)


		src.modules += new /obj/item/borg/combat/shield(src)
		src.modules += new /obj/item/borg/combat/mobility(src)
		src.modules += new /obj/item/wrench(src) //Is a combat android really going to be stopped by a chair?

		return

//checks whether this item is a module of the robot it is located in.
/obj/item/proc/is_robot_module()
	if (!istype(src.loc, /mob/living/silicon/robot))
		return 0

	var/mob/living/silicon/robot/R = src.loc

	return (src in R.module.modules)
