scoreboard players add @s variable 1 
execute as @s[scores={variable=160..}] on vehicle run kill @s
execute as @s[scores={variable=160..}] run tag @s add pandamium.remove
execute if predicate pandamium:in_water on vehicle run kill @s
execute if predicate pandamium:in_lava on vehicle run kill @s
execute on vehicle as @s[type=snowball,tag=pandamium.defused] run return fail
execute unless predicate pandamium:in_spawn unless entity @s[tag=pandamium.remove] run function pandamium:impl/custom_entities/custom_entity_types/defused_wither_skull/controller_create_explosion
kill @s