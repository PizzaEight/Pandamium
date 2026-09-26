execute if score @s jailed matches 1.. run return run tellraw @s [{text:"[Parkour]",color:"dark_red"},{text:" You cannot use this trigger in jail!",color:"red"}]
execute if score @s parkour matches 1.. if score @s parkour.checkpoint matches 0.. run return run function pandamium:triggers/parkour/print_actions_menu
execute if score @s parkour matches 1.. unless score @s parkour matches 2 run return run function pandamium:triggers/parkour/dialog/main_menu
execute if score @s parkour matches 2 run return run function pandamium:triggers/parkour/print_courses_menu
execute if score @s parkour matches -1 if score @s parkour.checkpoint matches 0.. run return run function pandamium:impl/parkour/actions/return_to_last_checkpoint
execute if score @s parkour matches -103 in pandamium:hub positioned -292.5 126.00 150.75 rotated 180 16 run return run function pandamium:utils/teleport/here/from_source {source:"parkour course_3 tp_to_start"}
execute if score @s parkour matches -104 in pandamium:hub positioned -300.5 136 197.0 rotated 0 0 run return run function pandamium:utils/teleport/here/from_source {source:"parkour course_4 tp_to_start"}
execute if score @s parkour matches -105 run return run function pandamium:triggers/parkour/dialog/more_info
# options (only reachable from the parkour dialog, so they reprint the dialog instead of chat)
execute if score @s parkour matches -201 store success score @s hide_parkour_timer unless score @s hide_parkour_timer matches 1
execute if score @s parkour matches -201 run scoreboard players reset @s[scores={hide_parkour_timer=0}] hide_parkour_timer
execute if score @s parkour matches -201 run return run function pandamium:triggers/parkour/dialog/main_menu
execute if score @s parkour matches -202 if score @s parkour.checkpoint matches 0.. run return run dialog show @s {type:"minecraft:notice",title:"Parkour",body:{type:"minecraft:plain_message",contents:"You may not change this option during a run!",width:400},action:{label:"OK",action:{type:"run_command",command:"trigger parkour set 1"}}}
execute if score @s parkour matches -202 store success score @s optn.parkour.restart_on_fall unless score @s optn.parkour.restart_on_fall matches 1
execute if score @s parkour matches -202 run return run function pandamium:triggers/parkour/dialog/main_menu
# else
tellraw @s [{text:"[Parkour]",color:"dark_red"},{text:" That is not a valid option",color:"red"}]
