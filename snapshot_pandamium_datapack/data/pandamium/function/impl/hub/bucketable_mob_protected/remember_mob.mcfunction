# arguments: none
# spawn a marker and remember the mob it represents, so players can never permanently change it
data modify entity @s data.mob_checked set value 1b
execute if entity @s[tag=bucket] run data modify entity @s data.mob_type set value {count:1,id:"minecraft:bucket"}
execute if entity @s[tag=water_bucket] run data modify entity @s data.mob_type set value {count:1,id:"minecraft:water_bucket"}
data modify entity @s data.spawn_mob set from entity @n[type=#pandamium:bucketable]