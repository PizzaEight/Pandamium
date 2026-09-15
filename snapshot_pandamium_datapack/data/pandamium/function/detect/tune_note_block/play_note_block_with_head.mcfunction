scoreboard players add @s pandamium.mob_head_plays 1

execute store result storage pandamium:temp play_note_block int 1 run scoreboard players get @s pandamium.mob_head_plays

function pandamium:detect/tune_note_block/play_note_block_with_head_50_times with storage pandamium:temp

advancement revoke @s only pandamium:detect/play_noteblock_with_head