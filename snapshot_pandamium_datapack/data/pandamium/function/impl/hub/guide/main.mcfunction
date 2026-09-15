# sound fx
execute anchored eyes run playsound minecraft:entity.villager.yes neutral @a[distance=..16] ^ ^ ^2
swing @s mainhand whack
# show the help dialog
execute if entity @s[tag=!help_screen,tag=!options_screen] run function pandamium:utils/show_dialog {dialog:"pandamium:guide/introduction"}
execute if entity @s[tag=help_screen] run function pandamium:utils/show_dialog {dialog:"pandamium:guide/help"}
execute if entity @s[tag=options_screen] run function pandamium:utils/show_dialog {dialog:"pandamium:guide/options"}
# reset advancement
advancement revoke @s only pandamium:detect/hub/interact_with_guide