#> pl_impulse:example/impulse
# Apply motion to the player.

## Search the arrows
    tag @s add _player
    execute as @e[type=arrow] if data entity @s {inGround:1b,item:{components:{"minecraft:custom_data":{pl_impulse_ex:true}}}} if function pl_impulse:example/check_origin run tag @s add pl_impulse_ex
    tag @s remove _player

## Apply motion to the player.
    tag @s add pl_impulse_ex_sub
    execute at @e[type=arrow,tag=pl_impulse_ex] facing entity @s feet facing ^ ^ ^-1 run function pl_impulse:execute {func:"motion",in:{velocity:0.3,inertia:true}}
    tag @e[type=arrow,tag=pl_impulse_ex] remove pl_impulse_ex