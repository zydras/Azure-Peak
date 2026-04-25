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
				Your abilities in combat have gotten a little rusty, and the church across the street gives you the odd evil eye for the extra 'delights' of the bathhouse--but, well... \
				You can't win 'em all!"

	outfit = /datum/outfit/job/roguetown/innkeeper
	display_order = JDO_INNKEEPER
	give_bank_account = TRUE
	min_pq = -4
	max_pq = null
	round_contrib_points = 3
	advjob_examine = FALSE //so they remain innkeeper
	cmode_music = 'sound/music/cmode/towner/combat_retired.ogg'

	job_traits = list(TRAIT_TAVERN_FIGHTER, TRAIT_EMPATH, TRAIT_CICERONE, TRAIT_HOMESTEAD_EXPERT)

	advclass_cat_rolls = list(CTAG_INNKEEPER = 2)
	job_subclasses = list(
		/datum/advclass/innkeeper/exrogue,
		/datum/advclass/innkeeper/exsoldier,
		/datum/advclass/innkeeper/expugilist,
		/datum/advclass/innkeeper/exranger,
	)
	spells = list(/obj/effect/proc_holder/spell/invoked/takeapprentice)

/datum/advclass/innkeeper/exrogue
	name = "Once a Daring Rogue"
	tutorial = "Once a rogue of dubious origins, your past life of climbing walls and sneaking into places you shouldn't be is behind you. Mostly. You now work as the Innkeeper of the Azurian Pint, putting your past life in the confines of memory."
	extra_context = "Remember: Innkeepers get a 1CON, 1WIL, 1SPD, and 3STR buff while within the Inn."
	outfit = /datum/outfit/job/roguetown/innkeeper/exrogue
	category_tags = list(CTAG_INNKEEPER)
	
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_SEEPRICES_SHITTY) //a little thievery went a long way
	subclass_stats = list( //total 6 given by subclass. Remember: Innkeepers get 1CON, 1WIL, 1SPD, and 3STR while within the Inn.
		STATKEY_STR = -1,//weakling
		STATKEY_WIL = 1,
		STATKEY_CON = 1,
		STATKEY_PER = 2,
		STATKEY_SPD = 1
	)
	age_mod = /datum/class_age_mod/innkeeper
	subclass_skills = list(
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/labor/butchering = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/farming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/carpentry = SKILL_LEVEL_APPRENTICE, //apprentice to do some basic repairs around the inn if need be
		/datum/skill/misc/music = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/stealing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/innkeeper/exrogue/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/innkeep
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/innjacket
	backpack_contents = list(
		/obj/item/bottle_kit,
		/obj/item/storage/keyring/innkeep_rooms,
		/obj/item/reagent_containers/glass/bucket/pot/kettle/tankard/silver,
		/obj/item/mini_flagpole/innkeeper
	)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_UPPER_CLASS, H, "Savings.")

/datum/advclass/innkeeper/exsoldier
	name = "Once an Errant Soldier"
	tutorial = "Once a soldier clad in steel from head to toe, your past life of taking hits and swinging a sword is behind you. Mostly. You now work as the Innkeeper of the Azurian Pint, putting your past life in the confines of memory."
	extra_context = "Remember: Innkeepers get a 1CON, 1WIL, 1SPD, and 3STR buff while within the Inn."
	outfit = /datum/outfit/job/roguetown/innkeeper/exsoldier
	category_tags = list(CTAG_INNKEEPER)
	
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list( //total 6 given by subclass. Remember: Innkeepers get 1CON, 1WIL, 1SPD, and 3STR while within the Inn.
		STATKEY_WIL = 3,
		STATKEY_CON = 3
	)
	age_mod = /datum/class_age_mod/innkeeper
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
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

/datum/outfit/job/roguetown/innkeeper/exsoldier/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers//a variety of armor pieces that don't truly protect the important bits
	belt = /obj/item/storage/belt/rogue/leather/steel/tasset
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/innkeep
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/innjacket
	backpack_contents = list(
		/obj/item/bottle_kit,
		/obj/item/storage/keyring/innkeep_rooms,
		/obj/item/reagent_containers/glass/bucket/pot/kettle/tankard/silver,
		/obj/item/mini_flagpole/innkeeper
	)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_UPPER_CLASS, H, "Savings.")

/datum/advclass/innkeeper/expugilist
	name = "Once a Pugilistic Brute"
	tutorial = "Once a barbarian with muscles bigger than your head, your past life of caving others' heads is behind you. Mostly. You now work as the Innkeeper of the Azurian Pint, putting your past life in the confines of memory."
	extra_context = "Remember: Innkeepers get a 1CON, 1WIL, 1SPD, and 3STR buff while within the Inn."
	outfit = /datum/outfit/job/roguetown/innkeeper/expugilist
	category_tags = list(CTAG_INNKEEPER)
	
	traits_applied = list(TRAIT_CIVILIZEDBARBARIAN)
	subclass_stats = list( //total 6 given by subclass. Remember: Innkeepers get 1CON, 1WIL, 1SPD, and 3STR while within the Inn.
		STATKEY_INT = -2, //idiot
		STATKEY_STR = 1,
		STATKEY_WIL = 2,
		STATKEY_CON = 2
	)
	age_mod = /datum/class_age_mod/innkeeper
	subclass_skills = list(
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN, //punching, duh
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
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

/datum/outfit/job/roguetown/innkeeper/expugilist/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	gloves = /obj/item/clothing/gloves/roguetown/bandages 
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/innkeep
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	armor = /obj/item/clothing/suit/roguetown/armor/manual/pushups/leather//a little bit of low quality armor for the shirtless brutes
	backpack_contents = list(
		/obj/item/bottle_kit,
		/obj/item/storage/keyring/innkeep_rooms,
		/obj/item/reagent_containers/glass/bucket/pot/kettle/tankard/silver,
		/obj/item/mini_flagpole/innkeeper
	)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_UPPER_CLASS, H, "Savings.")

/datum/advclass/innkeeper/exranger
	name = "Once a Fierce Ranger"
	tutorial = "Once a ranger able to hit the apple above a man's head, your past life of flinging arrows is behind you. Mostly. You now work as the Innkeeper of the Azurian Pint, putting your past life in the confines of memory."
	extra_context = "Remember: Innkeepers get a 1CON, 1WIL, 1SPD, and 3STR buff while within the Inn."
	outfit = /datum/outfit/job/roguetown/innkeeper/exranger
	category_tags = list(CTAG_INNKEEPER)
	subclass_stats = list( //total 6 given by subclass. Remember: Innkeepers get 1CON, 1WIL, 1SPD, and 3STR while within the Inn.
		STATKEY_WIL = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = 1,
		STATKEY_PER = 2
	)
	age_mod = /datum/class_age_mod/innkeeper
	subclass_skills = list(
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN, //I doubt using a bow in an inn would make sense
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
		/datum/skill/craft/carpentry = SKILL_LEVEL_APPRENTICE, 
		/datum/skill/misc/music = SKILL_LEVEL_APPRENTICE,
	)

/datum/outfit/job/roguetown/innkeeper/exranger/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve//starts with a bow, but no arrows
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltr = /obj/item/storage/keyring/innkeep
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light
	armor = /obj/item/clothing/suit/roguetown/armor/leather/jacket/innjacket
	backpack_contents = list(
		/obj/item/bottle_kit,
		/obj/item/storage/keyring/innkeep_rooms,
		/obj/item/reagent_containers/glass/bucket/pot/kettle/tankard/silver,
		/obj/item/mini_flagpole/innkeeper
	)
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_UPPER_CLASS, H, "Savings.")
	
