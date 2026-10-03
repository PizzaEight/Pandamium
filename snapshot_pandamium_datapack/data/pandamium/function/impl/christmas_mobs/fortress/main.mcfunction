#
scoreboard players set <christmas_mob_spawned> variable 0
tag @s add christmas_mob_target
data modify storage pandamium:templates macro.entity_type.entity_type set value "minecraft:none"

execute store result score <rng> variable run random value 1..5
execute if score <rng> variable matches 1 run data modify storage pandamium:templates macro.entity_type.entity_type set value "minecraft:wither_skeleton"
execute if score <rng> variable matches 2..5 run tellraw @a[scores={send_extra_debug_info=2..}] {italic:true,color:gray,text:"[Pandamium: RNG Failed to spawn Christmas Mob]"}
execute if score <rng> variable matches 2..5 run scoreboard players set <christmas_mob_spawned> variable -1

scoreboard players set <i> variable 0
execute if score <rng> variable matches 1 run function pandamium:impl/christmas_mobs/fortress/find_valid_spawn_location
execute if score <christmas_mob_spawned> variable matches 0 run tellraw @a[scores={send_extra_debug_info=2..}] {italic:true,color:gray,text:"[Pandamium: Failed to find location to spawn Christmas Mob]"}
tag @s remove christmas_mob_target
#


