# Prints the parkour chat menu matching the current state of the player:
# the in-course actions menu while running a course, otherwise the courses/options menu.
# Used by the parkour option toggles triggered from chat, so that they reprint the chat
# menu instead of opening the parkour dialog.
execute if score @s parkour.checkpoint matches 0.. run return run function pandamium:triggers/parkour/print_actions_menu
function pandamium:triggers/parkour/print_courses_menu
