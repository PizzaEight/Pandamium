#> **Builds a "Your Info" dialog with the player's playtime, votes, and stats.**
#
#> **Triggered** **by** **the** **Your** **Info** **button** **in** **the** **Pandamium** **menu**
#> **(trigger** **options** **set** **-100006).**

# --- Load self's player data (for homes count) ---

function pandamium:utils/database/players/load/self

# --- Build dialog ---

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog set value {"type":"minecraft:multi_action","title":"Your Statistics","pause":false,"after_action":"none","body":[],"columns":1,"actions":[{"label":"Show Days: Off","action":{"type":"minecraft:run_command","command":"trigger options set -100007"}}],"exit_action":{"label":"Done","action":{"type":"minecraft:show_dialog","dialog":"pandamium:options"}}}

# ============================================================

# VOTES

# ============================================================

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body append value {"type":"minecraft:plain_message","contents":[],"width":500}

execute store result storage pandamium:temp str_votes int 1 run scoreboard players get @s votes

data modify storage pandamium:temp str_votes set string storage pandamium:temp str_votes

execute store result storage pandamium:temp str_monthly_votes int 1 run scoreboard players get @s monthly_votes

data modify storage pandamium:temp str_monthly_votes set string storage pandamium:temp str_monthly_votes

execute store result storage pandamium:temp str_yearly_votes int 1 run scoreboard players get @s yearly_votes

data modify storage pandamium:temp str_yearly_votes set string storage pandamium:temp str_yearly_votes

execute store result storage pandamium:temp str_reward_credits int 1 run scoreboard players get @s reward_credits

data modify storage pandamium:temp str_reward_credits set string storage pandamium:temp str_reward_credits

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"green","bold":false}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"Votes","color":"dark_green","bold":true}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\n\nVotes All Time: ","color":"dark_green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nVotes This Month: ","color":"dark_green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nVotes This Year: ","color":"dark_green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nReward Credits: ","color":"dark_green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"green"}

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[3] set from storage pandamium:temp str_votes

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[5] set from storage pandamium:temp str_monthly_votes

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[7] set from storage pandamium:temp str_yearly_votes

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[9] set from storage pandamium:temp str_reward_credits


# --- Last join date ---

execute store result score <datetime_id> variable run scoreboard players get @s last_joined.datetime

function pandamium:utils/datetime/decompose_datetime_id

execute store result storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".month int 1 run scoreboard players get <month> variable

function pandamium:utils/get/month_name with storage pandamium:local functions."pandamium:triggers/playtime/dialog/*"

data modify storage pandamium:temp month_name set string storage pandamium:temp month_name 0 3

function pandamium:utils/datetime/get_datetime_text {args:_}

execute store result storage pandamium:temp str_year int 1 run scoreboard players get <year> variable

data modify storage pandamium:temp str_year set string storage pandamium:temp str_year

# ============================================================

# PLAYTIME

# ============================================================

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body append value {"type":"minecraft:plain_message","contents":[{"text":"","color":"aqua","bold":false},{"text":"Playtime\n\n","color":"blue","bold":true},{"text":"Last Join Date: ","color":"blue"},{"text":"","color":"aqua"},{"text":" ","color":"gray"},{"text":"","color":"aqua"}],"width":500}

# --- Insert last join date ---

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[3] set from storage pandamium:temp month_name

data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[5] set from storage pandamium:temp str_year

# --- Total playtime ---

scoreboard players operation <ticks> variable = @s playtime_ticks

execute unless score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_without_days

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_playtime_hours int 1 run data get storage pandamium:temp time[3]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_playtime_hours set string storage pandamium:temp str_playtime_hours

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_playtime_minutes int 1 run data get storage pandamium:temp time[2]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_playtime_minutes set string storage pandamium:temp str_playtime_minutes

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_playtime_seconds int 1 run data get storage pandamium:temp time[1]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_playtime_seconds set string storage pandamium:temp str_playtime_seconds

execute if score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_with_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_playtime_days int 1 run data get storage pandamium:temp time[4]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_playtime_days set string storage pandamium:temp str_playtime_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_playtime_hours int 1 run data get storage pandamium:temp time[3]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_playtime_hours set string storage pandamium:temp str_playtime_hours

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_playtime_minutes int 1 run data get storage pandamium:temp time[2]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_playtime_minutes set string storage pandamium:temp str_playtime_minutes

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_playtime_seconds int 1 run data get storage pandamium:temp time[1]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_playtime_seconds set string storage pandamium:temp str_playtime_seconds

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nTotal Playtime: ","color":"blue"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[7] set from storage pandamium:temp str_playtime_hours

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[9] set from storage pandamium:temp str_playtime_minutes

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[11] set from storage pandamium:temp str_playtime_seconds

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nTotal Playtime: ","color":"blue"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" day(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[7] set from storage pandamium:temp str_playtime_days

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[9] set from storage pandamium:temp str_playtime_hours

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[11] set from storage pandamium:temp str_playtime_minutes

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[13] set from storage pandamium:temp str_playtime_seconds

# --- Monthly playtime ---

scoreboard players operation <ticks> variable = @s monthly_playtime_ticks

execute unless score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_without_days

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_monthly_hours int 1 run data get storage pandamium:temp time[3]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_monthly_hours set string storage pandamium:temp str_monthly_hours

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_monthly_minutes int 1 run data get storage pandamium:temp time[2]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_monthly_minutes set string storage pandamium:temp str_monthly_minutes

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_monthly_seconds int 1 run data get storage pandamium:temp time[1]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_monthly_seconds set string storage pandamium:temp str_monthly_seconds

execute if score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_with_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_monthly_days int 1 run data get storage pandamium:temp time[4]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_monthly_days set string storage pandamium:temp str_monthly_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_monthly_hours int 1 run data get storage pandamium:temp time[3]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_monthly_hours set string storage pandamium:temp str_monthly_hours

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_monthly_minutes int 1 run data get storage pandamium:temp time[2]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_monthly_minutes set string storage pandamium:temp str_monthly_minutes

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_monthly_seconds int 1 run data get storage pandamium:temp time[1]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_monthly_seconds set string storage pandamium:temp str_monthly_seconds

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nPlaytime This Month: ","color":"blue"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[14] set from storage pandamium:temp str_monthly_hours

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[16] set from storage pandamium:temp str_monthly_minutes

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[18] set from storage pandamium:temp str_monthly_seconds

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nPlaytime This Month: ","color":"blue"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" day(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[16] set from storage pandamium:temp str_monthly_days

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[18] set from storage pandamium:temp str_monthly_hours

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[20] set from storage pandamium:temp str_monthly_minutes

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[22] set from storage pandamium:temp str_monthly_seconds

# --- Yearly playtime ---

scoreboard players operation <ticks> variable = @s yearly_playtime_ticks

execute unless score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_without_days

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_yearly_hours int 1 run data get storage pandamium:temp time[3]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_yearly_hours set string storage pandamium:temp str_yearly_hours

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_yearly_minutes int 1 run data get storage pandamium:temp time[2]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_yearly_minutes set string storage pandamium:temp str_yearly_minutes

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_yearly_seconds int 1 run data get storage pandamium:temp time[1]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_yearly_seconds set string storage pandamium:temp str_yearly_seconds

execute if score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_with_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_yearly_days int 1 run data get storage pandamium:temp time[4]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_yearly_days set string storage pandamium:temp str_yearly_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_yearly_hours int 1 run data get storage pandamium:temp time[3]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_yearly_hours set string storage pandamium:temp str_yearly_hours

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_yearly_minutes int 1 run data get storage pandamium:temp time[2]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_yearly_minutes set string storage pandamium:temp str_yearly_minutes

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_yearly_seconds int 1 run data get storage pandamium:temp time[1]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_yearly_seconds set string storage pandamium:temp str_yearly_seconds

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nPlaytime This Year: ","color":"blue"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[21] set from storage pandamium:temp str_yearly_hours

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[23] set from storage pandamium:temp str_yearly_minutes

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[25] set from storage pandamium:temp str_yearly_seconds

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nPlaytime This Year: ","color":"blue"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" day(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[25] set from storage pandamium:temp str_yearly_days

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[27] set from storage pandamium:temp str_yearly_hours

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[29] set from storage pandamium:temp str_yearly_minutes

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[31] set from storage pandamium:temp str_yearly_seconds

# --- Session length ---

scoreboard players operation <ticks> variable = @s online_ticks

execute unless score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_without_days

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_online_hours int 1 run data get storage pandamium:temp time[3]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_online_hours set string storage pandamium:temp str_online_hours

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_online_minutes int 1 run data get storage pandamium:temp time[2]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_online_minutes set string storage pandamium:temp str_online_minutes

execute unless score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_online_seconds int 1 run data get storage pandamium:temp time[1]

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_online_seconds set string storage pandamium:temp str_online_seconds

execute if score @s show_playtime_days matches 1 run function pandamium:utils/get/time_from_ticks_with_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_online_days int 1 run data get storage pandamium:temp time[4]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_online_days set string storage pandamium:temp str_online_days

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_online_hours int 1 run data get storage pandamium:temp time[3]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_online_hours set string storage pandamium:temp str_online_hours

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_online_minutes int 1 run data get storage pandamium:temp time[2]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_online_minutes set string storage pandamium:temp str_online_minutes

execute if score @s show_playtime_days matches 1 run execute store result storage pandamium:temp str_online_seconds int 1 run data get storage pandamium:temp time[1]

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:temp str_online_seconds set string storage pandamium:temp str_online_seconds

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nSession Length: ","color":"blue"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[28] set from storage pandamium:temp str_online_hours

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[30] set from storage pandamium:temp str_online_minutes

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[32] set from storage pandamium:temp str_online_seconds

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"\nSession Length: ","color":"blue"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" day(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" hour(s), ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" min(s) and ","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":"","color":"aqua"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents append value {"text":" sec(s)","color":"gray"}

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[34] set from storage pandamium:temp str_online_days

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[36] set from storage pandamium:temp str_online_hours

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[38] set from storage pandamium:temp str_online_minutes

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.body[-1].contents[40] set from storage pandamium:temp str_online_seconds

# ============================================================

# SHOW DAYS TOGGLE

# ============================================================

execute if score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.actions[0].label set value {"text":"Show Days: On","color":"aqua"}

execute unless score @s show_playtime_days matches 1 run data modify storage pandamium:local functions."pandamium:triggers/playtime/dialog/*".dialog.actions[0].label set value {"text":"Show Days: Off","color":"aqua"}

# --- Show dialog ---

function pandamium:utils/show_dialog with storage pandamium:local functions."pandamium:triggers/playtime/dialog/*"