/datum/job/roguetown/neophyte
	title = "Neophyte"
	flag = NEOPHYTE
	department_flag = INQUISITION
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	allowed_patrons = list(/datum/patron/old_god)
	tutorial = "The stories of old must be Transcribed. You are a Neophyte, an apprentice and page for the local inquisitorial embassy. As you are not a combatant like most of this troupe, your responsibilities are little, but so are your obligations. Accompany the Absolver in spreading His Love, or follow the Inquisitor to seek stories to scribe."
	selection_color = JCOLOR_INQUISITION
	outfit = /datum/outfit/job/roguetown/neophyte/
	display_order = JDO_NEOPHYTE
	min_pq = 1
	max_pq = null
	round_contrib_points = 2
	wanderer_examine = FALSE
	advjob_examine = FALSE
	give_bank_account = 10
	job_traits = list(
		TRAIT_INQUISITION,
		TRAIT_HOMESTEAD_EXPERT,
		TRAIT_SHIRTLESS, //no armor!
	)
	//As they are meant to be a non-combatant, let us blacklist all combat-centric virtues. Similar to the Hag.
	virtue_restrictions = list(
		/datum/virtue/combat/dualwielder,
		/datum/virtue/combat/combat_virtue, 
		/datum/virtue/movement/acrobatic,
		/datum/virtue/utility/woodwalker,
		/datum/virtue/combat/crossbowman,
		/datum/virtue/combat/bowman,)
	
	advclass_cat_rolls = list(CTAG_NEOPHYTE = 2)
	job_subclasses = list(
		/datum/advclass/neophyte
	)

/datum/advclass/neophyte
	name = "Neophyte"
	tutorial = "The stories of old must be Transcribed. You are a Neophyte, an apprentice and page for the local inquisitorial embassy. As you are not a combatant like most of the Orthodoxists, your responsibilities are little, but so are your obligations."
	outfit = /datum/outfit/job/roguetown/neophyte/basic
	subclass_languages = list(/datum/language/otavan)
	category_tags = list(CTAG_NEOPHYTE)
	subclass_stats = list(// a glass cannon without the cannon part at all
		STATKEY_STR = -3,
		STATKEY_CON = -3,
		STATKEY_INT = 2,
		STATKEY_SPD = 2 
	)
	subclass_skills = list(
		/datum/skill/magic/holy = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/sneaking = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/sewing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/crafting = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/butchering = SKILL_LEVEL_NOVICE,
		/datum/skill/craft/cooking = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/labor/farming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/masonry = SKILL_LEVEL_NOVICE, //potential for repairs, an extra class cookie
		/datum/skill/craft/carpentry = SKILL_LEVEL_NOVICE, 
	) //A little bit of every basic labor/craft skill, but absolutely zero combat skills

	subclass_stashed_items = list(
		"The Book" = /obj/item/book/rogue/bibble/psy
	)

/datum/outfit/job/roguetown/neophyte/basic/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	gloves = /obj/item/clothing/gloves/roguetown/otavan/psygloves
	cloak = /obj/item/clothing/cloak/tabard/psydontabard/black
	neck = /obj/item/clothing/neck/roguetown/psicross/silver
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/natural/feather
	beltl = /obj/item/storage/belt/rogue/pouch/coins/mid
	backr = /obj/item/storage/backpack/rogue/satchel/black
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/otavan
	shoes = /obj/item/clothing/shoes/roguetown/boots/psydonboots
	id = /obj/item/clothing/ring/signet/psy
	backpack_contents = list(
		/obj/item/book/rogue/bibble/psy = 2,
		/obj/item/reagent_containers/food/snacks/tallow/red = 1,
		/obj/item/paper/scroll = 3,
		/obj/item/roguekey/inquisitionmanor = 1,
		/obj/item/paper/inqslip/arrival/neophyte = 1//a pitiful three Marques
		)

	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T1, passive_gain = CLERIC_REGEN_DEVOTEE, devotion_limit = CLERIC_REQ_1)	//Capped to T1 miracles.
	change_origin(H, /datum/virtue/origin/otava, "Holy order")
