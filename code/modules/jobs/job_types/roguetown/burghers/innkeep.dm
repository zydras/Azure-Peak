/datum/job/roguetown/innkeeper
	title = "Innkeeper"
	flag = INNKEEPER
	department_flag = BURGHERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = ACCEPTED_RACES

	tutorial = "Adventurers and warriors alike have two exit plans; the early grave or even earlier retirement. \
				As the proud owner of this fine establishment, you took the latter: The Azurian Pint, tavern, inn, and bathhouse! \
				You even have an assortment of staff to help you, and plenty of business from the famished townsfolk looking to eat, weary travelers looking to rest, and characters of dubious repute seeking their own sort of success. \
				Your abilities in combat have gotten a little rusty, and the church across the street gives you the odd evil eye for the extra 'delights' of the bathhouse--but, well... \
				You can't win 'em all!"

	outfit = /datum/outfit/job/roguetown/innkeeper
	display_order = JDO_INNKEEPER
	give_bank_account = TRUE
	min_pq = -4
	max_pq = null
	round_contrib_points = 3
	cmode_music = 'sound/music/cmode/towner/combat_retired.ogg'

	job_traits = list(TRAIT_TAVERN_FIGHTER, TRAIT_EMPATH, TRAIT_CICERONE, TRAIT_HOMESTEAD_EXPERT)

	advclass_cat_rolls = list(CTAG_INNKEEPER = 2)
	job_subclasses = list(
		/datum/advclass/innkeeper
	)
	spells = list(/obj/effect/proc_holder/spell/invoked/takeapprentice)

/datum/advclass/innkeeper
	name = "Innkeeper"
	tutorial = "Adventurers and warriors alike have two exit plans; the early grave or even earlier retirement. As the proud owner of this fine establishment, you took the latter: The Azurian Pint, tavern, inn, and bathhouse! You even have an assortment of staff to help you, and plenty of business from the famished townsfolk looking to eat, weary travelers looking to rest, and characters of dubious repute seeking their own sort of success. Your abilities in combat have gotten a little rusty, and the church across the street gives you the odd evil eye for the extra 'delights' of the bathhouse--but, well... You can't win 'em all!"
	outfit = /datum/outfit/job/roguetown/innkeeper/basic
	category_tags = list(CTAG_INNKEEPER)
	subclass_stats = list( //total 2 base weight + 4 extra weight with stats given by subclass/loadout. Remember: Innkeepers get 1CON, 1WIL, 1SPD, and 3STR while within the Inn.
		STATKEY_WIL = 1,
		STATKEY_CON = 1
	)
	age_mod = /datum/class_age_mod/innkeeper
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/farming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/carpentry = SKILL_LEVEL_APPRENTICE, //apprentice to do some basic repairs around the inn if need be
		/datum/skill/misc/music = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/innkeeper/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/innkeep
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/innjacket
	backpack_contents = list(
		/obj/item/bottle_kit,
		/obj/item/storage/keyring/innkeep_rooms,
		/obj/item/reagent_containers/glass/bucket/pot/kettle/tankard/silver,
		/obj/item/mini_flagpole/innkeeper
	)
	
	if(H.mind)
		var/origin_options = list("A Daring Rogue", "An Errant Knight", "A Pugilistic Brute", "A Fierce Ranger")
		var/origin_choice = input(H, "What was your trade?", "REMEMBER YOUR ORIGINS.") as anything in origin_options
		switch(origin_choice) 
			if("A Daring Rogue")
				ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
				ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)//a little thievery went a long way
				H.adjust_skillrank_up_to(/datum/skill/combat/knives, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/misc/stealing, SKILL_LEVEL_APPRENTICE, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/misc/lockpicking, SKILL_LEVEL_APPRENTICE, TRUE)
				gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
				shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
				H.change_stat(STATKEY_STR, -1)//weakling .
				H.change_stat(STATKEY_SPD, 2)
				H.change_stat(STATKEY_PER, 2)
			if("An Errant Knight")
				ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
				wrists = /obj/item/clothing/wrists/roguetown/bracers//a variety of armor pieces that don't truly protect the important bits
				belt = /obj/item/storage/belt/rogue/leather/steel/tasset
				shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
				shoes = /obj/item/clothing/shoes/roguetown/boots/armor
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.change_stat(STATKEY_CON, 2)
				H.change_stat(STATKEY_WIL, 2)
			if("A Pugilistic Brute")
				armor = /obj/item/clothing/suit/roguetown/armor/manual/pushups/leather//a little bit of low quality armor
				gloves = /obj/item/clothing/gloves/roguetown/bandages 
				shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
				H.adjust_skillrank_up_to(/datum/skill/combat/wrestling, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/unarmed, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.change_stat(STATKEY_INT, -2)//idiot .
				H.change_stat(STATKEY_STR, 1)
				H.change_stat(STATKEY_CON, 1)
				H.change_stat(STATKEY_WIL, 1)
			if("A Fierce Ranger")
				shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve//starts with a bow, but no arrows
				H.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_JOURNEYMAN, TRUE)
				H.change_stat(STATKEY_SPD, 1) 
				H.change_stat(STATKEY_PER, 2)
	
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_UPPER_CLASS, H, "Savings.")
