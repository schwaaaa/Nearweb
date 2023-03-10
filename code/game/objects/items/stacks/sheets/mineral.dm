/*
Mineral Sheets
	Contains:
		- Sandstone
		- Diamond
		- Uranium
		- Plasma
		- Gold
		- Silver
		- Clown
	Others:
		- Adamantine
		- Mythril
		- Enriched Uranium
*/

/*
 * Sandstone
 */
/obj/item/stack/sheet/mineral/sandstone
	name = "sandstone brick"
	desc = "This appears to be a combination of both sand and stone."
	singular_name = "sandstone brick"
	icon_state = "sheet-sandstone"
	throw_speed = 4
	throw_range = 5
	origin_tech = "materials=1"
	sheettype = "sandstone"

var/global/list/datum/stack_recipe/sandstone_recipes = list ()
var/global/list/datum/stack_recipe/diamond_recipes = list ()
var/global/list/datum/stack_recipe/uranium_recipes = list ()
var/global/list/datum/stack_recipe/plasma_recipes = list ()
var/global/list/datum/stack_recipe/gold_recipes = list ()
var/global/list/datum/stack_recipe/silver_recipes = list ()


/obj/item/stack/sheet/mineral/sandstone/New(var/loc, var/amount=null)
	recipes = sandstone_recipes
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()

/*
 * Diamond
 */
/obj/item/stack/sheet/mineral/diamond
	name = "diamond"
	icon_state = "sheet-diamond"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_range = 3
	origin_tech = "materials=6"
	perunit = 3750
	sheettype = "diamond"

/obj/item/stack/sheet/mineral/diamond/New(var/loc, var/amount=null)
	recipes = diamond_recipes
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()

/*
 * Uranium
 */
/obj/item/stack/sheet/mineral/uranium
	name = "uranium"
	icon_state = "sheet-uranium"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=5"
	perunit = 2000
	sheettype = "uranium"

/obj/item/stack/sheet/mineral/uranium/New(var/loc, var/amount=null)
	recipes = uranium_recipes
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()

/*
 * Plasma
 */
/obj/item/stack/sheet/mineral/plasma
	name = "solid plasma"
	icon_state = "sheet-plasma"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "plasmatech=2;materials=2"
	perunit = 2000
	sheettype = "plasma"

/obj/item/stack/sheet/mineral/plasma/New(var/loc, var/amount=null)
	recipes = plasma_recipes
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()


/obj/item/stack/sheet/mineral/snow
	name = "solid plasma"
	icon_state = "sheet-snow"
	force = 1
	throwforce = 1
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=2"
	perunit = 2000
	sheettype = "snow"

/obj/item/stack/sheet/mineral/snow/New(var/loc, var/amount=null)
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()


/obj/item/stack/sheet/mineral/plastic
	name = "Plastic"
	icon_state = "sheet-plastic"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=3"
	perunit = 2000

var/global/list/datum/stack_recipe/plastic_recipes = list ( \
	new/datum/stack_recipe("plastic crate", /obj/structure/closet/crate/plastic, 10, one_per_turf = 1, on_floor = 1), \
	new/datum/stack_recipe("plastic fork", /obj/item/kitchen/utensil/pfork, 1, on_floor = 1), \
	new/datum/stack_recipe("plastic spoon", /obj/item/kitchen/utensil/pspoon, 1, on_floor = 1), \
	new/datum/stack_recipe("plastic knife", /obj/item/kitchen/utensil/pknife, 1, on_floor = 1), \
	new/datum/stack_recipe("plastic bag", /obj/item/storage/bag/plasticbag, 3, on_floor = 1), \
	)

/obj/item/stack/sheet/mineral/plastic/New(var/loc, var/amount=null)
	recipes = plastic_recipes
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()

/*
 * Gold
 */
/obj/item/stack/sheet/mineral/gold
	name = "gold"
	icon_state = "sheet-gold"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=4"
	perunit = 2000
	sheettype = "gold"

/obj/item/stack/sheet/mineral/gold/New(var/loc, var/amount=null)
	recipes = gold_recipes
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()

/*
 * Silver
 */
/obj/item/stack/sheet/mineral/silver
	name = "silver"
	icon_state = "sheet-silver"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=3"
	perunit = 2000
	sheettype = "silver"

/obj/item/stack/sheet/mineral/silver/New(var/loc, var/amount=null)
	recipes = silver_recipes
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()

/*
 * Clown
 */
/obj/item/stack/sheet/mineral/clown
	name = "bananium"
	icon_state = "sheet-clown"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=4"
	perunit = 2000
	sheettype = "clown"

/obj/item/stack/sheet/mineral/clown/New(var/loc, var/amount=null)
	pixel_x = rand(0,4)-4
	pixel_y = rand(0,4)-4
	..()


/****************************** Others ****************************/

/*
 * Enriched Uranium
 */
/obj/item/stack/sheet/mineral/enruranium
	name = "enriched uranium"
	icon_state = "sheet-enruranium"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=5"
	perunit = 1000

/*
 * Adamantine
 */
/obj/item/stack/sheet/mineral/adamantine
	name = "adamantine"
	icon_state = "sheet-adamantine"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=4"
	perunit = 2000

/*
 * Mythril
 */
/obj/item/stack/sheet/mineral/mythril
	name = "mythril"
	icon_state = "sheet-mythril"
	force = 5.0
	throwforce = 5
	w_class = 3.0
	throw_speed = 3
	throw_range = 3
	origin_tech = "materials=4"
	perunit = 2000
