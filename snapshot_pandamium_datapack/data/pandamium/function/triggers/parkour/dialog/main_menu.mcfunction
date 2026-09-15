#> **Builds the Parkour dialog menu (replaces the chat print_courses_menu).**

# Built at runtime because best times and option states are player-specific.

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog set value \
{ \
    type: "minecraft:multi_action", \
    title: "Parkour", \
    external_title: "Parkour", \
    body: [], \
    pause: false, \
    after_action: "none", \
    columns: 1, \
    actions: [], \
    "exit_action": { \
        "label": { \
            "translate": "gui.done" \
        }, \
        "action": { \
            "type": "minecraft:show_dialog", \
            "dialog": "pandamium:options" \
        } \
    } \
}

# Best Times

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Best Times:",bold:true,color:"aqua"}],width:500}

execute if score @s parkour.leaderboard_blacklist matches 1 run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"⚠",color:"yellow"},{text:" You have been blacklisted from parkour leaderboards.",color:"red"}],width:500}


# Course 1 (archived)

execute if score @s parkour_1.best_time matches 1.. run scoreboard players operation <ticks> variable = @s parkour_1.best_time
execute if score @s parkour_1.best_time matches 1.. run function pandamium:triggers/parkour/dialog/get_time_string
execute if score @s parkour_1.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:["",": ",[]],width:500}
execute if score @s parkour_1.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0] set value {text:"",color:"dark_aqua"}
execute if score @s parkour_1.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0].text set from storage pandamium:dictionary parkour.parkour_1.name
execute if score @s parkour_1.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white",extra:[]}
execute if score @s parkour_1.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].extra set from storage pandamium:temp time_str
execute if score @s parkour_1.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents append value {text:" (ARCHIVED)",color:"gray"}


# Course 2 (archived)

execute if score @s parkour_2.best_time matches 1.. run scoreboard players operation <ticks> variable = @s parkour_2.best_time
execute if score @s parkour_2.best_time matches 1.. run function pandamium:triggers/parkour/dialog/get_time_string
execute if score @s parkour_2.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:["",": ",[]],width:500}
execute if score @s parkour_2.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0] set value {text:"",color:"dark_aqua"}
execute if score @s parkour_2.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0].text set from storage pandamium:dictionary parkour.parkour_2.name
execute if score @s parkour_2.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white",extra:[]}
execute if score @s parkour_2.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].extra set from storage pandamium:temp time_str
execute if score @s parkour_2.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents append value {text:" (ARCHIVED)",color:"gray"}


# Course 3 (unconfirmed)

execute if score @s parkour_3.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"dark_aqua"},{text:" (Unconfirmed)",color:"yellow"},": ",{text:"N/A",color:"gray"}," ",{text:"⚠",color:"yellow",hover_event:{action:"show_text",value:["",{text:"Unconfirmed",color:"yellow",underlined:true},{text:"\nThis time was made before lag correction was added, so may be shorter than your real time.",color:"gray"}]}}],width:500}
execute if score @s parkour_3.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0].text set from storage pandamium:dictionary parkour.parkour_3.name
execute if score @s parkour_3.best_time matches 1.. run scoreboard players operation <ticks> variable = @s parkour_3.best_time
execute if score @s parkour_3.best_time matches 1.. run function pandamium:triggers/parkour/dialog/get_time_string
execute if score @s parkour_3.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[3] set value {text:"",color:"white",extra:[]}
execute if score @s parkour_3.best_time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[3].extra set from storage pandamium:temp time_str


# Course 3 (real)

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"dark_aqua"},": ",{text:"N/A",color:"gray"}],width:500}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0].text set from storage pandamium:dictionary parkour.parkour_3.name

execute if score @s parkour_3.best_time_real matches 1.. run scoreboard players operation <ticks> variable = @s parkour_3.best_time_real
execute if score @s parkour_3.best_time_real matches 1.. run function pandamium:triggers/parkour/dialog/get_time_string
execute if score @s parkour_3.best_time_real matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white",extra:[]}
execute if score @s parkour_3.best_time_real matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].extra set from storage pandamium:temp time_str


# Course 4 (shortest time)

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"dark_aqua"},": ",{text:"N/A",color:"gray"}],width:500}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0].text set from storage pandamium:dictionary parkour.parkour_4.name

execute if score @s parkour_4.shortest_time.time matches 1.. run scoreboard players operation <ticks> variable = @s parkour_4.shortest_time.time
execute if score @s parkour_4.shortest_time.time matches 1.. run function pandamium:triggers/parkour/dialog/get_time_string
execute if score @s parkour_4.shortest_time.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white",extra:[]}
execute if score @s parkour_4.shortest_time.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].extra set from storage pandamium:temp time_str

execute if score @s parkour_4.shortest_time.time matches 1.. run execute store result storage pandamium:temp falls_str int 1 run scoreboard players get @s parkour_4.shortest_time.falls
execute if score @s parkour_4.shortest_time.time matches 1.. run data modify storage pandamium:temp falls_str set string storage pandamium:temp falls_str

execute if score @s parkour_4.shortest_time.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents append value {text:" with ",color:"gray"}
execute if score @s parkour_4.shortest_time.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents append value {text:"",color:"white"}
execute if score @s parkour_4.shortest_time.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents append value {text:" falls",color:"gray"}
execute if score @s parkour_4.shortest_time.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[-2].text set from storage pandamium:temp falls_str


# More Info

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions append value {label:{text:"More Info",color:"aqua"},tooltip:{text:"Click to view detailed information about courses",color:"white"},action:{type:"run_command",command:"trigger parkour set -105"}}


# Courses

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions append value {label:["["],tooltip:[{text:"Click to teleport to this course.\n\n",color:"white"},{text:"Or run ",color:"white"},{text:"/trigger parkour.warp.Forgotten_Caverns",color:"gray"},{text:" to teleport there manually.",color:"white"}],action:{type:"run_command",command:"trigger parkour.warp.Forgotten_Caverns"}}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append from storage pandamium:dictionary parkour.parkour_3.name

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append value "]"

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions append value {label:["["],tooltip:[{text:"Click to teleport to this course.\n\n",color:"white"},{text:"Or run ",color:"white"},{text:"/trigger parkour.warp.Jack_o_Giggle",color:"gray"},{text:" to teleport there manually.",color:"white"}],action:{type:"run_command",command:"trigger parkour.warp.Jack_o_Giggle"}}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append from storage pandamium:dictionary parkour.parkour_4.name

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append value "]"


# Options

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions append value {label:[{text:"Show Parkour Timer: ",color:"aqua"}],tooltip:[{text:"Controls whether the parkour timer is displayed while playing a course.",color:"white"}],action:{type:"run_command",command:"trigger options set -5"}}

execute unless score @s hide_parkour_timer matches 1 run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append value {text:"On",color:"yellow",bold:true}

execute if score @s hide_parkour_timer matches 1 run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append value {text:"Off",color:"yellow",bold:true}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions append value {label:[{text:"New Attempt on Fall: ",color:"aqua"}],tooltip:[{text:"If On, falling on any course\nwill send you back to the\nbeginning and restart your timer,\nregardless of your checkpoint.",color:"white"},{text:"\n\nUseful for speedruns!",color:"gray"}],action:{type:"run_command",command:"trigger options set -15"}}

execute unless score @s optn.parkour.restart_on_fall matches 1 run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append value {text:"Off",color:"yellow",bold:true}

execute if score @s optn.parkour.restart_on_fall matches 1 run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.actions[-1].label append value {text:"On",color:"yellow",bold:true}

function pandamium:utils/show_dialog with storage pandamium:local functions."pandamium:triggers/parkour/*"