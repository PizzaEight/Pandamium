#> pk_no_cr:mode/proper/controller_create_explosion

# Summon the bomb creeper
execute as @n[type=snowball,tag=!pandamium.fixing_motion_1,tag=!pandamium.fixing_motion_2,tag=!pandamium.fixing_motion_3,distance=0..4,tag=pandamium.wither_skull] run data modify storage pandamium:temp motion_1 set from entity @s Motion
tag @n[type=snowball,tag=!pandamium.fixing_motion_1,tag=!pandamium.fixing_motion_2,tag=!pandamium.fixing_motion_3,distance=0..4,tag=pandamium.wither_skull] add pandamium.fixing_motion_1
schedule function pandamium:impl/custom_entities/custom_entity_types/defused_wither_skull/keep_motion_1 2t append
execute as @n[type=snowball,tag=!pandamium.fixing_motion_1,tag=!pandamium.fixing_motion_2,tag=!pandamium.fixing_motion_3,distance=0..4,tag=pandamium.wither_skull] run data modify storage pandamium:temp motion_2 set from entity @s Motion
tag @n[type=snowball,tag=!pandamium.fixing_motion_1,tag=!pandamium.fixing_motion_2,tag=!pandamium.fixing_motion_3,distance=0..4,tag=pandamium.wither_skull] add pandamium.fixing_motion_2
schedule function pandamium:impl/custom_entities/custom_entity_types/defused_wither_skull/keep_motion_2 2t append
execute as @n[type=snowball,tag=!pandamium.fixing_motion_1,tag=!pandamium.fixing_motion_2,tag=!pandamium.fixing_motion_3,distance=0..4,tag=pandamium.wither_skull] run data modify storage pandamium:temp motion_3 set from entity @s Motion
tag @n[type=snowball,tag=!pandamium.fixing_motion_1,tag=!pandamium.fixing_motion_2,tag=!pandamium.fixing_motion_3,distance=0..4,tag=pandamium.wither_skull] add pandamium.fixing_motion_3
schedule function pandamium:impl/custom_entities/custom_entity_types/defused_wither_skull/keep_motion_3 2t append

summon creeper ~ ~-0.5 ~ {DeathLootTable:"empty",CustomName:"a skull from Wither",ignited:true,Fuse:0s,Tags:["pandamium.ignore","pandamium.wither_skull"],Silent:1b,ExplosionRadius:1b,Team:"wither_skull"}
execute if block ~ ~ ~ #pandamium:no_solid_collision positioned ~ ~-1.5 ~ as @p[gamemode=!creative,gamemode=!spectator,distance=0..1.5] run damage @s 10 minecraft:wither_skull by @n[type=wither]
execute if block ~ ~ ~ #pandamium:no_solid_collision positioned ~ ~-1.5 ~ as @n[type=!player,type=!wither,tag=!pandamium.wither_skull,distance=0..2,type=!item_display] run damage @s 10 minecraft:wither_skull by @n[type=wither]
execute if block ~ ~ ~ #pandamium:no_solid_collision positioned ~ ~-1.5 ~ as @p[gamemode=!creative,gamemode=!spectator,distance=0..1.5] run effect give @s minecraft:wither 40 1
execute if block ~ ~ ~ #pandamium:no_solid_collision positioned ~ ~-1.5 ~ as @n[type=!player,type=!wither_skeleton,type=!wither,tag=!pandamium.wither_skull,distance=0..2,type=!item_display] run effect give @s minecraft:wither 40 1
playsound minecraft:entity.generic.explode hostile @a[distance=0..32] ~ ~ ~ 2 0.7
# Store and change mob_griefing
gamerule mob_griefing false
schedule function pandamium:impl/custom_entities/custom_entity_types/defused_creeper/restore_gamerule 2t replace