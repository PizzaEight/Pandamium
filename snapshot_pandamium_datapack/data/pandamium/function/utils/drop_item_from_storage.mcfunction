# arguments: source (an nbt source pointing at an item stack, e.g. "storage pandamium:temp my_item")
# summons the item stack at the execution position so it falls back out
$execute unless data $(source).id run return 0
summon minecraft:item ~ ~ ~ {Motion:[0,0.35,0],Tags:["pandamium.temp_drop_item"],Item:{id:"minecraft:glass",count:1}}
$execute as @e[type=minecraft:item,tag=pandamium.temp_drop_item,distance=..0.5] run data modify entity @s Item set from $(source)
execute as @e[type=minecraft:item,tag=pandamium.temp_drop_item,distance=..0.5] run tag @s remove pandamium.temp_drop_item
