tag @s add zombie

function pandamium:impl/christmas_mobs/set_head

attribute @s minecraft:scale base set 0.75
attribute @s minecraft:max_health base set 30
data modify entity @s Health set value 30.0f

data modify entity @s drop_chances.head set value 0.0f
data modify entity @s drop_chances.offhand set value 0.0f
data modify entity @s CanPickUpLoot set value 0b

data modify entity @s DeathLootTable set value "pandamium:entities/christmas_mob"

execute at @s run particle minecraft:snowflake ~ ~1 ~ 0.2 0.3 0.2 0 100
execute at @s run playsound minecraft:entity.player.hurt_freeze hostile @a[distance=0..12] ~ ~ ~ 1 0.6
