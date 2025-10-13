#> zz.pl_impulse:cal/replace
# プレイヤーのモーションをセット
# @within
#   function zz.pl_impulse:**

## モーションを設定
    # 向きを取得する
    tp 4fe002bb-0-0-0-1 0.0 0.0 0.0 ~ ~
    execute store result score @s pliS.rot_x run data get entity 4fe002bb-0-0-0-1 Rotation[0] 1000
    execute store result score @s pliS.rot_y run data get entity 4fe002bb-0-0-0-1 Rotation[1] 1000
    # 強さを設定する
    execute store result score @s pliS.velocity run data get storage pl_impulse:zz in.velocity 10
    scoreboard players operation #pliH.1 pliS. = @s pliS.velocity
    scoreboard players operation #pliH.2 pliS. = @s pliS.velocity
    scoreboard players operation #pliH.1 pliS. %= #c255 _
    scoreboard players operation #pliH.2 pliS. /= #c255 _
    execute if score #pliH.1 pliS. matches 1.. store result storage pl_impulse:zz _.components."minecraft:enchantments"."zz.pl_impulse:impulse_001" int 1 run scoreboard players get #pliH.1 pliS.
    execute if score #pliH.2 pliS. matches 1.. store result storage pl_impulse:zz _.components."minecraft:enchantments"."zz.pl_impulse:impulse_255" int 1 run scoreboard players get #pliH.2 pliS.