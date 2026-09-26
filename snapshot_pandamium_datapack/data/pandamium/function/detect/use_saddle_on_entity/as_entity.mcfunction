# arguments: none (runs as and at the mob that was right-clicked)
# only act on mobs that are wearing a saddle now, so right-clicking a mob that cannot be
# saddled does nothing
execute unless data entity @s equipment.saddle run tag @s remove creative
execute unless data entity @s equipment.saddle run return 0
# take the saddle off and let it fall out
data remove storage pandamium:temp saddle_eject
data modify storage pandamium:temp saddle_eject set from entity @s equipment.saddle
data remove entity @s equipment.saddle
execute unless entity @s[tag=creative] run function pandamium:utils/drop_item_from_storage {source:"storage pandamium:temp saddle_eject"}
tag @s remove creative
