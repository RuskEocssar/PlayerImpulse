#> zz.pl_impulse:cal/add
# プレイヤーのモーションを加算 
# @within
#   function zz.pl_impulse:**

## 向きの取得
    data modify entity @s Pos set from storage pl_impulse:zz _.pos
    execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1 ~ ~