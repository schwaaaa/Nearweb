//Also contains /obj/structure/closet/body_bag because I doubt anyone would think to look for bodybags in /object/structures

/obj/item/bodybag
	name = "body bag"
	desc = "A folded bag designed for the storage and transportation of cadavers."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "bodybag_folded"
	item_state = "bodybag"
	slot_flags = SLOT_BACK

	attack_self(mob/user)
		var/obj/structure/closet/body_bag/R = new /obj/structure/closet/body_bag(user.loc)
		R.add_fingerprint(user)
		qdel(src)


/obj/item/storage/box/bodybags
	name = "body bags"
	desc = "This box contains body bags."
	icon_state = "bodybags"
	New()
		..()
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)


/obj/structure/closet/body_bag
	name = "body bag"
	desc = "A plastic bag designed for the storage and transportation of cadavers."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "bodybag_closed"
	icon_closed = "bodybag_closed"
	icon_opened = "bodybag_open"
	var/item_path = /obj/item/bodybag
	heavy = 0
	density = 0


	attackby(W as obj, mob/user as mob)
		if (istype(W, /obj/item/pen))
			var/t = input(user, "What would you like the label to be?", text("[]", src.name), null)  as text
			if (user.get_active_hand() != W)
				return
			if (!in_range(src, user) && src.loc != user)
				return
			t = reject_bad_text(t)
			if (t)
				src.name = "body bag - "
				src.name += t
				src.overlays += image(src.icon, "bodybag_label")
			else
				src.name = "body bag"
		//..() //Doesn't need to run the parent. Since when can fucking bodybags be welded shut? -Agouri
			return
		else if(istype(W, /obj/item/wirecutters))
			user << "You cut the tag off the bodybag"
			src.name = "body bag"
			src.overlays.Cut()
			return


	close()
		if(..())
			density = 0
			return 1
		return 0


	MouseDrop(over_object, src_location, over_location)
		..()
		if((over_object == usr && (in_range(src, usr) || usr.contents.Find(src))))
			if(!ishuman(usr))	return
			if(opened)	return 0
			if(contents.len)	return 0
			visible_message("[usr] folds up the [src.name]")
			new item_path(get_turf(src))
			spawn(0)
				qdel(src)
			return

/obj/structure/closet/bodybag/update_icon()
	if(!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened


/obj/item/bodybag/cryobag
	name = "stasis bag"
	desc = "A folded, non-reusable bag designed to prevent additional damage to an occupant at the cost of genetic damage."
	icon = 'icons/obj/cryobag.dmi'
	icon_state = "bodybag_folded"

	attack_self(mob/user)
		var/obj/structure/closet/body_bag/cryobag/R = new /obj/structure/closet/body_bag/cryobag(user.loc)
		R.add_fingerprint(user)
		qdel(src)



/obj/structure/closet/body_bag/cryobag
	name = "stasis bag"
	desc = "A non-reusable plastic bag designed to prevent additional damage to an occupant at the cost of genetic damage."
	icon = 'icons/obj/cryobag.dmi'
	item_path = /obj/item/bodybag/cryobag
	var/used = 0

	open()
		. = ..()
		if(used)
			var/obj/item/O = new/obj/item(src.loc)
			O.name = "used stasis bag"
			O.icon = src.icon
			O.icon_state = "bodybag_used"
			O.desc = "Pretty useless now.."
			qdel(src)

	MouseDrop(over_object, src_location, over_location)
		if((over_object == usr && (in_range(src, usr) || usr.contents.Find(src))))
			if(!ishuman(usr))	return
			usr << "\red You can't fold that up anymore.."
		..()



/obj/item/sleepingbag
	name = "sleeping bag"
	icon = 'icons/obj/personal.dmi'
	desc = "A folded, reusable bag."
	icon_state = "sleeping_bag"
	item_state = "sleeping_bag"
	slot_flags = SLOT_BACK

	attack_self(mob/user)
		var/obj/structure/stool/bed/sleepingbag/R = new /obj/structure/stool/bed/sleepingbag(user.loc)
		R.add_fingerprint(user)
		qdel(src)


/obj/structure/stool/bed/sleepingbag
	name = "sleeping bag"
	icon = 'icons/obj/personal.dmi'
	desc = "For prime comfort during tough moments."
	icon_state = "sleeping_bag0"
	var/item_path = /obj/item/sleepingbag

	MouseDrop(over_object, src_location, over_location)
		..()
		if((over_object == usr && (in_range(src, usr) || usr.contents.Find(src))))
			if(!ishuman(usr))	return
			if(contents.len)	return 0
			visible_message("<span class='passivebold'>[usr]</span><span class='passive'> folds up the [src.name]</span>")
			new item_path(get_turf(src))
			spawn(0)
				qdel(src)
			return

/obj/structure/stool/bed/sleepingbag/buckle_mob(mob/living/carbon/human/M as mob, mob/user as mob)
	if(M.shoes)
		to_chat(user, "<span class='combatbold'>[pick(fnord)] can't use \the [src] with shoes on!</span>")
		return
	..()
	return