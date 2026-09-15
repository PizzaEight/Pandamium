#> Toggles the [Show Playtime Days] option and re-opens the "Your Info" dialog.
# (Mirrors the toggle logic from /trigger playtime set -1.)
execute store success score @s show_playtime_days unless score @s show_playtime_days matches 1
function pandamium:triggers/playtime/dialog/main_menu