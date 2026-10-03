function pandamium:impl/attack_indicator/hurt_entity
execute if entity @n[tag=christmas_mob,nbt={HurtTime:10s}] run function pandamium:impl/christmas_mobs/freeze_attack
advancement revoke @s only pandamium:detect/hurt_entity
