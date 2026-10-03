#> Reads the payload sent by pandamium:triggers/options/dialog/christmas.
# template: -10000000$(disable_christmas_mobs)5 - the last digit selects this menu (see main)
execute unless score <month> global matches 12 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" The Christmas options are only available in December!"}]
# get inputs
execute store result score <disable_christmas_mobs> variable run scoreboard players operation @s options /= #-10 constant
scoreboard players operation <disable_christmas_mobs> variable %= #10 constant
execute unless score <disable_christmas_mobs> variable matches 0..1 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
# apply options
execute if score <disable_christmas_mobs> variable matches 0 run scoreboard players reset @s optn.disable_christmas_mobs
execute if score <disable_christmas_mobs> variable matches 1 run scoreboard players set @s optn.disable_christmas_mobs 1
# return to the dialog-based options menu
function pandamium:triggers/options/dialog/main_menu
