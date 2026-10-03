#> Reads the payload sent by pandamium:triggers/options/dialog/halloween.
# template: -10000000$(disable_flying_eyeballs)4 - the last digit selects this menu (see main)
execute unless score <month> global matches 10 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" The Halloween options are only available in October!"}]
# get inputs
execute store result score <disable_flying_eyeballs> variable run scoreboard players operation @s options /= #-10 constant
scoreboard players operation <disable_flying_eyeballs> variable %= #10 constant
execute unless score <disable_flying_eyeballs> variable matches 0..1 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
# apply options
execute if score <disable_flying_eyeballs> variable matches 0 run scoreboard players reset @s optn.disable_flying_eyeballs
execute if score <disable_flying_eyeballs> variable matches 1 run scoreboard players set @s optn.disable_flying_eyeballs 1
# return to the dialog-based options menu
function pandamium:triggers/options/dialog/main_menu
