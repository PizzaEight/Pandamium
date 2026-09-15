#> Formats a parkour time as a list of PLAIN STRING text components (dialog-safe).
# Unlike impl/parkour/get_formatted_time (which resolves through do:text/resolve and
# leaves a raw {score:...} component behind), this never produces score/storage
# components, so it can be embedded into a dialog without it being rejected.
# input: score <ticks> variable
# output: storage pandamium:temp time_str (list of plain strings, e.g. ["1",":","0","5",".","₄","₅"])
function pandamium:utils/get/time_from_ticks_without_days
data modify storage pandamium:temp parts set value ["", "","₀","₀"]
execute if score <minutes> variable matches 0..9 run data modify storage pandamium:temp parts[0] set value "0"
execute if score <seconds> variable matches 0..9 run data modify storage pandamium:temp parts[1] set value "0"
scoreboard players operation <ticks> variable *= #100 constant
execute store result score <digit_0> variable store result score <digit_1> variable run scoreboard players operation <ticks> variable /= #ticks_per_second constant
execute store result storage pandamium:templates macro.value.value int 1 run scoreboard players operation <digit_0> variable /= #10 constant
function pandamium:utils/get/subscript_digit with storage pandamium:templates macro.value
data modify storage pandamium:temp parts[2] set from storage pandamium:temp subscript_digit
execute store result storage pandamium:templates macro.value.value int 1 run scoreboard players operation <digit_1> variable %= #10 constant
function pandamium:utils/get/subscript_digit with storage pandamium:templates macro.value
data modify storage pandamium:temp parts[3] set from storage pandamium:temp subscript_digit
# plain string forms of the numbers
execute store result storage pandamium:temp str_h int 1 run scoreboard players get <hours> variable
data modify storage pandamium:temp str_h set string storage pandamium:temp str_h
execute store result storage pandamium:temp str_m int 1 run scoreboard players get <minutes> variable
data modify storage pandamium:temp str_m set string storage pandamium:temp str_m
execute store result storage pandamium:temp str_s int 1 run scoreboard players get <seconds> variable
data modify storage pandamium:temp str_s set string storage pandamium:temp str_s
# build the time string list
data modify storage pandamium:temp time_str set value []
execute if score <hours> variable matches 0 if score <minutes> variable matches 0 run data modify storage pandamium:temp time_str append from storage pandamium:temp str_s
execute if score <hours> variable matches 0 if score <minutes> variable matches 0 run data modify storage pandamium:temp time_str append value "."
execute if score <hours> variable matches 0 if score <minutes> variable matches 0 run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[2]
execute if score <hours> variable matches 0 if score <minutes> variable matches 0 run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[3]
execute if score <hours> variable matches 0 if score <minutes> variable matches 0 run data modify storage pandamium:temp time_str append value " seconds"
execute if score <hours> variable matches 0 if score <minutes> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[0]
execute if score <hours> variable matches 0 if score <minutes> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp str_m
execute if score <hours> variable matches 0 if score <minutes> variable matches 1.. run data modify storage pandamium:temp time_str append value ":"
execute if score <hours> variable matches 0 if score <minutes> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[1]
execute if score <hours> variable matches 0 if score <minutes> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp str_s
execute if score <hours> variable matches 0 if score <minutes> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[2]
execute if score <hours> variable matches 0 if score <minutes> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[3]
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp str_h
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append value ":"
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[0]
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp str_m
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append value ":"
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[1]
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp str_s
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[2]
execute if score <hours> variable matches 1.. run data modify storage pandamium:temp time_str append from storage pandamium:temp parts[3]