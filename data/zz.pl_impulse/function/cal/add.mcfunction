#> zz.pl_impulse:cal/add
# プレイヤーのモーションを加算 
# @within
#   function zz.pl_impulse:**

## プレイヤーのモーションを加算
    # 現時点の入力を取得
    scoreboard players operation #pliH.x1 pliS. = @s pliS.vec_x
    scoreboard players operation #pliH.y1 pliS. = @s pliS.vec_y
    scoreboard players operation #pliH.z1 pliS. = @s pliS.vec_z
    scoreboard players operation #pliH.x1 pliS. *= @s pliS.velocity
    scoreboard players operation #pliH.y1 pliS. *= @s pliS.velocity
    scoreboard players operation #pliH.z1 pliS. *= @s pliS.velocity
    # 追加の入力を取得する
    execute store result score #pliH.impulse pliS. run data get storage pl_impulse:zz in.velocity 100
    execute positioned 0.0 0.0 0.0 run tp 4fe002bb-0-0-0-1 ^ ^ ^1
    data modify storage pl_impulse:zz _.pos set from entity 4fe002bb-0-0-0-1 Pos
    # スコアを加算
    execute store result score #pliH.x2 pliS. run data get storage pl_impulse:zz _.pos[0] 100
    execute store result score #pliH.y2 pliS. run data get storage pl_impulse:zz _.pos[1] 100
    execute store result score #pliH.z2 pliS. run data get storage pl_impulse:zz _.pos[2] 100
    scoreboard players operation #pliH.x2 pliS. *= #pliH.impulse pliS.
    scoreboard players operation #pliH.y2 pliS. *= #pliH.impulse pliS.
    scoreboard players operation #pliH.z2 pliS. *= #pliH.impulse pliS.
    execute store result storage pl_impulse:zz _.pos[0] double 0.01 run scoreboard players operation #pliH.x1 pliS. += #pliH.x2 pliS.
    execute store result storage pl_impulse:zz _.pos[1] double 0.01 run scoreboard players operation #pliH.y1 pliS. += #pliH.y2 pliS.
    execute store result storage pl_impulse:zz _.pos[2] double 0.01 run scoreboard players operation #pliH.z1 pliS. += #pliH.z2 pliS.
    # 向きの取得
    execute as 4fe002bb-0-0-0-1 run function zz.pl_impulse:cal/set_rotation
    data modify storage pl_impulse:zz _.pos set from entity 4fe002bb-0-0-0-1 Pos
    execute store result score @s pliS.rot_x run data get entity 4fe002bb-0-0-0-1 Rotation[0] 1000
    execute store result score @s pliS.rot_y run data get entity 4fe002bb-0-0-0-1 Rotation[1] 1000
    # 距離の計算
    execute store result score #pliH.x2 pliS. store result score @s pliS.vec_x run data get storage pl_impulse:zz _.pos[0] 100
    execute store result score #pliH.y2 pliS. store result score @s pliS.vec_y run data get storage pl_impulse:zz _.pos[1] 100
    execute store result score #pliH.z2 pliS. store result score @s pliS.vec_z run data get storage pl_impulse:zz _.pos[2] 100
    scoreboard players operation #pliH.x1 pliS. *= #pliH.x2 pliS.
    scoreboard players operation #pliH.y1 pliS. *= #pliH.y2 pliS.
    scoreboard players operation #pliH.z1 pliS. *= #pliH.z2 pliS.
    scoreboard players operation #pliH.x1 pliS. += #pliH.y1 pliS.
    scoreboard players operation #pliH.x1 pliS. += #pliH.z1 pliS.
    scoreboard players operation #pliH.x1 pliS. /= #c100000 _
    scoreboard players operation @s pliS.velocity = #pliH.x1 pliS.
    # モーションを反映
    scoreboard players operation #pliH.1 pliS. = @s pliS.velocity
    scoreboard players operation #pliH.2 pliS. = @s pliS.velocity
    scoreboard players operation #pliH.1 pliS. %= #c255 _
    scoreboard players operation #pliH.2 pliS. /= #c255 _
    execute if score #pliH.1 pliS. matches 1.. store result storage pl_impulse:zz components."minecraft:enchantments"."zz.pl_impulse:impulse_001" int 1 run scoreboard players get #pliH.1 pliS.
    execute if score #pliH.2 pliS. matches 1.. store result storage pl_impulse:zz components."minecraft:enchantments"."zz.pl_impulse:impulse_255" int 1 run scoreboard players get #pliH.2 pliS.