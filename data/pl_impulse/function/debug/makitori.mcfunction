tag @s add _player
execute as @e[tag=hok_ok] store success score @s _ on passengers on target if entity @s[tag=_player]

execute facing entity @e[tag=hok_ok,scores={_=1}] feet run function pl_impulse:execute {func:"motion",in:{velocity:0.5,inertia:true}}
tag @s remove _player