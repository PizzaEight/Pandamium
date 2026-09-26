# arguments: none (runs as and at the marker that had its mob right-clicked)
execute unless data entity @s data.mob_checked run tag @s remove creative
execute unless data entity @s data.mob_checked run return 0
# did the mob get removed? a data modify "set from" only counts the tags it actually changed
data modify storage pandamium:temp bucketed_mob set from entity @s data.spawn_mob
data modify storage pandamium:temp bucket_item set from entity @s data.mob_type
execute if entity @n[type=#pandamium:bucketable,distance=..0.1,tag=spawn_protected] run tag @s remove creative
execute if entity @n[type=#pandamium:bucketable,distance=..0.1,tag=spawn_protected] run return 0
# the block the cube used to carry gets popped out when it is replaced; if it is lying right here, take it back out

# spawn mob
data modify storage pandamium:temp summon.id set from storage pandamium:temp bucketed_mob.data.id.id
data modify storage pandamium:temp summon.data set from storage pandamium:temp bucketed_mob
function pandamium:detect/bucket_mob/spawn_mob_back with storage pandamium:temp summon

# let the block that was put in fall back out
data modify storage pandamium:temp bucket_item.count set value 1
execute unless entity @s[tag=creative] run function pandamium:utils/drop_item_from_storage {source:"storage pandamium:temp bucket_item"}
tag @s remove creative
execute if entity @s[tag=axolotl] run clear @a[tag=bucketed_spawn_mob] axolotl_bucket[minecraft:bucket_entity_data~{NoAI:1b}]
execute if entity @s[tag=tadpole] run clear @a[tag=bucketed_spawn_mob] tadpole_bucket[minecraft:bucket_entity_data~{NoAI:1b}]
execute if entity @s[tag=pufferfish] run clear @a[tag=bucketed_spawn_mob] pufferfish_bucket[minecraft:bucket_entity_data~{NoAI:1b}]
execute if entity @s[tag=cod] run clear @a[tag=bucketed_spawn_mob] cod_bucket[minecraft:bucket_entity_data~{NoAI:1b}]
execute if entity @s[tag=salmon] run clear @a[tag=bucketed_spawn_mob] salmon_bucket[minecraft:bucket_entity_data~{NoAI:1b}]
execute if entity @s[tag=tropical_fish] run clear @a[tag=bucketed_spawn_mob] tropical_fish_bucket[minecraft:bucket_entity_data~{NoAI:1b}]
execute if entity @s[tag=sulfur_cube] run clear @a[tag=bucketed_spawn_mob] sulfur_cube_bucket[minecraft:bucket_entity_data~{NoAI:1b}]
execute as @e[type=item] if data entity @s Item.components."minecraft:bucket_entity_data".NoAI run tag @s add no_ai_bucket
kill @e[type=item,tag=no_ai_bucket]
