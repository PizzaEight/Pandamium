function pandamium:utils/get/username
scoreboard players operation <id> variable = @s id
tellraw @a[scores={send_extra_debug_info=1..},predicate=!pandamium:matches_id] [{color:"gray",italic:true,text:"["},{color:"gray",storage:"pandamium:temp",nbt:"username",interpret:true},": sethome ",{score:{name:"@s",objective:"sethome"}},"]"]
execute store success score <surface> variable if score @s dialog_surface matches 1
scoreboard players reset @s dialog_surface
function pandamium:triggers/sethome/logic
scoreboard players reset @s sethome
scoreboard players enable @s sethome
