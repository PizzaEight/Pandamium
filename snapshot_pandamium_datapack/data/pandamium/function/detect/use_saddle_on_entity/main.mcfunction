# arguments: none (runs as the player that right-clicked a mob with a saddle)
advancement revoke @s only pandamium:detect/use_saddle_on_entity
execute at @s[gamemode=creative] anchored eyes positioned ^ ^ ^ as @e[type=!player,distance=..20,predicate=pandamium:in_spawn] at @s run tag @s add creative
# the reward function runs as the player, so find the mob that was clicked
execute at @s anchored eyes positioned ^ ^ ^ as @e[type=!player,distance=..20,predicate=pandamium:in_spawn] at @s run function pandamium:detect/use_saddle_on_entity/as_entity
title @s actionbar {text:"You cannot saddle a mob at spawn",color:red}