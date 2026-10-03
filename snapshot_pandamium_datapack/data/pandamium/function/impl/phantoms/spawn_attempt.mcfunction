# Phantoms (and the flying eyeballs that can replace them, see spawn_group_of_phantoms) spawn in the
# overworld at night, above players who have not slept recently
execute in minecraft:overworld if predicate pandamium:environment/can_spawn_phantoms as @a[predicate=!pandamium:in_spawn,gamemode=!creative,predicate=pandamium:player/can_spawn_phantoms,predicate=!pandamium:player/is_hidden] positioned as @s run function pandamium:impl/phantoms/spawn_group_of_phantoms
execute store result storage pandamium:templates macro.value.value int 1 run random value 1200..2400
function pandamium:impl/phantoms/schedule_next_attempt with storage pandamium:templates macro.value
