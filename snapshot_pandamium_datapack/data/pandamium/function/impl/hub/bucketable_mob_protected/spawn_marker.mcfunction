# arguments: none
# spawn a marker and remember the mob it represents, so players can never permanently change it
data modify entity @s data.mob_checked set value 1b
execute if entity @s[type=axolotl] run data modify entity @s data.id set value {id:"minecraft:axolotl"}
execute if entity @s[type=sulfur_cube] run data modify entity @s data.id set value {id:"minecraft:sulfur_cube"}
execute if entity @s[type=cod] run data modify entity @s data.id set value {id:"minecraft:cod"}
execute if entity @s[type=salmon] run data modify entity @s data.id set value {id:"minecraft:salmon"}
execute if entity @s[type=tropical_fish] run data modify entity @s data.id set value {id:"minecraft:tropical_fish"}
execute if entity @s[type=pufferfish] run data modify entity @s data.id set value {id:"minecraft:pufferfish"}
execute if entity @s[type=tadpole] run data modify entity @s data.id set value {id:"minecraft:tadpole"}

execute if entity @s[type=sulfur_cube] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","bucket","sulfur_cube","adult"]}
execute if entity @s[type=axolotl] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","axolotl","adult"]}
execute if entity @s[type=tadpole] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","tadpole","adult"]}
execute if entity @s[type=pufferfish] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","pufferfish","adult"]}
execute if entity @s[type=cod] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","cod","adult"]}
execute if entity @s[type=salmon] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","salmon","adult"]}
execute if entity @s[type=tropical_fish] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","tropical_fish","adult"]}

execute if entity @s[type=sulfur_cube,nbt=!{Age:0}] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","bucket","sulfur_cube","baby"]}
execute if entity @s[type=axolotl,nbt=!{Age:0}] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","axolotl","baby"]}
execute if entity @s[type=tadpole,nbt=!{Age:0}] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","tadpole","baby"]}
execute if entity @s[type=pufferfish,nbt=!{Age:0}] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","pufferfish","baby"]}
execute if entity @s[type=cod,nbt=!{Age:0}] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","cod","baby"]}
execute if entity @s[type=salmon,nbt=!{Age:0}] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","salmon","baby"]}
execute if entity @s[type=tropical_fish,nbt=!{Age:0}] run summon minecraft:marker ~ ~ ~ {Tags:["saves_bucketable_mob","water_bucket","tropical_fish","baby"]}