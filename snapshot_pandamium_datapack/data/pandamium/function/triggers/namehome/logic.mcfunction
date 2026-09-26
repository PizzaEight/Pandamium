scoreboard players operation <home> variable = @s namehome
scoreboard players set <do_rename> variable 0
execute if score <home> variable matches ..-1 store success score <do_rename> variable run scoreboard players operation <home> variable *= #-1 constant
execute if score <surface> variable matches 1 unless score <home> variable matches 1..25 run return run dialog show @s {type:"minecraft:notice",title:"Homes",body:{type:"minecraft:plain_message",contents:"That is not a valid option!",width:400},action:{label:"OK",action:{type:"run_command",command:"trigger homes set 1"}}}
execute unless score <home> variable matches 1..25 run return run tellraw @s [{text:"[Homes]",color:"dark_red"},{text:" That is not a valid option!",color:"red"}]
# restrictions
execute if score <surface> variable matches 1 if score @s jailed matches 1.. run return run dialog show @s {type:"minecraft:notice",title:"Homes",body:{type:"minecraft:plain_message",contents:"You cannot use this trigger in jail!",width:400},action:{label:"OK",action:{type:"run_command",command:"trigger homes set 1"}}}
execute if score @s jailed matches 1.. run return run tellraw @s [{text:"[Homes]",color:"dark_red"},{text:" You cannot use this trigger in jail!",color:"red"}]
execute if score <surface> variable matches 1 if score @s parkour.checkpoint matches 0.. run return run dialog show @s {type:"minecraft:notice",title:"Homes",body:{type:"minecraft:plain_message",contents:"You cannot use this trigger currently!",width:400},action:{label:"OK",action:{type:"run_command",command:"trigger homes set 1"}}}
execute if score @s parkour.checkpoint matches 0.. run return run tellraw @s [{text:"[Homes]",color:"dark_red"},{text:" You cannot use this trigger currently!",color:"red"}]
# run
execute store result storage pandamium:local functions."pandamium:triggers/namehome/*".home int 1 run scoreboard players get <home> variable
execute in pandamium:staff_world run function pandamium:triggers/namehome/try_name with storage pandamium:local functions."pandamium:triggers/namehome/*"
