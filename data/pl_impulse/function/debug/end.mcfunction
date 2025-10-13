tag @s add _player
execute as @e[tag=hok_ok] store success score @s _ on passengers on target if entity @s[tag=_player]
execute as @e[tag=hok_ok,scores={_=1}] on passengers run kill @s
kill @e[tag=hok_ok,scores={_=1}]
tag @s remove _player