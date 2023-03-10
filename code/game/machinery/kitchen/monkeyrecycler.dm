/obj/machinery/monkey_recycler
	name = "monkey recycler"
	desc = "A machine used for recycling dead monkeys into monkey cubes. It requires 5 monkeys per cube."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "grinder"
	layer = 2.9
	density = 1
	anchored = 1
	use_power = 1
	idle_power_usage = 5
	active_power_usage = 50
	var/grinded = 0

	attackby(obj/item/W as obj, mob/user as mob)
		if (istype(W, /obj/item/wrench))
			if (src.anchored)
				playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
				user << "\blue You begin to unfasten \the [src] from the floor..."
				if (do_after(user, 20))
					user.visible_message( \
						"[user] unfastens \the [src].", \
						"\blue You have unfastened \the [src].", \
						"You hear ratchet.")
					src.anchored = 0
			else
				playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
				user << "\blue You begin to fasten \the [src] to the floor..."
				if (do_after(user, 20))
					user.visible_message( \
						"[user] fastens \the [src].", \
						"\blue You have fastened \the [src].", \
						"You hear ratchet.")
					src.anchored = 1
		else
			..()
			return

/obj/machinery/monkey_recycler/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(default_unfasten_wrench(user, O))
		return

	if (src.stat != 0) //NOPOWER etc
		return
	if (istype(O, /obj/item/grab))
		var/obj/item/grab/G = O
		var/grabbed = G.affecting
		if(istype(grabbed, /mob/living/carbon/monkey))
			var/mob/living/carbon/monkey/target = grabbed
			if(target.stat == 0)
				user << "\red The monkey is struggling far too much to put it in the recycler."
			else
				user.drop_item()
				qdel(target)
				user << "\blue You stuff the monkey in the machine."
				playsound(src.loc, 'sound/machines/juicer.ogg', 50, 1)
				use_power(500)
				src.grinded++
				user << "\blue The machine now has [grinded] monkey\s worth of material stored."

		else
			user << "\red The machine only accepts monkeys!"
	return

/obj/machinery/monkey_recycler/attack_hand(var/mob/user as mob)
	if (src.stat != 0) //NOPOWER etc
		return
	if(grinded >= 5)
		user << "\blue The machine hisses loudly as it condenses the grinded monkey meat. After a moment, it dispenses a brand new monkey cube."
		playsound(src.loc, 'sound/machines/hiss.ogg', 50, 1)
		grinded -= 5
		new /obj/item/reagent_containers/food/snacks/monkeycube/wrapped(src.loc)
		user << "\blue The machine's display flashes that it has [grinded] monkeys worth of material left."
	else
		user << "\red The machine needs at least 5 monkeys worth of material to produce a monkey cube. It only has [grinded]."
	return
