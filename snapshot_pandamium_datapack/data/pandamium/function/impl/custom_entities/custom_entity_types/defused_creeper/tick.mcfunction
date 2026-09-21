execute on vehicle if entity @s[nbt={powered:1b}] on passengers run tag @s add pandamium.powered 
execute on vehicle if entity @s[nbt={Health:0f}] run return run execute on passengers run kill @s[type=marker,tag=pandamium.ticking]
execute on vehicle at @s[type=creeper,tag=pandamium.defused] run return fail
execute unless predicate pandamium:in_spawn if entity @a[predicate=!pandamium:player/any_invisible_staff_state,gamemode=!spectator,distance=..32] run function pandamium:impl/custom_entities/custom_entity_types/defused_creeper/controller_create_explosion
kill @s