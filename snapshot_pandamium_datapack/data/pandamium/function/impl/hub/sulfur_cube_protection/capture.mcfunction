# arguments: none (runs as and at the sulfur cube)
# remember the block a spawn sulfur cube carries, so players can never permanently change it
data modify entity @s pickup_timer set value 1000000000
data modify entity @s data.spawn_block_checked set value 1b
execute if data entity @s equipment.body run data modify entity @s data.spawn_block set from entity @s equipment.body
execute unless data entity @s equipment.body run data modify entity @s data.spawn_block set value {count:1,id:"minecraft:air"}