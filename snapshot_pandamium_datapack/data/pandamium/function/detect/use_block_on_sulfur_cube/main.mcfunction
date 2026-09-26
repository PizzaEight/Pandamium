# arguments: none (runs as the player that right-clicked a sulfur cube)
advancement revoke @s only pandamium:detect/use_block_on_sulfur_cube
execute at @s[gamemode=creative] anchored eyes positioned ^ ^ ^ as @e[type=minecraft:sulfur_cube,distance=..20,predicate=pandamium:in_spawn] at @s run tag @s add creative
# the reward function runs as the player, so find the cube that was clicked
execute at @s anchored eyes positioned ^ ^ ^ as @e[type=minecraft:sulfur_cube,distance=..20,predicate=pandamium:in_spawn] at @s run function pandamium:detect/use_block_on_sulfur_cube/as_cube