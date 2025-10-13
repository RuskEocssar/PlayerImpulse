#> pl_impulse:example/shot
# When shot the crossbow.

## Reset the crossbow.
    execute if items entity @s weapon.mainhand crossbow[custom_data~{pl_impulse_ex:true}] run item modify entity @s weapon.mainhand {function:"set_components",components:{charged_projectiles:[{id:"arrow",count:1,components:{intangible_projectile:{},custom_data:{pl_impulse_ex:true}}}]}}
    execute if items entity @s weapon.offhand crossbow[custom_data~{pl_impulse_ex:true}] run item modify entity @s weapon.offhand {function:"set_components",components:{charged_projectiles:[{id:"arrow",count:1,components:{intangible_projectile:{},custom_data:{pl_impulse_ex:true}}}]}}

## Kill the arrows over two.
    tag @s add _player
    scoreboard players set _ _ 0
    execute as @e[type=arrow] if data entity @s {item:{components:{"minecraft:custom_data":{pl_impulse_ex:true}}}} if function pl_impulse:example/check_origin store success score @s _ run scoreboard players add @e[type=arrow,scores={_=0..}] _ 1
    scoreboard players add @e[type=arrow,scores={_=0..},limit=1,sort=arbitrary] _ 1
    kill @e[type=arrow,scores={_=3..}]

## Set LifeTime of arrow.
    data modify entity @e[type=arrow,limit=1,scores={_=1}] life set value 1000
    scoreboard players reset @e[type=arrow,scores={_=0..}] _
    tag @s remove _player

## Init tick function.
    tag @s add pl_impulse_ex
    schedule function pl_impulse:example/tick 1t

## Reset the advancement.
    advancement revoke @s only pl_impulse:example/shot