tag @s add _player
execute as @e[tag=hok_ok] store success score @s _ on passengers on target if entity @s[tag=_player]

execute at @e[tag=hok_ok,scores={_=1}] facing entity @s feet facing ^ ^ ^-1 run function pl_impulse:execute {func:"motion",in:{velocity:0.5,inertia:true}}
tag @s remove _player