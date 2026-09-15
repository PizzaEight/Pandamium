scoreboard players operation <home> variable = @s delhome
execute unless score <home> variable matches 1..25 run tellraw @s [{text:"[Homes]",color:"dark_red"},{text:" That is not a valid option!",color:"red"}]
execute unless score <home> variable matches 1..25 run return 0
# restrictions
execute if score <surface> variable matches 1 if score @s jailed matches 1.. run dialog show @s {type:"minecraft:notice",title:"Homes",body:{type:"minecraft:plain_message",contents:"You cannot use this trigger in jail!",width:400}}
execute if score <surface> variable matches 0 if score @s jailed matches 1.. run tellraw @s [{text:"[Homes]",color:"dark_red"},{text:" You cannot use this trigger in jail!",color:"red"}]
execute if score @s jailed matches 1.. run return 0
execute if score <surface> variable matches 1 if score @s parkour.checkpoint matches 0.. run dialog show @s {type:"minecraft:notice",title:"Homes",body:{type:"minecraft:plain_message",contents:"You cannot use this trigger currently!",width:400}}
execute if score <surface> variable matches 0 if score @s parkour.checkpoint matches 0.. run tellraw @s [{text:"[Homes]",color:"dark_red"},{text:" You cannot use this trigger currently!",color:"red"}]
execute if score @s parkour.checkpoint matches 0.. run return 0
# run
execute store result storage pandamium:templates macro.home__id.home int 1 run scoreboard players get <home> variable
execute store result storage pandamium:templates macro.home__id.id int 1 run scoreboard players get @s id
function pandamium:triggers/delhome/delete_own_home/try_delete with storage pandamium:templates macro.home__id
