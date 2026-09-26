#> Dev helper: manually seeds the wall-clock scores that are normally fed by the external RCON time
#> source (the repeating command block at 6 0 0 in pandamium:staff_world, read by
#> pandamium:impl/main_loop/get_precise_time). In a local test world without that time source
#> <year>/<month>/<day>/<hour> and <hour_id> stay 0, so every datetime is 0 and stats such as
#> first_joined.datetime / last_joined.datetime show up as N/A.
#>
#> Usage: /function pandamium:dev/set_clock {year:2026,month:9,day:26,hour:12,minute:0,second:0}
# arguments: year, month, day, hour, minute, second
# precise time
$scoreboard players set <precise_hour> global $(hour)
$scoreboard players set <precise_minute> global $(minute)
$scoreboard players set <precise_second> global $(second)
# date and hour
$scoreboard players set <year> global $(year)
$scoreboard players set <month> global $(month)
$scoreboard players set <day> global $(day)
$scoreboard players set <hour> global $(hour)
# recompute <hour_id> from the values above (update_hour_id returns early while the hour id is
# unchanged, so <previous_hour_id> is invalidated first to force the recalculation)
scoreboard players set <previous_hour_id> variable -2147483648
function pandamium:misc/update_hour_id
# report the resulting current datetime id (should be 1.. once the clock is usable)
function pandamium:utils/datetime/get_current_datetime_id
execute if score <datetime_id> variable matches 1.. run tellraw @s [{text:"[Dev] ",color:"gold"},{text:"Clock set. datetime_id = ",color:"gray"},{score:{name:"<datetime_id>",objective:"variable"},color:"aqua"},{text:", hour_id = ",color:"gray"},{score:{name:"<hour_id>",objective:"global"},color:"aqua"}]
execute unless score <datetime_id> variable matches 1.. run tellraw @s [{text:"[Dev] ",color:"red"},{text:"Clock still unusable (datetime_id = ",color:"red"},{score:{name:"<datetime_id>",objective:"variable"},color:"red"},{text:"), check that the arguments are real numbers and in range (month 1-12, day 1-31, hour 0-23, minute/second 0-59).",color:"red"}]
