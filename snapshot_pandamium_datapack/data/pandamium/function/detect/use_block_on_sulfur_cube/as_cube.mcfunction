# arguments: none (runs as and at the sulfur cube that was right-clicked)
# a cube only reverts once we know which block it is meant to carry
execute unless data entity @s data.spawn_block_checked run tag @s remove creative
execute unless data entity @s data.spawn_block_checked run return 0
# did the block it carries change? a data modify "set from" only counts the tags it actually changed
data modify storage pandamium:temp sulfur_cube_expected set from entity @s data.spawn_block
data modify storage pandamium:temp sulfur_cube_current set from entity @s equipment.body
data modify storage pandamium:temp sulfur_cube_compare set from entity @s data.spawn_block
execute store result score <different> variable run data modify storage pandamium:temp sulfur_cube_compare set from entity @s equipment.body
execute unless score <different> variable matches 1 run tag @s remove creative
execute unless score <different> variable matches 1 run return 0
# the block the cube used to carry gets popped out when it is replaced; if it is lying right here, take it back out
data modify storage pandamium:templates macro.sulfur_cube_original.id set string storage pandamium:temp sulfur_cube_expected.id
execute if data storage pandamium:templates macro.sulfur_cube_original.id run function pandamium:detect/use_block_on_sulfur_cube/remove_ejected_block with storage pandamium:templates macro.sulfur_cube_original
# put the block the cube is meant to carry back into it
execute if data entity @s data.spawn_block run data modify entity @s equipment.body set from entity @s data.spawn_block
execute unless data entity @s data.spawn_block run data remove entity @s equipment.body
# let the block that was put in fall back out
execute if data storage pandamium:temp sulfur_cube_current.id run data modify storage pandamium:temp sulfur_cube_current.count set value 1
execute unless entity @s[tag=creative] run function pandamium:utils/drop_item_from_storage {source:"storage pandamium:temp sulfur_cube_current"}
tag @s remove creative
