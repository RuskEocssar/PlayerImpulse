#> pl_impulse:example/tick
# tick function

## Execute from player.
    execute as @a[tag=pl_impulse_ex] at @s run function pl_impulse:example/tick_player

## Loop this function.
    execute if entity @a[tag=pl_impulse_ex,limit=1] run schedule function pl_impulse:example/tick 1t