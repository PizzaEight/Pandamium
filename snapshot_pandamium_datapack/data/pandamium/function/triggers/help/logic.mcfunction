execute if score @s help matches -999..-1 run return run tellraw @s [{text:"[Help]",color:"dark_red"},{text:" That is not a valid option!",color:"red"}]
execute if score @s help matches 1 run return run dialog show @s pandamium:trigger_help
execute if score @s help matches 2 run return run dialog show @s pandamium:help/getting_started
execute if score @s help matches 3 run return run dialog show @s pandamium:help/faq
execute if score @s help matches 4 run return run dialog show @s pandamium:help/rules
execute if score @s help matches 5 run return run dialog show @s pandamium:help/commands
execute if score @s help matches 6 run return run dialog show @s pandamium:help/ranks
execute if score @s help matches 7 run return run dialog show @s pandamium:help/vote_rewards
execute if score @s help matches 8 run return run dialog show @s pandamium:help/custom_features
execute if score @s help matches 9 run return run dialog show @s pandamium:help/contact
execute if score @s help matches 13 run return run dialog show @s pandamium:help/commands/how_commands_work
execute if score @s help matches 10 run return run dialog show @s pandamium:help/custom_features/advancements
execute if score @s help matches 11 run return run dialog show @s pandamium:help/custom_features/custom_recipes
execute if score @s help matches 12 run return run dialog show @s pandamium:help/custom_features/mob_heads
execute if score @s help matches 14 run return run dialog show @s pandamium:help/custom_features/mini_blocks
execute if score @s help matches 15 run return run dialog show @s pandamium:help/custom_features/other
execute if score @s help matches 16 run return run dialog show @s pandamium:help/faq/the_end
execute if score @s help matches 17 run return run dialog show @s pandamium:help/faq/towns
execute if score @s help matches 18 run return run dialog show @s pandamium:help/faq/tnt
execute if score @s help matches 19 run return run dialog show @s pandamium:help/faq/mods
execute if score @s help matches 20 run return run dialog show @s pandamium:help/faq/lost_legacy_data
execute if score @s help matches 21 run return run dialog show @s pandamium:help/commands/general
execute if score @s help matches 22 run return run dialog show @s pandamium:help/commands/informational
execute if score @s help matches 23 run return run dialog show @s pandamium:help/commands/supporter
execute at @s if score @s help matches 24 run playsound minecraft:item.book.page_turn ui @s ~ ~ ~ 1 1.2
execute if score @s help matches 24 run return run dialog show @s pandamium:help_guidebook
execute if score @s help matches 25 run return run dialog show @s pandamium:help/supporter
execute if score @s help matches -1000 run return run dialog clear @s

execute if score @s help matches 1000 run tag @s add introduction_screen
execute if score @s help matches 1000 run tag @s remove help_screen
execute if score @s help matches 1000 run tag @s remove options_screen
execute if score @s help matches 1000 run return run dialog show @s pandamium:guide/introduction
execute if score @s help matches 1001 run tag @s add help_screen
execute if score @s help matches 1001 run tag @s remove options_screen
execute if score @s help matches 1001 run tag @s remove introduction_screen
execute if score @s help matches 1001 run return run dialog show @s pandamium:guide/help
execute if score @s help matches 1002 run tag @s add options_screen
execute if score @s help matches 1002 run tag @s remove help_screen
execute if score @s help matches 1002 run tag @s remove introduction_screen
execute if score @s help matches 1002 run return run dialog show @s pandamium:guide/options
tellraw @s [{text:"[Help]",color:"dark_red"},{text:" That is not a valid option!",color:"red"}]
