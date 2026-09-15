#> Builds the Advancement Help dialog at runtime (progress is player-specific,
#> so each advancement name button is filled with that player's live count).
data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog set value \
{ \
    "type": "minecraft:multi_action", \
    "title": "Advancement Help", \
    "pause": false, \
    "after_action": "none", \
    "columns": 2, \
    "body": { \
        "type": "minecraft:plain_message", \
        "contents": "Select an advancement to see your progress and whats left to do.", \
        "width": 400 \
    }, \
    "exit_action": { \
        "label": "Done", \
        "action": { \
            "type": "minecraft:show_dialog", \
            "dialog": "pandamium:options" \
        } \
    }, \
    "actions": [] \
}

# Minicraft: Pandamium Edition

function pandamium:triggers/help.advancements/get_advancement_progress/craft_every_mini_block

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{player:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYTM0YWViMmVhNDI0YzMwNmFhZmJkNzc2N2VmNzBiMTk3OGZhMWZiODc2OTNlMTU2YjdlMzYxYzI2OTU2YjZhZCJ9fX0="}]}},tooltip:{text:"Craft EVERY* mini-block in a stonecutter",color:"dark_purple",extra:[{text:"\n(except the Dragon Egg)",color:"gray"}]},action:{type:"run_command",command:"trigger help.advancements set 101"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{text:"Minicraft: Pandamium Edition"},{text:" "}],tooltip:{text:"Craft EVERY* mini-block in a stonecutter",color:"dark_purple",extra:[{text:"\n(except the Dragon Egg)",color:"gray"}]},action:{type:"run_command",command:"trigger help.advancements set 101"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# How Did They Get Those?

function pandamium:triggers/help.advancements/get_advancement_progress/obtain_unobtainable_mini_blocks

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{player:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNmFmNTA3ODVjYWQ5MWU1ZWJjZDE5YjU3ZWRjZWE4Y2JjZGM1OGYwNmI5MWMxOWVlMTdmYjI0MjJjMTg5MmFkMyJ9fX0="}]}},tooltip:{text:"Obtain all the Unobtainable Mini Blocks from wandering traders",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 111"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{text:"How Did They Get Those?"},{text:" "}],tooltip:{text:"Obtain all the Unobtainable Mini Blocks from wandering traders",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 111"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Taxidermist

function pandamium:triggers/help.advancements/get_advancement_progress/obtain_every_mob_head

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{player:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNjY3ZTE1ZWFiNzMwNjRiNjY4MGQxZGI5OGJhNDQ1ZWQwOTE0YmEzNWE3OTk5OTdjMGRhMmIwM2ZmYzNhODgyNiJ9fX0="}]}},tooltip:{text:"Collect every Custom Mob Head using charged creepers",color:"dark_purple",extra:[{text:"\n(except the Ender Dragon Head)",color:"gray"}]},action:{type:"run_command",command:"trigger help.advancements set 102"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{text:"Taxidermist"},{text:" "}],tooltip:{text:"Collect every Custom Mob Head using charged creepers",color:"dark_purple",extra:[{text:"\n(except the Ender Dragon Head)",color:"gray"}]},action:{type:"run_command",command:"trigger help.advancements set 102"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Pandamonium

function pandamium:triggers/help.advancements/get_advancement_progress/obtain_every_panda_head

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{player:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOGNhZGQ0YmYzYzRjYWNlOTE2NjgwZTFmZWY5MGI1ZDE2YWQ2NjQzOTUxNzI1NjY4YmE2YjQ5OTZiNjljYTE0MCJ9fX0="}]}},tooltip:{text:"Collect every Panda Head using charged creepers",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 112"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{text:"Pandamonium"},{text:" "}],tooltip:{text:"Collect every Panda Head using charged creepers",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 112"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Man's Best Friend?

function pandamium:triggers/help.advancements/get_advancement_progress/obtain_every_wolf_head

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{player:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvNzJjZTE2MWUzMjA1ZDg5ZTdlNGQzZWMwNGQyNWFiZmVhNjIzMWEyMjc3YTJiZDc2ZjQ2OTNmNGNlNjE4OWEyZCJ9fX0="}]}},tooltip:{text:"Collect every Wolf Head using charged creepers",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 113"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{text:"Man's Best Friend?"},{text:" "}],tooltip:{text:"Collect every Wolf Head using charged creepers",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 113"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Creeper's Payback

function pandamium:triggers/help.advancements/get_advancement_progress/obtain_every_cat_head

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{player:{properties:[{name:"textures",value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMjExM2RiZDNjNmEwNzhhMTdiNGVkYjc4Y2UwN2Q4MzZjMzhkYWNlNTAyN2Q0YjBhODNmZDYwZTdjYTdhMGZjYiJ9fX0="}]}},tooltip:{text:"Collect every Cat Head using charged creepers",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 114"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{text:"Creeper's Payback"},{text:" "}],tooltip:{text:"Collect every Cat Head using charged creepers",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 114"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Adventuring Time

function pandamium:triggers/help.advancements/get_advancement_progress/adventuring_time

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/map",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.adventure.adventuring_time.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 103"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.adventure.adventuring_time.title"},{text:" "}],tooltip:{translate:"advancements.adventure.adventuring_time.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 103"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Kill All Mobs

function pandamium:triggers/help.advancements/get_advancement_progress/kill_all_mobs

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/diamond_sword",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.adventure.kill_all_mobs.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 104"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.adventure.kill_all_mobs.title"},{text:" "}],tooltip:{translate:"advancements.adventure.kill_all_mobs.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 104"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Balanced Diet

function pandamium:triggers/help.advancements/get_advancement_progress/balanced_diet

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/apple",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.husbandry.balanced_diet.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 105"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.husbandry.balanced_diet.title"},{text:" "}],tooltip:{translate:"advancements.husbandry.balanced_diet.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 105"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# You're a Big Kid Now / Bred All Animals

function pandamium:triggers/help.advancements/get_advancement_progress/bred_all_animals

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/wheat",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.husbandry.breed_all_animals.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 107"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.husbandry.breed_all_animals.title"},{text:" "}],tooltip:{translate:"advancements.husbandry.breed_all_animals.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 107"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Trim With All Exclusive Armour Patterns

function pandamium:triggers/help.advancements/get_advancement_progress/trim_with_all_exclusive_armor_patterns

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/silence_armor_trim_smithing_template",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.adventure.trim_with_all_exclusive_armor_patterns.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 106"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.adventure.trim_with_all_exclusive_armor_patterns.title"},{text:" "}],tooltip:{translate:"advancements.adventure.trim_with_all_exclusive_armor_patterns.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 106"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Complete Catalogue

function pandamium:triggers/help.advancements/get_advancement_progress/complete_catalogue

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/cod",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.husbandry.complete_catalogue.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 108"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.husbandry.complete_catalogue.title"},{text:" "}],tooltip:{translate:"advancements.husbandry.complete_catalogue.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 108"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Whole Pack

function pandamium:triggers/help.advancements/get_advancement_progress/whole_pack

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/bone",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.husbandry.whole_pack.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 109"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.husbandry.whole_pack.title"},{text:" "}],tooltip:{translate:"advancements.husbandry.whole_pack.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 109"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


# Explore Nether

function pandamium:triggers/help.advancements/get_advancement_progress/explore_nether

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:{atlas:"minecraft:items",sprite:"minecraft:item/netherite_boots",color:"#FFFFFF",shadow_color:0},tooltip:{translate:"advancements.nether.explore_nether.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 110"},width:20}

data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions append value {label:[{translate:"advancements.nether.explore_nether.title"},{text:" "}],tooltip:{translate:"advancements.nether.explore_nether.description",color:"dark_purple"},action:{type:"run_command",command:"trigger help.advancements set 110"},width:175}

execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"aqua"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"/","color":"gray"}
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"???","color":"dark_aqua"}
execute if score <total_missing> variable matches ..0 run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label append value {"text":"Completed!","color":"dark_green"}

execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text int 1 run scoreboard players get <total_completed> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[2].text
execute if score <total_missing> variable matches 1.. run execute store result storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text int 1 run scoreboard players get <goal> variable
execute if score <total_missing> variable matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text set string storage pandamium:local functions."pandamium:triggers/help.advancements/*".dialog.actions[-1].label[4].text


function pandamium:utils/show_dialog with storage pandamium:local functions."pandamium:triggers/help.advancements/*"
