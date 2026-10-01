#> Christmas mob spawning loop.
# Runs on a random timer (see pandamium:impl/christmas_mobs/schedule_next_attempt) all year round, but
# it only spawns anything during December and only if christmas mobs have not been disabled
# server-wide (see the "Christmas Mobs" server option). Players can also opt out of christmas mobs
# themselves with the "Christmas Mobs" gameplay option.
# Reschedule (25s, +/- a bit, so that the work is spread out over multiple ticks)
execute store result storage pandamium:templates macro.value.value int 1 run random value 1200..1400
function pandamium:impl/christmas_mobs/schedule_next_attempt with storage pandamium:templates macro.value
execute unless score <month> global matches 12 run return 0
execute if score <disable_christmas_mobs> global matches 1 run return 0

# Christmas mobs that were not spawned by us (for example ones that got converted by the vanilla
# spawner) still deserve their christmas looks. The type tags added by initialise_entity make sure
# that a mob can only ever be fixed once.
execute as @e[tag=new,tag=christmas_mob,type=minecraft:drowned] unless entity @s[tag=drowned] run function pandamium:impl/christmas_mobs/fix_christmas_drowned
execute as @e[tag=new,tag=christmas_mob,type=minecraft:zombie] unless entity @s[tag=zombie] run function pandamium:impl/christmas_mobs/fix_christmas_zombie
execute as @e[tag=new,tag=christmas_mob,type=minecraft:stray] unless entity @s[tag=stray] run function pandamium:impl/christmas_mobs/fix_christmas_stray

# Overworld spawns, at night only, for players who have not opted out of christmas mobs
execute in minecraft:overworld if predicate pandamium:environment/is_night as @a[scores={idle.time=..1},gamemode=!spectator,predicate=!pandamium:in_spawn,predicate=pandamium:in_dimension/overworld,predicate=!pandamium:player/is_hidden] at @s unless score @s optn.disable_christmas_mobs matches 1 run function pandamium:impl/christmas_mobs/try_summon_naturally/main

# Nether fortresses are dark enough for christmas wither skeletons at any time of day, so one random
# player in a fortress gets a chance every attempt
execute as @a[scores={idle.time=..1},gamemode=!spectator,predicate=!pandamium:in_spawn,predicate=pandamium:in_fortress,limit=1,sort=random,predicate=!pandamium:player/is_hidden] at @s unless score @s optn.disable_christmas_mobs matches 1 run function pandamium:impl/christmas_mobs/fortress/main