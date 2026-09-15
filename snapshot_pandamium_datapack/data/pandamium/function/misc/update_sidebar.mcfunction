# The sidebar is only shown while a server restart is pending.
# (Other information previously shown here has moved to /trigger world_info.)

# Hide the sidebar entirely when no restart is scheduled
execute unless score <seconds_until_restart> global matches 1.. run scoreboard players reset * sidebar
execute unless score <seconds_until_restart> global matches 1.. run return run scoreboard objectives setdisplay sidebar

# Restart countdown
execute unless score <disable_force_sidebar> global matches 1 run scoreboard objectives setdisplay sidebar sidebar
execute store result score <sidebar_minutes> variable run scoreboard players operation <sidebar_seconds> variable = <seconds_until_restart> global
scoreboard players operation <sidebar_seconds> variable %= #seconds_per_minute constant
scoreboard players operation <sidebar_minutes> variable /= #seconds_per_minute constant
execute if score <sidebar_minutes> variable matches 0 run scoreboard players display name <sidebar.restart_countdown> sidebar [{color:"red",font:"minecraft:uniform",text:"Restart in "},[{bold:true,color:"dark_red",score:{name:"<sidebar_seconds>",objective:"variable"}}," seconds"]]
execute if score <sidebar_minutes> variable matches 1.. if score <sidebar_seconds> variable matches 0..9 run scoreboard players display name <sidebar.restart_countdown> sidebar [{color:"red",font:"minecraft:uniform",text:"Restart in "},[{bold:true,color:"dark_red",score:{name:"<sidebar_minutes>",objective:"variable"}},":0",{score:{name:"<sidebar_seconds>",objective:"variable"}}]]
execute if score <sidebar_minutes> variable matches 1.. if score <sidebar_seconds> variable matches 10.. run scoreboard players display name <sidebar.restart_countdown> sidebar [{color:"red",font:"minecraft:uniform",text:"Restart in "},[{bold:true,color:"dark_red",score:{name:"<sidebar_minutes>",objective:"variable"}},":",{score:{name:"<sidebar_seconds>",objective:"variable"}}]]
scoreboard players display numberformat <sidebar.restart_countdown> sidebar fixed ""
scoreboard players set <sidebar.restart_countdown> sidebar -2147483648
