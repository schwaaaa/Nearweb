/obj/structure/closet/secure_closet/engineering_chief
	name = "Chief Engineer's Locker"
	req_access = list(access_ce)
	icon_state = "securece1"
	icon_closed = "securece"
	icon_locked = "securece1"
	icon_opened = "secureceopen"
	icon_broken = "securecebroken"
	icon_off = "secureceoff"


	New()
		..()
		sleep(2)
		if(prob(50))
			new /obj/item/storage/backpack/industrial(src)
		else
			new /obj/item/storage/backpack/satchel_eng(src)
		if (prob(70))
			new /obj/item/clothing/tie/storage/brown_vest(src)
		else
			new /obj/item/clothing/tie/storage/webbing(src)
		new /obj/item/blueprints(src)
		new /obj/item/clothing/under/rank/chief_engineer(src)
		new /obj/item/clothing/head/hardhat/white(src)
		new /obj/item/clothing/head/welding(src)
		new /obj/item/clothing/gloves/yellow(src)
		new /obj/item/clothing/shoes/lw/brown(src)
		new /obj/item/cartridge/ce(src)
		new /obj/item/device/radio/headset/heads/ce(src)
		new /obj/item/storage/toolbox/mechanical(src)
		new /obj/item/clothing/suit/storage/hazardvest(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/device/multitool(src)
		new /obj/item/device/flash(src)
		return



/obj/structure/closet/secure_closet/engineering_electrical
	name = "Electrical Supplies"
	req_access = list(access_engine_equip)
	icon_state = "secureengelec1"
	icon_closed = "secureengelec"
	icon_locked = "secureengelec1"
	icon_opened = "toolclosetopen"
	icon_broken = "secureengelecbroken"
	icon_off = "secureengelecoff"


	New()
		..()
		sleep(2)
		new /obj/item/clothing/gloves/yellow(src)
		new /obj/item/clothing/gloves/yellow(src)
		new /obj/item/storage/toolbox/electrical(src)
		new /obj/item/storage/toolbox/electrical(src)
		new /obj/item/storage/toolbox/electrical(src)
		new /obj/item/module/power_control(src)
		new /obj/item/module/power_control(src)
		new /obj/item/module/power_control(src)
		new /obj/item/device/multitool(src)
		new /obj/item/device/multitool(src)
		new /obj/item/device/multitool(src)
		return



/obj/structure/closet/secure_closet/engineering_welding
	name = "Welding Supplies"
	req_access = list(access_construction)
	icon_state = "secureengweld1"
	icon_closed = "secureengweld"
	icon_locked = "secureengweld1"
	icon_opened = "toolclosetopen"
	icon_broken = "secureengweldbroken"
	icon_off = "secureengweldoff"


	New()
		..()
		sleep(2)
		new /obj/item/clothing/head/welding(src)
		new /obj/item/clothing/head/welding(src)
		new /obj/item/clothing/head/welding(src)
		new /obj/item/weldingtool/largetank(src)
		new /obj/item/weldingtool/largetank(src)
		new /obj/item/weldingtool/largetank(src)
		return



/obj/structure/closet/secure_closet/engineering_personal
	name = "Engineer's Locker"
	req_access = list(access_engine_equip)
	icon_state = "secureeng1"
	icon_closed = "secureeng"
	icon_locked = "secureeng1"
	icon_opened = "secureengopen"
	icon_broken = "secureengbroken"
	icon_off = "secureengoff"


	New()
		..()
		sleep(2)
		if(prob(50))
			new /obj/item/storage/backpack/industrial(src)
		else
			new /obj/item/storage/backpack/satchel_eng(src)
		if (prob(70))
			new /obj/item/clothing/tie/storage/brown_vest(src)
		else
			new /obj/item/clothing/tie/storage/webbing(src)
		new /obj/item/storage/toolbox/mechanical(src)
		new /obj/item/device/radio/headset/headset_eng(src)
		new /obj/item/clothing/suit/storage/hazardvest(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/clothing/glasses/meson(src)
		new /obj/item/cartridge/engineering(src)
		new /obj/item/clothing/shoes/lw/brown(src)
		return
/obj/structure/closet/secure_closet/atmos_personal
	name = "Technician's Locker"
	req_access = list(access_atmospherics)
	icon_state = "secureeng1"
	icon_closed = "secureeng"
	icon_locked = "secureeng1"
	icon_opened = "secureengopen"
	icon_broken = "secureengbroken"
	icon_off = "secureengoff"


	New()
		..()
		sleep(2)
		if(prob(50))
			new /obj/item/storage/backpack/industrial(src)
		else
			new /obj/item/storage/backpack/satchel_eng(src)
		if (prob(70))
			new /obj/item/clothing/tie/storage/brown_vest(src)
		else
			new /obj/item/clothing/tie/storage/webbing(src)
		new /obj/item/clothing/suit/fire/firefighter(src)
		new /obj/item/device/flashlight(src)
		new /obj/item/extinguisher(src)
		new /obj/item/device/radio/headset/headset_eng(src)
		new /obj/item/clothing/suit/storage/hazardvest(src)
		new /obj/item/clothing/mask/gas(src)
		new /obj/item/cartridge/atmos(src)
		return
