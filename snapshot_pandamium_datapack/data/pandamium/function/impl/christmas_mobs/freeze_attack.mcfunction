#> Called with the attacker as the executor from pandamium:detect/hurt_entity whenever a player hits an
# entity. If that entity turns out to be a christmas mob (tag added by
# pandamium:impl/christmas_mobs/initialise_entity), the mob freezes the attacker with a burst of
# snowflakes, a freeze sound effect and a short slowness effect.
execute if entity @n[tag=christmas_mob,nbt={HurtTime:10s}] run advancement revoke @s only pandamium:detect/hurt_entity
execute at @n[tag=christmas_mob,nbt={HurtTime:10s}] run particle minecraft:snowflake ~ ~1.75 ~ 0.2 0.15 0.2 0 20
execute at @n[tag=christmas_mob,nbt={HurtTime:10s}] run playsound minecraft:entity.player.hurt_freeze hostile @a[distance=0..5] ~ ~ ~ 1 1
execute at @n[tag=christmas_mob,nbt={HurtTime:10s}] run effect give @a[distance=0..5] slowness 2 2
