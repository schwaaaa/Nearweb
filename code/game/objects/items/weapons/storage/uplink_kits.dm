/obj/item/storage/box/syndicate/
	New()
		..()
		switch (pickweight(list("bloodyspai" = 1, "stealth" = 1, "screwed" = 1, "guns" = 1, "murder" = 1, "freedom" = 1, "hacker" = 1, /*"lordsingulo" = 1,*/ "smoothoperator" = 1)))
			if("bloodyspai")
				new /obj/item/clothing/under/chameleon(src)
				new /obj/item/clothing/mask/gas/voice(src)
				new /obj/item/card/id/syndicate(src)
				return

			if("guns")
				new /obj/item/gun/projectile(src)
				new /obj/item/ammo_magazine/box/a357(src)
				new /obj/item/card/emag(src)
				new /obj/item/plastique(src)
				return

			if("murder")
				new /obj/item/melee/energy/sword(src)
				new /obj/item/clothing/glasses/thermal/syndi(src)
				new /obj/item/card/emag(src)
				return

			if("freedom")
				var/obj/item/implanter/O = new /obj/item/implanter(src)
				O.imp = new /obj/item/implant/freedom(O)
				var/obj/item/implanter/U = new /obj/item/implanter(src)
				U.imp = new /obj/item/implant/uplink(U)
				return
/*
			if("lordsingulo")
				new /obj/item/device/radio/beacon/syndicate(src)
				new /obj/item/clothing/suit/space/syndicate(src)
				new /obj/item/clothing/head/helmet/space/syndicate(src)
				new /obj/item/card/emag(src)
				return
*/
			if("smoothoperator")
				new /obj/item/gun/projectile/automatic/pistol(src)
				new /obj/item/silencer(src)
				new /obj/item/soap/syndie(src)
				new /obj/item/storage/bag/trash(src)
				new /obj/item/bodybag(src)
				new /obj/item/clothing/under/suit_jacket(src)
				new /obj/item/clothing/shoes/lw/boots(src)
				return

/obj/item/storage/box/syndie_kit
	name = "box"
	desc = "A sleek, sturdy box"
	icon_state = "box_of_doom"

/obj/item/storage/box/syndie_kit/imp_freedom
	name = "boxed freedom implant (with injector)"

/obj/item/storage/box/syndie_kit/imp_freedom/New()
	..()
	var/obj/item/implanter/O = new(src)
	O.imp = new /obj/item/implant/freedom(O)
	O.update()
	return

/obj/item/storage/box/syndie_kit/imp_compress
	name = "box (C)"

/obj/item/storage/box/syndie_kit/imp_compress/New()
	new /obj/item/implanter/compressed(src)
	..()
	return

/obj/item/storage/box/syndie_kit/imp_explosive
	name = "box (E)"

/obj/item/storage/box/syndie_kit/imp_explosive/New()
	new /obj/item/implanter/explosive(src)
	..()
	return

/obj/item/storage/box/syndie_kit/imp_uplink
	name = "boxed uplink implant (with injector)"

/obj/item/storage/box/syndie_kit/imp_uplink/New()
	..()
	var/obj/item/implanter/O = new(src)
	O.imp = new /obj/item/implant/uplink(O)
	O.update()
	return

/obj/item/storage/box/syndie_kit/chemical
	name = "boxed chemical kit"

/obj/item/storage/box/syndie_kit/chemical/New()
	..()
	new /obj/item/reagent_containers/glass/bottle/polonium(src)
	new /obj/item/reagent_containers/glass/bottle/venom(src)
	new /obj/item/reagent_containers/glass/bottle/neurotoxin2(src)
	new /obj/item/reagent_containers/glass/bottle/formaldehyde(src)
	new /obj/item/reagent_containers/glass/bottle/cyanide(src)
	new /obj/item/reagent_containers/glass/bottle/histamine(src)
	return