#> pl_impulse:example/cancel
# Clear all.

## Kill the arrows.
    tag @s add _player
    execute as @e[type=arrow] if data entity @s {inGround:1b,item:{components:{"minecraft:custom_data":{pl_impulse_ex:true}}}} if function pl_impulse:example/check_origin run kill @s
    tag @s remove _player
    
## Remove player tags.
    tag @s remove pl_impulse_ex
    tag @s remove pl_impulse_ex_sub