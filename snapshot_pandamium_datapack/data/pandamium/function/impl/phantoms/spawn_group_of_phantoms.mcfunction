# spawn chance: There is a (x-72000)/x chance of spawning a group of phantoms where x is the time_since_rest statistic (using a scoreboard here)
scoreboard players operation <chance> variable = @s time_since_rest
scoreboard players remove <chance> variable 72000
scoreboard players operation <chance> variable *= #1000 constant
scoreboard players operation <chance> variable /= @s time_since_rest
execute store result score <rng> variable run random value 0..1000
execute unless score <rng> variable <= <chance> variable run return 0
# spawn
# Which mob a player gets is decided by two independent options plus the season:
#   - Flying Eyeballs (only offered during October) turns the phantoms a player would otherwise get
#     into flying eyeballs during October
#   - a carved pumpkin also spawns flying eyeballs, and is only ignored while Phantom Spawning is off
#   - Phantom Spawning off means "no phantoms"; the October flying eyeballs can still spawn
#   - both options off means nothing spawns at all
scoreboard players set <spawn_flying_eyeballs> variable 0
execute if score <month> global matches 10 unless score @s optn.disable_flying_eyeballs matches 1 run scoreboard players set <spawn_flying_eyeballs> variable 1
execute if items entity @s armor.head carved_pumpkin unless score <month> global matches 10 run scoreboard players set <spawn_flying_eyeballs> variable 1
# no phantoms and no flying eyeballs are allowed -> give up (this also blocks the phantom-only case)
execute if score @s optn.disable_phantom_spawning matches 1 unless score <spawn_flying_eyeballs> variable matches 1 run return 0
# spawn
execute store result score <phantoms> variable run random value 1..4
execute if score <phantoms> variable matches 1.. run function pandamium:impl/phantoms/spawn_phantom/main
execute if score <phantoms> variable matches 2.. run function pandamium:impl/phantoms/spawn_phantom/main
execute if score <phantoms> variable matches 3.. run function pandamium:impl/phantoms/spawn_phantom/main
execute if score <phantoms> variable matches 4.. run function pandamium:impl/phantoms/spawn_phantom/main
