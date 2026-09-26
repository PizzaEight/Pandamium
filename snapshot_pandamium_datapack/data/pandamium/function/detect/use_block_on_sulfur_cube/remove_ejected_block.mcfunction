# arguments: id
# the block a sulfur cube used to carry is popped out when it is replaced; if that block
# is lying right next to the cube, remove it so it cannot be picked up as a duplicate
$kill @e[type=minecraft:item,nbt={Item:{id:"$(id)"}},sort=nearest,limit=1,distance=..2]
