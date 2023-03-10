/*
 *	Everything derived from the common cardboard box.
 *	Basically everything except the original is a kit (starts full).
 *
 *	Contains:
 *		Empty box, starter boxes (survival/engineer),
 *		Latex glove and sterile mask boxes,
 *		Syringe, beaker, dna injector boxes,
 *		Blanks, flashbangs, and EMP grenade boxes,
 *		Tracking and chemical implant boxes,
 *		Prescription glasses and drinking glass boxes,
 *		Condiment bottle and silly cup boxes,
 *		Donkpocket and monkeycube boxes,
 *		ID and security PDA cart boxes,
 *		Handcuff, mousetrap, and pillbottle boxes,
 *		Snap-pops and matchboxes,
 *		Replacement light boxes.
 *
 *		For syndicate call-ins see uplink_kits.dm
 */

/obj/item/storage/box
	name = "box"
	desc = "It's just an ordinary box."
	icon_state = "box"
	item_state = "syringe_kit"
	foldable = /obj/item/stack/sheet/cardboard	//BubbleWrap

/obj/item/storage/box/survival/
	New()
		..()
		contents = list()
		sleep(1)
		new /obj/item/clothing/mask/breath( src )
		new /obj/item/tank/emergency_oxygen( src )
		new /obj/item/reagent_containers/hypospray/medipen( src )
		return

/obj/item/storage/box/engineer/
	New()
		..()
		contents = list()
		sleep(1)
		new /obj/item/clothing/mask/breath( src )
		new /obj/item/tank/emergency_oxygen/engi( src )
		new /obj/item/reagent_containers/hypospray/medipen( src )
		return


/obj/item/storage/box/gloves
	name = "box of latex gloves"
	desc = "Contains white gloves."
	New()
		..()
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clothing/gloves/latex(src)
		new /obj/item/clothing/gloves/latex(src)

/obj/item/storage/box/masks
	name = "box of sterile masks"
	desc = "This box contains masks of sterility."
	icon_state = "sterile"

	New()
		..()
		new /obj/item/clothing/mask/surgical(src)
		new /obj/item/clothing/mask/surgical(src)
		new /obj/item/clothing/mask/surgical(src)
		new /obj/item/clothing/mask/surgical(src)
		new /obj/item/clothing/mask/surgical(src)
		new /obj/item/clothing/mask/surgical(src)
		new /obj/item/clothing/mask/surgical(src)


/obj/item/storage/box/syringes
	name = "box of syringes"
	desc = "A box full of syringes."
	desc = "A biohazard alert warning is printed on the box"
	icon_state = "syringe"

	New()
		..()
		new /obj/item/reagent_containers/syringe( src )
		new /obj/item/reagent_containers/syringe( src )
		new /obj/item/reagent_containers/syringe( src )
		new /obj/item/reagent_containers/syringe( src )
		new /obj/item/reagent_containers/syringe( src )
		new /obj/item/reagent_containers/syringe( src )
		new /obj/item/reagent_containers/syringe( src )

/obj/item/storage/box/medipens
	name = "box of medipens"
	desc = "A box full of epinephrine MediPens."
	icon_state = "syringe"

/obj/item/storage/box/medipens/New()
	..()
	new /obj/item/reagent_containers/hypospray/medipen( src )
	new /obj/item/reagent_containers/hypospray/medipen( src )
	new /obj/item/reagent_containers/hypospray/medipen( src )
	new /obj/item/reagent_containers/hypospray/medipen( src )
	new /obj/item/reagent_containers/hypospray/medipen( src )
	new /obj/item/reagent_containers/hypospray/medipen( src )
	new /obj/item/reagent_containers/hypospray/medipen( src )

/obj/item/storage/box/medipens/utility
	name = "medipens kit"
	desc = "A box with several utility medipens for the economical miner."
	icon_state = "syringe"

/obj/item/storage/box/medipens/utility/New()
	..()
	new /obj/item/reagent_containers/hypospray/medipen/leporazine( src )
	new /obj/item/reagent_containers/hypospray/medipen/leporazine( src )
	new /obj/item/reagent_containers/hypospray/medipen/stimpack( src )
	new /obj/item/reagent_containers/hypospray/medipen/stimpack( src )
	new /obj/item/reagent_containers/hypospray/medipen/stimpack( src )

/obj/item/storage/box/beakers
	name = "box of beakers"
	icon_state = "beaker"

	New()
		..()
		new /obj/item/reagent_containers/glass/beaker( src )
		new /obj/item/reagent_containers/glass/beaker( src )
		new /obj/item/reagent_containers/glass/beaker( src )
		new /obj/item/reagent_containers/glass/beaker( src )
		new /obj/item/reagent_containers/glass/beaker( src )
		new /obj/item/reagent_containers/glass/beaker( src )
		new /obj/item/reagent_containers/glass/beaker( src )

/obj/item/storage/box/injectors
	name = "box of DNA injectors"
	desc = "This box contains injectors it seems."

	New()
		..()
		new /obj/item/dnainjector/h2m(src)
		new /obj/item/dnainjector/h2m(src)
		new /obj/item/dnainjector/h2m(src)
		new /obj/item/dnainjector/m2h(src)
		new /obj/item/dnainjector/m2h(src)
		new /obj/item/dnainjector/m2h(src)


/obj/item/storage/box/blanks
	name = "box of blank shells"
	desc = "It has a picture of a gun and several warning symbols on the front."

	New()
		..()
		new /obj/item/ammo_casing/shotgun/blank(src)
		new /obj/item/ammo_casing/shotgun/blank(src)
		new /obj/item/ammo_casing/shotgun/blank(src)
		new /obj/item/ammo_casing/shotgun/blank(src)
		new /obj/item/ammo_casing/shotgun/blank(src)
		new /obj/item/ammo_casing/shotgun/blank(src)
		new /obj/item/ammo_casing/shotgun/blank(src)



/obj/item/storage/box/flashbangs
	name = "box of flashbangs (WARNING)"
	desc = "<B>WARNING: These devices are extremely dangerous and can cause blindness or deafness in repeated use.</B>"
	icon_state = "flashbang"

	New()
		..()
		new /obj/item/grenade/flashbang(src)
		new /obj/item/grenade/flashbang(src)
		new /obj/item/grenade/flashbang(src)
		new /obj/item/grenade/flashbang(src)
		new /obj/item/grenade/flashbang(src)
		new /obj/item/grenade/flashbang(src)
		new /obj/item/grenade/flashbang(src)

/obj/item/storage/box/emps
	name = "box of emp grenades"
	desc = "A box with 5 emp grenades."
	icon_state = "flashbang"

	New()
		..()
		new /obj/item/grenade/empgrenade(src)
		new /obj/item/grenade/empgrenade(src)
		new /obj/item/grenade/empgrenade(src)
		new /obj/item/grenade/empgrenade(src)
		new /obj/item/grenade/empgrenade(src)


/obj/item/storage/box/trackimp
	name = "boxed tracking implant kit"
	desc = "Box full of scum-bag tracking utensils."
	icon_state = "implant"

	New()
		..()
		new /obj/item/implantcase/tracking(src)
		new /obj/item/implantcase/tracking(src)
		new /obj/item/implantcase/tracking(src)
		new /obj/item/implantcase/tracking(src)
		new /obj/item/implanter(src)
		new /obj/item/implantpad(src)
		new /obj/item/locator(src)

/obj/item/storage/box/chemimp
	name = "boxed chemical implant kit"
	desc = "Box of stuff used to implant chemicals."
	icon_state = "implant"

	New()
		..()
		new /obj/item/implantcase/chem(src)
		new /obj/item/implantcase/chem(src)
		new /obj/item/implantcase/chem(src)
		new /obj/item/implantcase/chem(src)
		new /obj/item/implantcase/chem(src)
		new /obj/item/implanter(src)
		new /obj/item/implantpad(src)



/obj/item/storage/box/rxglasses
	name = "box of prescription glasses"
	desc = "This box contains nerd glasses."
	icon_state = "glasses"

	New()
		..()
		new /obj/item/clothing/glasses/regular(src)
		new /obj/item/clothing/glasses/regular(src)
		new /obj/item/clothing/glasses/regular(src)
		new /obj/item/clothing/glasses/regular(src)
		new /obj/item/clothing/glasses/regular(src)
		new /obj/item/clothing/glasses/regular(src)
		new /obj/item/clothing/glasses/regular(src)

/obj/item/storage/box/drinkingglasses
	name = "box of drinking glasses"
	desc = "It has a picture of drinking glasses on it."

	New()
		..()
		new /obj/item/reagent_containers/glass/drinkingglass(src)
		new /obj/item/reagent_containers/glass/drinkingglass(src)
		new /obj/item/reagent_containers/glass/drinkingglass(src)
		new /obj/item/reagent_containers/glass/drinkingglass(src)
		new /obj/item/reagent_containers/glass/drinkingglass(src)
		new /obj/item/reagent_containers/glass/drinkingglass(src)

/obj/item/storage/box/cdeathalarm_kit
	name = "Death Alarm Kit"
	desc = "Box of stuff used to implant death alarms."
	icon_state = "implant"
	item_state = "syringe_kit"

	New()
		..()
		new /obj/item/implanter(src)
		new /obj/item/implantcase/death_alarm(src)
		new /obj/item/implantcase/death_alarm(src)
		new /obj/item/implantcase/death_alarm(src)
		new /obj/item/implantcase/death_alarm(src)
		new /obj/item/implantcase/death_alarm(src)
		new /obj/item/implantcase/death_alarm(src)

/obj/item/storage/box/condimentbottles
	name = "box of condiment bottles"
	desc = "It has a large ketchup smear on it."

	New()
		..()
		new /obj/item/reagent_containers/food/condiment(src)
		new /obj/item/reagent_containers/food/condiment(src)
		new /obj/item/reagent_containers/food/condiment(src)
		new /obj/item/reagent_containers/food/condiment(src)
		new /obj/item/reagent_containers/food/condiment(src)
		new /obj/item/reagent_containers/food/condiment(src)



/obj/item/storage/box/cups
	name = "box of paper cups"
	desc = "It has pictures of paper cups on the front."
	New()
		..()
		new /obj/item/reagent_containers/food/drinks/sillycup( src )
		new /obj/item/reagent_containers/food/drinks/sillycup( src )
		new /obj/item/reagent_containers/food/drinks/sillycup( src )
		new /obj/item/reagent_containers/food/drinks/sillycup( src )
		new /obj/item/reagent_containers/food/drinks/sillycup( src )
		new /obj/item/reagent_containers/food/drinks/sillycup( src )
		new /obj/item/reagent_containers/food/drinks/sillycup( src )


/obj/item/storage/box/donkpockets
	name = "box of donk-pockets"
	desc = "<B>Instructions:</B> <I>Heat in microwave. Product will cool if not eaten within seven minutes.</I>"
	icon_state = "donk_kit"

	New()
		..()
		new /obj/item/reagent_containers/food/snacks/donkpocket(src)
		new /obj/item/reagent_containers/food/snacks/donkpocket(src)
		new /obj/item/reagent_containers/food/snacks/donkpocket(src)
		new /obj/item/reagent_containers/food/snacks/donkpocket(src)
		new /obj/item/reagent_containers/food/snacks/donkpocket(src)
		new /obj/item/reagent_containers/food/snacks/donkpocket(src)

/obj/item/storage/box/monkeycubes
	name = "monkey cube box"
	desc = "Drymate brand monkey cubes. Just add water!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	storage_slots = 7
	can_hold = list("/obj/item/reagent_containers/food/snacks/monkeycube")
	New()
		..()
		if(src.type == /obj/item/storage/box/monkeycubes)
			for(var/i = 1; i <= 5; i++)
				new /obj/item/reagent_containers/food/snacks/monkeycube/wrapped(src)

/obj/item/storage/box/monkeycubes/farwacubes
	name = "farwa cube box"
	desc = "Drymate brand farwa cubes, shipped from Ahdomai. Just add water!"
	New()
		..()
		for(var/i = 1; i <= 5; i++)
			new /obj/item/reagent_containers/food/snacks/monkeycube/wrapped/farwacube(src)

/obj/item/storage/box/monkeycubes/stokcubes
	name = "stok cube box"
	desc = "Drymate brand stok cubes, shipped from Moghes. Just add water!"
	New()
		..()
		for(var/i = 1; i <= 5; i++)
			new /obj/item/reagent_containers/food/snacks/monkeycube/wrapped/stokcube(src)

/obj/item/storage/box/monkeycubes/neaeracubes
	name = "neaera cube box"
	desc = "Drymate brand neaera cubes, shipped from Jargon 4. Just add water!"
	New()
		..()
		for(var/i = 1; i <= 5; i++)
			new /obj/item/reagent_containers/food/snacks/monkeycube/wrapped/neaeracube(src)

/obj/item/storage/box/ids
	name = "box of spare IDs"
	desc = "Has so many empty IDs."
	icon_state = "id"

	New()
		..()
		new /obj/item/card/id(src)
		new /obj/item/card/id(src)
		new /obj/item/card/id(src)
		new /obj/item/card/id(src)
		new /obj/item/card/id(src)
		new /obj/item/card/id(src)
		new /obj/item/card/id(src)


/obj/item/storage/box/seccarts
	name = "box of spare R.O.B.U.S.T. Cartridges"
	desc = "A box full of R.O.B.U.S.T. Cartridges, used by Security."
	icon_state = "pda"

	New()
		..()
		new /obj/item/cartridge/security(src)
		new /obj/item/cartridge/security(src)
		new /obj/item/cartridge/security(src)
		new /obj/item/cartridge/security(src)
		new /obj/item/cartridge/security(src)
		new /obj/item/cartridge/security(src)
		new /obj/item/cartridge/security(src)


/obj/item/storage/box/handcuffs
	name = "box of spare handcuffs"
	desc = "A box full of handcuffs."
	icon_state = "handcuff"

	New()
		..()
		new /obj/item/handcuffs(src)
		new /obj/item/handcuffs(src)
		new /obj/item/handcuffs(src)
		new /obj/item/handcuffs(src)
		new /obj/item/handcuffs(src)
		new /obj/item/handcuffs(src)
		new /obj/item/handcuffs(src)


/obj/item/storage/box/mousetraps
	name = "box of Pest-B-Gon mousetraps"
	desc = "<B><FONT=red>WARNING:</FONT></B> <I>Keep out of reach of children</I>."
	icon_state = "mousetraps"

	New()
		..()
		new /obj/item/device/assembly/mousetrap( src )
		new /obj/item/device/assembly/mousetrap( src )
		new /obj/item/device/assembly/mousetrap( src )
		new /obj/item/device/assembly/mousetrap( src )
		new /obj/item/device/assembly/mousetrap( src )
		new /obj/item/device/assembly/mousetrap( src )

/obj/item/storage/box/pillbottles
	name = "box of pill bottles"
	desc = "It has pictures of pill bottles on its front."

	New()
		..()
		new /obj/item/storage/pill_bottle( src )
		new /obj/item/storage/pill_bottle( src )
		new /obj/item/storage/pill_bottle( src )
		new /obj/item/storage/pill_bottle( src )
		new /obj/item/storage/pill_bottle( src )
		new /obj/item/storage/pill_bottle( src )
		new /obj/item/storage/pill_bottle( src )


/obj/item/storage/box/snappops
	name = "snap pop box"
	desc = "Eight wrappers of fun! Ages 8 and up. Not suitable for children."
	icon = 'icons/obj/toy.dmi'
	icon_state = "spbox"
	storage_slots = 8
	can_hold = list("/obj/item/toy/snappop")
	New()
		..()
		for(var/i=1; i <= storage_slots; i++)
			new /obj/item/toy/snappop(src)

/obj/item/storage/box/lights
	name = "box of replacement bulbs"
	icon = 'icons/obj/storage.dmi'
	icon_state = "light"
	desc = "This box is shaped on the inside so that only light tubes and bulbs fit."
	item_state = "syringe_kit"
	foldable = /obj/item/stack/sheet/cardboard //BubbleWrap
	storage_slots=21
	can_hold = list("/obj/item/light/tube", "/obj/item/light/bulb")
	max_combined_w_class = 21
	use_to_pickup = 1 // for picking up broken bulbs, not that most people will try

/obj/item/storage/box/lights/bulbs/New()
	..()
	for(var/i = 0; i < 21; i++)
		new /obj/item/light/bulb(src)

/obj/item/storage/box/lights/tubes
	name = "box of replacement tubes"
	icon_state = "lighttube"

/obj/item/storage/box/lights/tubes/New()
	..()
	for(var/i = 0; i < 21; i++)
		new /obj/item/light/tube(src)

/obj/item/storage/box/lights/mixed
	name = "box of replacement lights"
	icon_state = "lightmixed"

/obj/item/storage/box/lights/mixed/New()
	..()
	for(var/i = 0; i < 14; i++)
		new /obj/item/light/tube(src)
	for(var/i = 0; i < 7; i++)
		new /obj/item/light/bulb(src)