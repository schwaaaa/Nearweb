

/mob/proc/rightandwrong()
	usr << "<B>You summoned guns!</B>"
	message_admins("[key_name_admin(usr, 1)] summoned guns!")
	for(var/mob/living/carbon/human/H in player_list)
		if(H.stat == 2 || !(H.client)) continue
		if(is_special_character(H)) continue
		if(prob(25))
			ticker.mode.traitors += H.mind
			H.mind.special_role = "traitor"
			var/datum/objective/survive/survive = new
			survive.owner = H.mind
			H.mind.objectives += survive
			H << "<B>You are the survivor! Your own safety matters above all else, trust no one and kill anyone who gets in your way. However, armed as you are, now would be the perfect time to settle that score or grab that pair of yellow gloves you've been eyeing...</B>"
			var/obj_count = 1
			for(var/datum/objective/OBJ in H.mind.objectives)
				H << "<B>Objective #[obj_count]</B>: [OBJ.explanation_text]"
				obj_count++
		var/randomize = pick("taser","egun","laser","revolver","detective","smg","nuclear","deagle","gyrojet","pulse","silenced","cannon","doublebarrel","shotgun","combatshotgun","mateba","smg","uzi","crossbow","saw")
		switch (randomize)
			if("taser")
				new /obj/item/gun/energy/taser(get_turf(H))
			if("laser")
				new /obj/item/gun/energy/taser/leet/laser(get_turf(H))
			if("revolver")
				new /obj/item/gun/projectile(get_turf(H))
			if("detective")
				new /obj/item/gun/projectile/revolver/detective(get_turf(H))
			if("silenced")
				new /obj/item/gun/projectile/automatic/pistol(get_turf(H))
				new /obj/item/silencer(get_turf(H))
			if("doublebarrel")
				new /obj/item/gun/projectile/shotgun/(get_turf(H))
			if("shotgun")
				new /obj/item/gun/projectile/shotgun/(get_turf(H))
			if("combatshotgun")
				new /obj/item/gun/projectile/shotgun/combat(get_turf(H))
			if("mateba")
				new /obj/item/gun/projectile/revolver/mateba(get_turf(H))
			if("smg")
				new /obj/item/gun/projectile/automatic(get_turf(H))
			if("uzi")
				new /obj/item/gun/projectile/automatic/mini_uzi(get_turf(H))