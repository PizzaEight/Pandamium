# get inputs
execute store result score <disable_tpa_requests> variable run scoreboard players operation @s options /= #-10 constant
scoreboard players operation <disable_tpa_requests> variable %= #10 constant
execute unless score <disable_tpa_requests> variable matches 0..2 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
execute store result score <disable_receiving_mail> variable run scoreboard players operation @s options /= #10 constant
scoreboard players operation <disable_receiving_mail> variable %= #10 constant
execute unless score <disable_receiving_mail> variable matches 0..2 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
execute store result score <hide_coordinates> variable run scoreboard players operation @s options /= #10 constant
scoreboard players operation <hide_coordinates> variable %= #10 constant
execute unless score <hide_coordinates> variable matches 0..1 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
execute store result score <hide_trophy_suffix> variable run scoreboard players operation @s options /= #10 constant
scoreboard players operation <hide_trophy_suffix> variable %= #10 constant
execute unless score <hide_trophy_suffix> variable matches 0..1 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
execute store result score <hide_voting_announcements> variable run scoreboard players operation @s options /= #10 constant
scoreboard players operation <hide_voting_announcements> variable %= #10 constant
execute unless score <hide_voting_announcements> variable matches 0..1 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
execute store result score <disable_donator_prefix> variable run scoreboard players operation @s options /= #10 constant
scoreboard players operation <disable_donator_prefix> variable %= #10 constant
execute if predicate pandamium:player/can_display_supporter_rank run execute unless score <disable_donator_prefix> variable matches 0..1 run return run tellraw @s [{color:"dark_red",text:"[Options]"},{color:"red",text:" An error occurred whilst saving your options!"}]
# apply options
execute if score <disable_tpa_requests> variable matches 0 run scoreboard players reset @s disable_tpa_requests
execute if score <disable_tpa_requests> variable matches 1 run scoreboard players set @s disable_tpa_requests 1
execute if score <disable_tpa_requests> variable matches 2 run scoreboard players set @s disable_tpa_requests 2
execute if score <disable_receiving_mail> variable matches 0 run scoreboard players reset @s optn.disable_receiving_mail
execute if score <disable_receiving_mail> variable matches 1 run scoreboard players set @s optn.disable_receiving_mail 1
execute if score <disable_receiving_mail> variable matches 2 run scoreboard players set @s optn.disable_receiving_mail 2
execute if score <hide_coordinates> variable matches 0 run scoreboard players reset @s hide_coordinates
execute if score <hide_coordinates> variable matches 1 run scoreboard players set @s hide_coordinates 1
execute if score <hide_trophy_suffix> variable matches 0 run scoreboard players reset @s hide_trophy_suffix
execute if score <hide_trophy_suffix> variable matches 1 run scoreboard players set @s hide_trophy_suffix 1
execute if score <hide_voting_announcements> variable matches 0 run scoreboard players reset @s hide_voting_announcements
execute if score <hide_voting_announcements> variable matches 1 run scoreboard players set @s hide_voting_announcements 1
execute if predicate pandamium:player/can_display_supporter_rank if score <disable_donator_prefix> variable matches 0 run scoreboard players reset @s disable_donator_prefix
execute if predicate pandamium:player/can_display_supporter_rank if score <disable_donator_prefix> variable matches 1 run scoreboard players set @s disable_donator_prefix 1
# update name visuals
function pandamium:player/teams/update_suffix
function pandamium:player/teams/update_base
# return to the dialog-based options menu
function pandamium:triggers/options/dialog/main_menu
