#> **Builds a "More Info" dialog with all of the player's course-4 (Jack-o-Giggle) parkour stats.**

# Triggered by the More Info button in the parkour main menu (trigger parkour set -105).

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog set value \
{ \
    type: "minecraft:notice", \
    title: "Course Stats", \
    external_title: "Course Stats", \
    body: [], \
    pause: false, \
    after_action: "none", \
    action: { \
		label: { \
							translate: "gui.back" \
						}, \
						action: { \
							type: "minecraft:run_command", \
								command: "trigger parkour" \
						} \
	} \
}

# Forgotten Caverns

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"",color:"dark_aqua"},{text:" Deathless Run: ",color:"gray"}, "",{text:"N/A",color:"white"}],width:500}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[0].text set from storage pandamium:dictionary parkour.parkour_3.name

execute if score @s parkour_3.best_time_deathless matches 1.. run scoreboard players operation <ticks> variable = @s parkour_3.best_time_deathless

execute if score @s parkour_3.best_time_deathless matches 1.. run function pandamium:triggers/parkour/dialog/get_time_string

execute if score @s parkour_3.best_time_deathless matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[3] set value {text:"",color:"white",extra:[]}

execute if score @s parkour_3.best_time_deathless matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[3].extra set from storage pandamium:temp time_str
# Fewest Falls Run

execute if score @s parkour_4.fewest_falls.time matches 1.. run scoreboard players operation <ticks> variable = @s parkour_4.fewest_falls.time

execute if score @s parkour_4.fewest_falls.time matches 1.. run function pandamium:triggers/parkour/dialog/get_time_string

execute if score @s parkour_4.fewest_falls.time matches 1.. run execute store result storage pandamium:temp fewest_falls_str int 1 run scoreboard players get @s parkour_4.fewest_falls.falls

execute if score @s parkour_4.fewest_falls.time matches 1.. run data modify storage pandamium:temp fewest_falls_str set string storage pandamium:temp fewest_falls_str

execute if score @s parkour_4.fewest_falls.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Jack-o-Giggle",color:"dark_aqua"}, {text:" Fewest Falls Run: ",color:"gray"}, "", {text:" falls in ",color:"gray"}, []],width:500}

execute if score @s parkour_4.fewest_falls.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white"}

execute if score @s parkour_4.fewest_falls.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].text set from storage pandamium:temp fewest_falls_str

execute if score @s parkour_4.fewest_falls.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[4] set value {text:"",color:"white",extra:[]}

execute if score @s parkour_4.fewest_falls.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[4].extra set from storage pandamium:temp time_str

execute unless score @s parkour_4.fewest_falls.time matches 1.. run data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Jack-o-Giggle",color:"dark_aqua"}, {text:" Fewest Falls Run: ",color:"gray"}, {text:"N/A",color:"white"}],width:500}

# Attempts

execute store result storage pandamium:temp attempts_str int 1 run scoreboard players get @s parkour_4.attempts

data modify storage pandamium:temp attempts_str set string storage pandamium:temp attempts_str

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Jack-o-Giggle",color:"dark_aqua"}, {text:" Attempts: ",color:"gray"}, ""],width:500}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white"}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].text set from storage pandamium:temp attempts_str

# Completions

execute store result storage pandamium:temp completions_str int 1 run scoreboard players get @s parkour_4.completions

data modify storage pandamium:temp completions_str set string storage pandamium:temp completions_str

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Jack-o-Giggle",color:"dark_aqua"}, {text:" Completions: ",color:"gray"}, ""],width:500}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white"}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].text set from storage pandamium:temp completions_str

# Total Falls

execute store result storage pandamium:temp total_falls_str int 1 run scoreboard players get @s parkour_4.falls

data modify storage pandamium:temp total_falls_str set string storage pandamium:temp total_falls_str

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Jack-o-Giggle",color:"dark_aqua"}, {text:" Total Falls: ",color:"gray"}, ""],width:500}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white"}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].text set from storage pandamium:temp total_falls_str

# Jumps

execute store result storage pandamium:temp jumps_str int 1 run scoreboard players get @s parkour_4.jumps

data modify storage pandamium:temp jumps_str set string storage pandamium:temp jumps_str

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body append value {type:"minecraft:plain_message",contents:[{text:"Jack-o-Giggle",color:"dark_aqua"}, {text:" Jumps: ",color:"gray"}, ""],width:500}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2] set value {text:"",color:"white"}

data modify storage pandamium:local functions."pandamium:triggers/parkour/*".dialog.body[-1].contents[2].text set from storage pandamium:temp jumps_str

function pandamium:utils/show_dialog with storage pandamium:local functions."pandamium:triggers/parkour/*"
