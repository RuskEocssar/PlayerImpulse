#> zz.pl_impulse:impulse/tp_end_255
# プレイヤーの向きを戻す
# @within
#   function zz.pl_impulse:**

## プレイヤーの向きを戻す
    execute rotated as 4fe002bb-0-0-0-1 run rotate @s ~ ~

## エンチャントの適用を削除
    item modify entity @s saddle {function:"set_enchantments",enchantments:{"zz.pl_impulse:impulse_255":0}}
    scoreboard players reset @s pliS.velocity