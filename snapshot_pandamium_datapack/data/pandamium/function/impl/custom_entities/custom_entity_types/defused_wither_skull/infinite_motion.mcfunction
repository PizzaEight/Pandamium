schedule function pandamium:impl/custom_entities/custom_entity_types/defused_wither_skull/infinite_motion 3s
execute as @e[type=snowball,tag=pandamium.wither_skull] at @s run data modify entity @s Motion set from entity @n[type=snowball,tag=pandamium.wither_skull] data.pandamium.motion
