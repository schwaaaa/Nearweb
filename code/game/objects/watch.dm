/obj/item/watch
	name = "watch"
	desc = "A watch. It tells time"
	icon = 'icons/obj/personal.dmi'
	icon_state = "wristwatch"
	wrist_use = TRUE
	item_state = "watch"

/obj/item/watch/examine(mob/user)
	..()
	to_chat(user, "It's time to go.")