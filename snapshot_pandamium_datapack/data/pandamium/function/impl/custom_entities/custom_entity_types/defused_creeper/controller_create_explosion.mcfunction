#> pk_no_cr:mode/proper/controller_create_explosion

# Summon the bomb creeper
summon creeper ~ ~-1.5 ~ {DeathLootTable:"empty",ignited:true,Fuse:0s,Tags:["pandamium.ignore","pandamium.creeper"],Silent:1b}

# A powered creeper is represented by luck's effect being ambient
execute if entity @s[tag=pandamium.powered] run data modify entity @e[type=creeper,tag=pandamium.creeper,distance=..2,limit=1] powered set value 1b
tag @e[type=creeper,tag=pandamium.creeper,distance=..2,limit=1] remove pandamium.creeper
particle minecraft:explosion_emitter ~ ~-1.5 ~
# Store and change mob_griefing
gamerule mob_griefing false
schedule function pandamium:impl/custom_entities/custom_entity_types/defused_creeper/restore_gamerule 2t replace