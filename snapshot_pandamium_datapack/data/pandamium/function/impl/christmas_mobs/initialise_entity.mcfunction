# Tags. The type tags are added here (and checked by the "fix" functions) so that a mob can never be
# processed by the fix functions more than once.
tag @s add christmas_mob
tag @s add new
tag @s[type=drowned] add drowned
tag @s[type=zombie] add zombie
tag @s[type=stray] add stray
# Bogged wear their mushroom on the head slot, so they have to be sheared before we can put a
# christmas head on them
execute if entity @s[type=bogged] run data modify entity @s sheared set value 1

# Make roughly a third of all christmas mobs "gifting" mobs, which carry a present bundle in their
# offhand and hand it out when they are killed (see pandamium:entities/christmas_mob)
execute store result score <rng> variable run random value 1..3
execute if score <rng> variable matches 1 run tag @s add gifting
loot replace entity @s[tag=gifting] weapon.offhand loot pandamium:items/gift_bundles/random_bundle
execute if entity @s[tag=gifting] run tellraw @a[scores={send_extra_debug_info=2..}] {text:"[Pandamium: Summoned a gifting Christmas Mob]",color:"gray",italic:true}
function pandamium:impl/christmas_mobs/set_head

# Attributes and drops
attribute @s minecraft:scale base set 0.75
attribute @s minecraft:max_health base set 30
data modify entity @s Health set value 30.0f

data modify entity @s drop_chances.head set value 0.0f
data modify entity @s drop_chances.offhand set value 0.0f
data modify entity @s CanPickUpLoot set value 0b

data modify entity @s DeathLootTable set value "pandamium:entities/christmas_mob"

execute at @s run particle minecraft:snowflake ~ ~1 ~ 0.2 0.3 0.2 0 100
loot replace entity @s weapon.mainhand loot pandamium:gameplay/christmas_mob_weapon
