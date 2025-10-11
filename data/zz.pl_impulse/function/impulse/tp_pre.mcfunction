#> zz.pl_impulse:impulse/tp_pre
# プレイヤーの向きを変更する
# @within
#   function zz.pl_impulse:**

## プレイヤーの向きを変更する
    # アイテムの情報をロード
    item replace entity 4fe002bb-0-6-0-a00000001 container.0 from entity @s saddle
    data modify entity 4fe002bb-0-0-0-1 Rotation set from entity 4fe002bb-0-6-0-a00000001 Item.components."minecraft:custom_data".pl_impulse._rot
    # 向きの情報をロード
    data modify storage pl_impulse:zz _.mode set value 0b
    execute as 4fe002bb-0-0-0-1 at @s if entity @s[x_rotation=-90..-45] store success storage pl_impulse:zz _.mode byte 1 run rotate @s ~ ~90
    execute as 4fe002bb-0-0-0-1 at @s if entity @s[x_rotation=45..90] store success storage pl_impulse:zz _.mode byte 2 run rotate @s ~ ~-90
    execute store result score #pliH. pliS. run data get storage pl_impulse:zz _.mode
    scoreboard players operation #pliH. pliS. += @s pliS.mode
    # プレイヤーをテレポート
    execute unless score @s pliS.setting matches 1 rotated as 4fe002bb-0-0-0-1 run tp @s ~ ~ ~ ~ ~
    execute if score @s pliS.setting matches 1 rotated as 4fe002bb-0-0-0-1 run rotate @s ~ ~
    rotate 4fe002bb-0-0-0-1 ~ ~