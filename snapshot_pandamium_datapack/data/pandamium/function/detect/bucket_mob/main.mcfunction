# arguments: none (runs as the player that right-clicked a sulfur cube)
advancement revoke @s only pandamium:detect/bucket_mob
tag @s add bucketed_spawn_mob
execute at @s[gamemode=creative] anchored eyes positioned ^ ^ ^ as @e[type=marker,distance=..20,predicate=pandamium:in_spawn,tag=saves_bucketable_mob] at @s run tag @s add creative
# the reward function runs as the player, so find the cube that was clicked
execute at @s anchored eyes positioned ^ ^ ^ as @e[type=marker,distance=..20,predicate=pandamium:in_spawn,tag=saves_bucketable_mob] at @s run function pandamium:detect/bucket_mob/as_marker
tag @s remove bucketed_spawn_mob