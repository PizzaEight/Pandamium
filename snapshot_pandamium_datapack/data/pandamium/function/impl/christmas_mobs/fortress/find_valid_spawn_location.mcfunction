# find location
scoreboard players add <i> variable 1

function pandamium:impl/christmas_mobs/fortress/spawn_location_check_markers
execute positioned as @s unless entity @e[type=marker,tag=location_check,tag=can_summon_here] if score <i> variable matches 0..5 run return run function pandamium:impl/christmas_mobs/fortress/find_valid_spawn_location

execute unless entity @e[type=marker,tag=location_check,tag=can_summon_here] run return 0
tag @e[type=marker,tag=location_check,limit=1,sort=random,tag=can_summon_here] add spawn_christmas_wither_skeleton

# summon mob
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] run function pandamium:utils/get/dimension_id
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] run data modify storage pandamium:templates_2 macro.x__y__z__dimension.dimension set from storage pandamium:temp dimension_string_id
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] run function pandamium:utils/get/position
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] store result storage pandamium:templates_2 macro.x__y__z__dimension.x int 1 run scoreboard players get <x> variable
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] store result storage pandamium:templates_2 macro.x__y__z__dimension.y int 1 run scoreboard players get <y> variable
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] store result storage pandamium:templates_2 macro.x__y__z__dimension.z int 1 run scoreboard players get <z> variable
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] run function pandamium:impl/christmas_mobs/try_summon_naturally/print_debug_message with storage pandamium:templates_2 macro.x__y__z__dimension
scoreboard players set <christmas_mob_spawned> variable 1
execute as @e[type=marker,tag=location_check,tag=spawn_christmas_wither_skeleton] at @s run function pandamium:impl/christmas_mobs/try_summon_naturally/do_summon with storage pandamium:templates macro.entity_type
kill @e[type=marker,tag=location_check]

return 0
