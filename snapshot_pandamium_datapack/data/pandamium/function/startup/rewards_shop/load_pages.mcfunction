data remove storage pandamium:rewards_shop dialogs
data modify storage pandamium:rewards_shop dialogs.main_menu.dialog set value {\
	"type": "minecraft:multi_action",\
	"title": "Pandamium Rewards Shop",\
	"body": [\
		{\
			"type": "minecraft:plain_message",\
			"contents": "{description}",\
			"width": 400\
		}\
	],\
	"after_action": "none",\
	"pause": false,\
	"exit_action": {\
		"label": "Done",\
		"action": {\
			"type": "minecraft:run_command",\
			"command": "/trigger options set -100000"\
		}\
	},\
	"columns": 1,\
	"actions": []\
}
##
## Misc
##
data modify storage pandamium:rewards_shop dialogs.misc.dialog set value {\
	"type": "minecraft:confirmation",\
	"title": "Pandamium Rewards Shop",\
	"body": [\
		{\
			"type": "minecraft:plain_message",\
			"contents": [\
				"",\
				{\
					"underlined": true,\
					"shadow_color": 0,\
					"text": "                                                                "\
				},\
				{\
					"bold": true,\
					"text": "\n\n\nMiscellaneous Rewards\n"\
				},\
				{\
					"bold": false,\
					"underlined": true,\
					"shadow_color": 0,\
					"text": "\n                                                                "\
				}\
			],\
			"width": 400\
		}\
	],\
	"pause": false,\
	"after_action": "none",\
	"yes": {\
		"label": "Back",\
		"action": {\
			"type": "run_command",\
			"command": "trigger vote_shop set 1"\
		}\
	},\
	"no": {\
		"label": "Done",\
		"action": {\
			"type": "run_command",\
			"command": "trigger vote_shop set 1000001"\
		}\
	}\
}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "pandamium_guidebook"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "golden_apple"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "name_tag"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "5_experience_bottles"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "book_and_quill"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "diamond"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "night_vision_potion"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "mending_enchanted_book"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "blindness_splash_potion"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "shulker"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "ominous_bottle"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "knockback_stick"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "bedrock_breaker"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "dwarven_potion"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "swift_sneak_iii_enchanted_book"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "enchanted_golden_apple"}
function pandamium:startup/rewards_shop/load_pages/append_random_online_player_head {dialog_name: "misc"}
function pandamium:startup/rewards_shop/load_pages/append_own_player_head {dialog_name: "misc"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "misc", reward_id: "endermite_minecart"}
data modify storage pandamium:rewards_shop dialogs.main_menu.dialog.actions append value {label:"Miscellaneous Rewards",tooltip:["Common rewards and unique items",{color:"dark_gray",text:"\n• Golden Apple\n• Name Tag\n• 5 Experience Bottles\n• Book and Quill\n• Diamond\n• Mending Book\n• Ominous Bottle\n• Blindness Splash Potion\n• Bedrock Breaker\n• Dwarven Potion\n• Swift Sneak III Book\n• Enchanted Golden Apple\n• Your Head"},{color:"gray",text:"\nAnd More!"}],width:150,action:{type:"minecraft:run_command",command:"trigger rewards_shop set 101"}}
##
## Wilderness Bound
##
data modify storage pandamium:rewards_shop dialogs.autumn_drop_2026.dialog set value {\
	"type": "minecraft:confirmation",\
	"title": "Pandamium Rewards Shop",\
	"body": [\
		{\
			"type": "minecraft:plain_message",\
			"contents": [\
				"",\
				{\
					"underlined": true,\
					"shadow_color": 0,\
					"text": "                                                                "\
				},\
				{\
					"bold": true,\
					"text": "\n\n\nWilderness Bound\n"\
				},\
				{\
					"bold": false,\
					"underlined": true,\
					"shadow_color": 0,\
					"text": "\n                                                                "\
				}\
			],\
			"width": 400\
		}\
	],\
	"pause": false,\
	"after_action": "none",\
	"yes": {\
		"label": "Back",\
		"action": {\
			"type": "run_command",\
			"command": "trigger vote_shop set 1"\
		}\
	},\
	"no": {\
		"label": "Done",\
		"action": {\
			"type": "run_command",\
			"command": "trigger vote_shop set 1000001"\
		}\
	}\
}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "autumn_drop_2026", reward_id: "4_straw_beds"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "autumn_drop_2026", reward_id: "abandoned_camp_map"}
function pandamium:startup/rewards_shop/load_pages/append_item {dialog_name: "autumn_drop_2026", reward_id: "autumn_drop_2026_loot_bundle"}
data modify storage pandamium:rewards_shop dialogs.main_menu.dialog.actions append value {label:'"Wilderness Bound" Drop',tooltip:['A selection of items from the "Wilderness Bound" game drop',{color:"dark_gray",text:"\n• 4 Straw Beds\n• Abandoned Camp Map\n• Wilderness Bound Loot Bundle"}],width:150,action:{type:"minecraft:run_command",command:"trigger rewards_shop set 102"}}

##
## All
##
data modify storage pandamium:rewards_shop dialogs.all.dialog set value {\
	"type": "minecraft:confirmation",\
	"title": "Pandamium Rewards Shop",\
	"body": [],\
	"pause": false,\
	"after_action": "none",\
	"yes": {\
		"label": "Back",\
		"action": {\
			"type": "run_command",\
			"command": "trigger vote_shop set 1"\
		}\
	},\
	"no": {\
		"label": "Done",\
		"action": {\
			"type": "run_command",\
			"command": "trigger vote_shop set 1000001"\
		}\
	}\
}
data modify storage pandamium:rewards_shop dialogs.all.dialog.body append from storage pandamium:rewards_shop dialogs.misc.dialog.body[]
data modify storage pandamium:rewards_shop dialogs.all.dialog.body append from storage pandamium:rewards_shop dialogs.autumn_drop_2026.dialog.body[]
data modify storage pandamium:rewards_shop dialogs.main_menu.dialog.actions append value {label:{italic:true,text:"Browse All"},tooltip:"Scroll through all sections at once",width:100,action:{type:"minecraft:run_command",command:"trigger rewards_shop set 201"}}
