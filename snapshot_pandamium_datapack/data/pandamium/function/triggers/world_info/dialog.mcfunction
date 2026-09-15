#> Builds a dialog version of /trigger world_info (plain strings only - dialogs reject {score:...}).

# compute the same values as /trigger world_info

execute store result score <nether_player_count> variable in the_nether if entity @a[x=0,gamemode=!spectator]

execute store result score <overworld_player_count> variable in overworld if entity @a[x=0,gamemode=!spectator]

execute store result score <end_player_count> variable in the_end if entity @a[x=0,gamemode=!spectator]

execute store result score <staff_world_player_count> variable in pandamium:staff_world if entity @a[x=0,gamemode=!spectator]

scoreboard players operation <overworld_player_count> variable += <staff_world_player_count> variable

execute store result score <nether_mob_count> variable in the_nether if entity @e[type=!#pandamium:mob_limit_excluded,type=!player,x=0]

execute store result score <overworld_mob_count> variable in overworld if entity @e[type=!#pandamium:mob_limit_excluded,type=!player,x=0]

execute store result score <end_mob_count> variable in the_end if entity @e[type=!#pandamium:mob_limit_excluded,type=!player,x=0]

function pandamium:utils/get/total_sleeping_players

execute store result score <minimum_sleeping_players_required> variable run gamerule players_sleeping_percentage

scoreboard players operation <minimum_sleeping_players_required> variable *= <overworld_player_count> variable

scoreboard players operation <minimum_sleeping_players_required> variable /= #-100 constant

scoreboard players operation <minimum_sleeping_players_required> variable *= #-1 constant

# global totals

scoreboard players operation <global_player_count> variable = <overworld_player_count> variable

scoreboard players operation <global_player_count> variable += <nether_player_count> variable

scoreboard players operation <global_player_count> variable += <end_player_count> variable

scoreboard players operation <global_mob_count> variable = <overworld_mob_count> variable

scoreboard players operation <global_mob_count> variable += <nether_mob_count> variable

scoreboard players operation <global_mob_count> variable += <end_mob_count> variable

scoreboard players operation <global_mob_cap> variable = <mob_limit> global

execute store result score <global_item_count> variable in overworld if entity @e[type=item]

execute store result score <global_items_tmp> variable in the_nether if entity @e[type=item]

scoreboard players operation <global_item_count> variable += <global_items_tmp> variable

execute store result score <global_items_tmp> variable in the_end if entity @e[type=item]

scoreboard players operation <global_item_count> variable += <global_items_tmp> variable

# convert scores to strings

execute store result storage pandamium:temp s_global_players int 1 run scoreboard players get <global_player_count> variable

data modify storage pandamium:temp s_global_players set string storage pandamium:temp s_global_players

execute store result storage pandamium:temp s_global_mobs int 1 run scoreboard players get <global_mob_count> variable

data modify storage pandamium:temp s_global_mobs set string storage pandamium:temp s_global_mobs

execute store result storage pandamium:temp s_mob_cap int 1 run scoreboard players get <global_mob_cap> variable

data modify storage pandamium:temp s_mob_cap set string storage pandamium:temp s_mob_cap

execute store result storage pandamium:temp s_global_items int 1 run scoreboard players get <global_item_count> variable

data modify storage pandamium:temp s_global_items set string storage pandamium:temp s_global_items

execute store result storage pandamium:temp s_overworld_players int 1 run scoreboard players get <overworld_player_count> variable

data modify storage pandamium:temp s_overworld_players set string storage pandamium:temp s_overworld_players

execute store result storage pandamium:temp s_sleeping int 1 run scoreboard players get <total_sleeping_players> variable

data modify storage pandamium:temp s_sleeping set string storage pandamium:temp s_sleeping

execute store result storage pandamium:temp s_sleeping_required int 1 run scoreboard players get <minimum_sleeping_players_required> variable

data modify storage pandamium:temp s_sleeping_required set string storage pandamium:temp s_sleeping_required

execute store result storage pandamium:temp s_overworld_mobs int 1 run scoreboard players get <overworld_mob_count> variable

data modify storage pandamium:temp s_overworld_mobs set string storage pandamium:temp s_overworld_mobs

execute store result storage pandamium:temp s_nether_players int 1 run scoreboard players get <nether_player_count> variable

data modify storage pandamium:temp s_nether_players set string storage pandamium:temp s_nether_players

execute store result storage pandamium:temp s_nether_mobs int 1 run scoreboard players get <nether_mob_count> variable

data modify storage pandamium:temp s_nether_mobs set string storage pandamium:temp s_nether_mobs

execute store result storage pandamium:temp s_end_players int 1 run scoreboard players get <end_player_count> variable

data modify storage pandamium:temp s_end_players set string storage pandamium:temp s_end_players

execute store result storage pandamium:temp s_end_mobs int 1 run scoreboard players get <end_mob_count> variable

data modify storage pandamium:temp s_end_mobs set string storage pandamium:temp s_end_mobs

# build the dialog

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog set value {type:"minecraft:notice",title:"World Info",external_title:"World Info",body:[],pause:false,after_action:"none",action:{label:{translate:"gui.back"},action:{type:"minecraft:show_dialog",dialog:"pandamium:options"}}}

# Global

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"aqua",bold:false},{text:"Global",color:"aqua",bold:true}],width:500}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\n\nPlayers: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_global_players

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nMobs: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_global_mobs

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nMob Cap: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_mob_cap

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nItems: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_global_items

execute if score <dev_environment> global matches 1 run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:" In Dev Mode",color:"dark_purple"}

# Mob Cap

execute if score <global_mob_count> variable >= <mob_limit> global run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Mob cap exceeded!\n No more mobs will spawn",color:red,bold:true}],width:500}

# Overworld

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"aqua",bold:false},{text:"Overworld",color:"aqua",bold:true}],width:500}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\n\nPlayers: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_overworld_players

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nSleeping Players: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_sleeping

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:" (",bold:false,color:"gray"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_sleeping

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"/",bold:false,color:"gray"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_sleeping_required

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:" required)",bold:false,color:"gray"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nMobs: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_overworld_mobs

execute unless predicate pandamium:environment/is_raining run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nWeather: ",color:"green"}

execute unless predicate pandamium:environment/is_raining run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"Clear",color:"aqua"}

execute if predicate pandamium:environment/is_raining unless predicate pandamium:environment/is_raining_and_thundering run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nWeather: ",color:"green"}

execute if predicate pandamium:environment/is_raining unless predicate pandamium:environment/is_raining_and_thundering run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"Rain",color:"aqua"}

execute if predicate pandamium:environment/is_raining_and_thundering run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nWeather: ",color:"green"}

execute if predicate pandamium:environment/is_raining_and_thundering run data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"Thunder",color:"aqua"}

# Nether

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"aqua",bold:false},{text:"Nether",color:"aqua",bold:true}],width:500}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\n\nPlayers: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_nether_players

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nMobs: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_nether_mobs

# End

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"aqua",bold:false},{text:"End",color:"aqua",bold:true}],width:500}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\n\nPlayers: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_end_players

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append value {text:"\nMobs: ",color:"green"}

data modify storage pandamium:local functions."pandamium:triggers/world_info/*".dialog.body[-1].contents append from storage pandamium:temp s_end_mobs

function pandamium:utils/show_dialog with storage pandamium:local functions."pandamium:triggers/world_info/*"