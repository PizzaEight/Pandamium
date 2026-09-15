#> pk_no_cr:mode/proper/controller_create_explosion

# Summon the bomb creeper
summon creeper ~ ~-0.5 ~ {DeathLootTable:"empty",CustomName:"Ghast",ExplosionRadius:1b,ignited:true,Fuse:0s,Tags:["pandamium.ignore","pandamium.creeper"],Silent:1b}

# Store and change mob_griefing
gamerule mob_griefing false
schedule function pandamium:impl/custom_entities/custom_entity_types/defused_creeper/restore_gamerule 2t replace