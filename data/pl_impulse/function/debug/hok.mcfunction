tag @s add _player

execute as @e[tag=hok] store success score @s _ on passengers on target if entity @s[tag=_player]
execute as @e[tag=hok,scores={_=1}] on passengers run kill @s
kill @e[tag=hok,scores={_=1}]

execute anchored eyes run summon bat ^ ^ ^ {Tags:["hok","hok_temp","hok_all"],DeathTime:19s,Invulnerable:1b,NoAI:1b,data:{root:[I;0,0,0,0]},Passengers:[{id:"interaction",Tags:["hok_all"],height:0,width:0,interaction:{player:[I;0,0,0,0],timestamp:0}}]}
execute as @e[tag=hok_temp,limit=1] on passengers run data modify entity @s interaction.player set from entity @p[tag=_player] UUID
data modify storage pm_motion: in set value {size:6,max_reflect:0,velocity:100,max_distance:100,max_time:100,c_drag:0,entity:false,events:{trail:"particle dust{color:[1,1,1],scale:1} ~ ~ ~ 0 0 0 0.001 1",last:"function pl_impulse:debug/hit"}}
execute at @s anchored eyes positioned ^ ^ ^ as @e[tag=hok_temp] run function pm_motion:motion
tag @e[tag=hok_temp] remove hok_temp

tag @s remove _player