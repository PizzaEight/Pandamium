summon minecraft:marker ~ ~-2 ~20 {Tags:["location_check"]}
summon minecraft:marker ~ ~-2 ~24 {Tags:["location_check"]}
summon minecraft:marker ~ ~-2 ~28 {Tags:["location_check"]}
summon minecraft:marker ~ ~-2 ~32 {Tags:["location_check"]}

summon minecraft:marker ~ ~-2 ~-20 {Tags:["location_check"]}
summon minecraft:marker ~ ~-2 ~-24 {Tags:["location_check"]}
summon minecraft:marker ~ ~-2 ~-28 {Tags:["location_check"]}
summon minecraft:marker ~ ~-2 ~-32 {Tags:["location_check"]}

summon minecraft:marker ~20 ~-2 ~ {Tags:["location_check"]}
summon minecraft:marker ~24 ~-2 ~ {Tags:["location_check"]}
summon minecraft:marker ~28 ~-2 ~ {Tags:["location_check"]}
summon minecraft:marker ~32 ~-2 ~ {Tags:["location_check"]}

summon minecraft:marker ~-20 ~-2 ~ {Tags:["location_check"]}
summon minecraft:marker ~-24 ~-2 ~ {Tags:["location_check"]}
summon minecraft:marker ~-28 ~-2 ~ {Tags:["location_check"]}
summon minecraft:marker ~-32 ~-2 ~ {Tags:["location_check"]}

execute as @e[type=marker,tag=location_check] at @s unless block ~ ~-1 ~ #pandamium:no_solid_collision if block ~ ~ ~ #pandamium:no_solid_collision if block ~ ~1 ~ #pandamium:no_solid_collision run tag @s add can_summon_here
execute as @e[type=marker,tag=location_check,tag=!can_summon_here] at @s run tp ~ ~1 ~
execute as @e[type=marker,tag=location_check] at @s unless block ~ ~-1 ~ #pandamium:no_solid_collision if block ~ ~ ~ #pandamium:no_solid_collision if block ~ ~1 ~ #pandamium:no_solid_collision run tag @s add can_summon_here
execute as @e[type=marker,tag=location_check,tag=!can_summon_here] at @s run tp ~ ~1 ~
execute as @e[type=marker,tag=location_check] at @s unless block ~ ~-1 ~ #pandamium:no_solid_collision if block ~ ~ ~ #pandamium:no_solid_collision if block ~ ~1 ~ #pandamium:no_solid_collision run tag @s add can_summon_here
execute as @e[type=marker,tag=location_check,tag=!can_summon_here] at @s run tp ~ ~1 ~
execute as @e[type=marker,tag=location_check] at @s unless block ~ ~-1 ~ #pandamium:no_solid_collision if block ~ ~ ~ #pandamium:no_solid_collision if block ~ ~1 ~ #pandamium:no_solid_collision run tag @s add can_summon_here
execute as @e[type=marker,tag=location_check,tag=can_summon_here] at @s unless predicate pandamium:in_fortress run tag @s remove can_summon_here
execute as @e[type=marker,tag=location_check,tag=can_summon_here] at @s if block ~ ~-1 ~ lava run tag @s remove can_summon_here
execute as @e[type=marker,tag=location_check,tag=can_summon_here] at @s if predicate pandamium:in_spawn run tag @s remove can_summon_here
kill @e[type=marker,tag=location_check,tag=!can_summon_here]