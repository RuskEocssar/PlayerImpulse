#> zz.pl_impulse:impulse/tp_pre
# プレイヤーの向きを変更する
# @within
#   function zz.pl_impulse:**

## プレイヤーの向きを変更する
    data modify storage pl_impulse:zz _ set value {rot:[0f,0f],mode:0b}
    # 向きの情報をロード
    execute store result storage pl_impulse:zz _.rot[0] float 0.001 run scoreboard players get @s pliS.rot_x
    execute store result storage pl_impulse:zz _.rot[1] float 0.001 run scoreboard players get @s pliS.rot_y
    data modify entity 4fe002bb-0-0-0-1 Rotation set from storage pl_impulse:zz _.rot
    execute as 4fe002bb-0-0-0-1 at @s if entity @s[x_rotation=-135..-45] store success storage pl_impulse:zz _.mode byte 1 run rotate @s ~ ~90
    execute as 4fe002bb-0-0-0-1 at @s if entity @s[x_rotation=45..135] store success storage pl_impulse:zz _.mode byte 2 run rotate @s ~ ~-90
    # プレイヤーをテレポート
    execute unless score @s pliS.setting matches 1 rotated as 4fe002bb-0-0-0-1 run tp @s ~ ~ ~ ~ ~
    execute if score @s pliS.setting matches 1 rotated as 4fe002bb-0-0-0-1 run rotate @s ~ ~
    rotate 4fe002bb-0-0-0-1 ~ ~