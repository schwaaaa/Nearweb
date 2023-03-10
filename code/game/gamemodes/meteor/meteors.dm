/var/const/meteor_wave_delay = 625 //minimum wait between waves in tenths of seconds
//set to at least 100 unless you want evarr ruining every round

/var/const/meteors_in_wave = 50
/var/const/meteors_in_small_wave = 10


//Meteors probability of spawning during a given wave
/var/list/meteors_normal = list(/obj/effect/meteor/dust=3, /obj/effect/meteor/medium=8, /obj/effect/meteor/big=3, \
						  /obj/effect/meteor/flaming=1, /obj/effect/meteor/irradiated=3) //for normal meteor event

/var/list/meteors_threatening = list(/obj/effect/meteor/medium=4, /obj/effect/meteor/big=8, \
						  /obj/effect/meteor/flaming=3, /obj/effect/meteor/irradiated=3) //for threatening meteor event

/var/list/meteors_catastrophic = list(/obj/effect/meteor/medium=5, /obj/effect/meteor/big=75, \
						  /obj/effect/meteor/flaming=10, /obj/effect/meteor/irradiated=10, /obj/effect/meteor/tunguska = 1) //for catastrophic meteor event

/var/list/meteorsB = list(/obj/effect/meteor/meaty=5, /obj/effect/meteor/meaty/xeno=1) //for meaty ore event

/var/list/meteorsC = list(/obj/effect/meteor/dust) //for space dust event


///////////////////////////////
//Meteor spawning global procs
///////////////////////////////

/proc/spawn_meteors(var/number = 10, var/list/meteortypes = meteors_normal)
	for(var/i = 0; i < number; i++)
		spawn_meteor(meteortypes)

/proc/spawn_meteor(var/list/meteortypes)
	var/turf/pickedstart
	var/turf/pickedgoal
	var/max_i = 10//number of tries to spawn meteor.
	var/meteor_z = 1

	meteor_z = pick(vessel_z)

	while (!istype(pickedstart, /turf/space))
		var/startSide = pick(cardinal)
		pickedstart = spaceDebrisStartLoc(startSide, meteor_z)
		pickedgoal = spaceDebrisFinishLoc(startSide, meteor_z)
		max_i--
		if(max_i<=0)
			return
	var/Me = pickweight(meteortypes)
	var/obj/effect/meteor/M = new Me(pickedstart)
	M.dest = pickedgoal
	M.z_original = meteor_z
	spawn(0)
		walk_towards(M, M.dest, 1)
	return

/proc/spaceDebrisStartLoc(startSide, Z)
	var/starty
	var/startx
	switch(startSide)
		if(1) //NORTH
			starty = world.maxy-(TRANSITIONEDGE+1)
			startx = rand((TRANSITIONEDGE+1), world.maxx-(TRANSITIONEDGE+1))
		if(2) //EAST
			starty = rand((TRANSITIONEDGE+1),world.maxy-(TRANSITIONEDGE+1))
			startx = world.maxx-(TRANSITIONEDGE+1)
		if(3) //SOUTH
			starty = (TRANSITIONEDGE+1)
			startx = rand((TRANSITIONEDGE+1), world.maxx-(TRANSITIONEDGE+1))
		if(4) //WEST
			starty = rand((TRANSITIONEDGE+1), world.maxy-(TRANSITIONEDGE+1))
			startx = (TRANSITIONEDGE+1)
	var/turf/T = locate(startx, starty, Z)
	return T

/proc/spaceDebrisFinishLoc(startSide, Z)
	var/endy
	var/endx
	switch(startSide)
		if(1) //NORTH
			endy = TRANSITIONEDGE
			endx = rand(TRANSITIONEDGE, world.maxx-TRANSITIONEDGE)
		if(2) //EAST
			endy = rand(TRANSITIONEDGE, world.maxy-TRANSITIONEDGE)
			endx = TRANSITIONEDGE
		if(3) //SOUTH
			endy = world.maxy-TRANSITIONEDGE
			endx = rand(TRANSITIONEDGE, world.maxx-TRANSITIONEDGE)
		if(4) //WEST
			endy = rand(TRANSITIONEDGE,world.maxy-TRANSITIONEDGE)
			endx = world.maxx-TRANSITIONEDGE
	var/turf/T = locate(endx, endy, Z)
	return T

///////////////////////
//The meteor effect
//////////////////////

/obj/effect/meteor
	name = "the concept of meteor"
	desc = "You should probably run instead of gawking at this."
	icon = 'icons/obj/meteor.dmi'
	icon_state = "small"
	density = 1
	anchored = 1
	var/hits = 4
	var/hitpwr = 2 //Level of ex_act to be called on hit.
	var/dest
	pass_flags = PASSTABLE
	heavy = 0
	var/meteorsound = 'sound/effects/meteorimpact.ogg'
	var/z_original = 1

	var/meteordrop = /obj/item/ore/iron
	var/dropamt = 2

/obj/effect/meteor/Move()
	if(z != z_original || loc == dest)
		qdel(src)
		return

	. = ..() //process movement...

	if(.)//.. if did move, ram the turf we get in
		var/turf/T = get_turf(loc)
		if(!istype(T, /turf/simulated/floor/engine))
			ram_turf(T)

			if(prob(10) && (!istype(T, /turf/space) && !istype(T, /turf/simulated/floor/engine/vacuum/hull)))//randomly takes a 'hit' from ramming
				get_hit()

	return .

/obj/effect/meteor/Destroy()
	walk(src,0) //this cancels the walk_towards() proc
	..()

/obj/effect/meteor/New()
	..()
	SpinAnimation()

/obj/effect/meteor/Bump(atom/A)
	if(A)
		ram_turf(get_turf(A))
		playsound(src.loc, meteorsound, 40, 1)
		get_hit()

/obj/effect/meteor/proc/ram_turf(var/turf/T)
	//first bust whatever is in the turf
	for(var/atom/A in T)
		if(A != src)
			A.ex_act(hitpwr)

	//then, ram the turf if it still exists
	if(T)
		T.ex_act(hitpwr)


//process getting 'hit' by colliding with a dense object
//or randomly when ramming turfs
/obj/effect/meteor/proc/get_hit()
	hits--
	if(hits <= 0)
		make_debris()
		meteor_effect(heavy)
		qdel(src)

/obj/effect/meteor/ex_act()
	return

/obj/effect/meteor/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/pickaxe))
		make_debris()
		visible_message("\red <B>[user] smashes [src] apart with [W]! What a badass!</B>")
		qdel(src)
		return
	..()

/obj/effect/meteor/proc/make_debris()
	for(var/throws = dropamt, throws > 0, throws--)
		var/obj/item/O = new meteordrop(get_turf(src))
		O.throw_at(dest, 5, 10)

/obj/effect/meteor/proc/meteor_effect(var/sound=1)
	if(sound)
		for(var/mob/M in player_list)
			var/turf/T = get_turf(M)
			if(!T || T.z != src.z)
				continue
			var/dist = get_dist(M.loc, src.loc)
			shake_camera(M, dist > 20 ? 3 : 5, dist > 20 ? 1 : 3)
			M.playsound_local(src.loc, meteorsound, 50, 1, 1, 10)

///////////////////////
//Meteor types
///////////////////////

//Dust
/obj/effect/meteor/dust
	name = "space dust"
	icon_state = "dust"
	pass_flags = PASSTABLE | PASSGRILLE
	hits = 1
	hitpwr = 3
	meteorsound = 'sound/weapons/throwtap.ogg'
	meteordrop = /obj/item/ore/glass

//Medium-sized
/obj/effect/meteor/medium
	name = "meteor"
	dropamt = 3

/obj/effect/meteor/medium/meteor_effect()
	..(heavy)
	explosion(src.loc, 0, 1, 2, 3, 0)

//Large-sized
/obj/effect/meteor/big
	name = "big meteor"
	icon_state = "large"
	hits = 6
	heavy = 1
	dropamt = 4

/obj/effect/meteor/big/meteor_effect()
	..(heavy)
	explosion(src.loc, 1, 2, 3, 4, 0)

//Flaming meteor
/obj/effect/meteor/flaming
	name = "flaming meteor"
	icon_state = "flaming"
	hits = 5
	heavy = 1
	meteorsound = 'sound/effects/bamf.ogg'
	meteordrop = /obj/item/ore/plasma

/obj/effect/meteor/flaming/meteor_effect()
	..(heavy)
	explosion(src.loc, 1, 2, 3, 4, 0, 0, 5)

//Radiation meteor
/obj/effect/meteor/irradiated
	name = "glowing meteor"
	icon_state = "glowing"
	heavy = 1
	meteordrop = /obj/item/ore/uranium


/obj/effect/meteor/irradiated/meteor_effect()
	..(heavy)
	explosion(src.loc, 0, 0, 4, 3, 0)
	new /obj/effect/decal/cleanable/greenglow(get_turf(src))
	for(var/mob/living/L in view(5, src))
		L.apply_effect(40, IRRADIATE)

//Meaty Ore
/obj/effect/meteor/meaty
	name = "meaty ore"
	icon_state = "meateor"
	desc = "Just... don't think too hard about where this thing came from."
	hits = 2
	heavy = 1
	meteorsound = 'sound/effects/blobattack.ogg'
	meteordrop = /obj/item/reagent_containers/food/snacks/meat
	var/meteorgibs = /obj/effect/gibspawner/generic

/obj/effect/meteor/meaty/make_debris()
	..()
	new meteorgibs(get_turf(src))


/obj/effect/meteor/meaty/ram_turf(var/turf/T)
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/blood (T)

/obj/effect/meteor/meaty/Bump(atom/A)
	A.ex_act(hitpwr)
	get_hit()

//Meaty Ore Xeno edition
/obj/effect/meteor/meaty/xeno
	color = "#5EFF00"
	meteordrop = /obj/item/reagent_containers/food/snacks/xenomeat
	meteorgibs = /obj/effect/gibspawner/xeno

/obj/effect/meteor/meaty/xeno/ram_turf(var/turf/T)
	if(!istype(T, /turf/space))
		new /obj/effect/decal/cleanable/blood/xeno(T)

//Station buster Tunguska
/obj/effect/meteor/tunguska
	name = "tunguska meteor"
	icon_state = "flaming"
	desc = "Your life briefly passes before your eyes the moment you lay them on this monstruosity"
	hits = 30
	hitpwr = 1
	heavy = 1
	meteorsound = 'sound/effects/bamf.ogg'
	meteordrop = /obj/item/ore/plasma

/obj/effect/meteor/tunguska/meteor_effect()
	..(heavy)
	explosion(src.loc, 5, 10, 15, 20, 0)

/obj/effect/meteor/tunguska/Bump()
	..()
	if(prob(20))
		explosion(src.loc,2,4,6,8)
