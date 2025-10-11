#> zz.pl_impulse:cal/add
# プレイヤーのモーションを加算 
# @within
#   function zz.pl_impulse:**

## プレイヤーのモーションを加算
    # 現時点の入力を取得する
    execute store result score #pliH.impulse pliS. run data get storage pl_impulse:zz components."minecraft:enchantments"."zz.pl_impulse:impulse"
    data modify entity @s Rotation set from storage pl_impulse:zz components."minecraft:custom_data".pl_impulse._rot
    execute as @s positioned 0.0 0.0 0.0 rotated as @s run tp @s ^ ^ ^1
    data modify storage pl_impulse:zz pos set from entity @s Pos
    # スコアで取得
    execute store result score #pliH.x1 pliS. run data get storage pl_impulse:zz pos[0] 100
    execute store result score #pliH.y1 pliS. run data get storage pl_impulse:zz pos[1] 100
    execute store result score #pliH.z1 pliS. run data get storage pl_impulse:zz pos[2] 100
    scoreboard players operation #pliH.x1 pliS. *= #pliH.impulse pliS.
    scoreboard players operation #pliH.y1 pliS. *= #pliH.impulse pliS.
    scoreboard players operation #pliH.z1 pliS. *= #pliH.impulse pliS.
    # 追加の入力を取得する
    execute store result score #pliH.impulse pliS. run data get storage pl_impulse:zz in.velocity 10
    execute as @s positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1
    data modify storage pl_impulse:zz pos set from entity @s Pos
    # スコアを加算
    execute store result score #pliH.x2 pliS. run data get storage pl_impulse:zz pos[0] 100
    execute store result score #pliH.y2 pliS. run data get storage pl_impulse:zz pos[1] 100
    execute store result score #pliH.z2 pliS. run data get storage pl_impulse:zz pos[2] 100
    scoreboard players operation #pliH.x2 pliS. *= #pliH.impulse pliS.
    scoreboard players operation #pliH.y2 pliS. *= #pliH.impulse pliS.
    scoreboard players operation #pliH.z2 pliS. *= #pliH.impulse pliS.
    execute store result storage pl_impulse:zz pos[0] double 0.01 run scoreboard players operation #pliH.x1 pliS. += #pliH.x2 pliS.
    execute store result storage pl_impulse:zz pos[1] double 0.01 run scoreboard players operation #pliH.y1 pliS. += #pliH.y2 pliS.
    execute store result storage pl_impulse:zz pos[2] double 0.01 run scoreboard players operation #pliH.z1 pliS. += #pliH.z2 pliS.
    # 向きの取得
    data modify entity @s Pos set from storage pl_impulse:zz pos
    execute positioned 0.0 0.0 0.0 facing entity @s feet run tp @s ^ ^ ^1 ~ ~
    data modify storage pl_impulse:zz pos set from entity @s Pos
    # 距離の計算
    execute store result score #pliH.x2 pliS. run data get storage pl_impulse:zz pos[0] 1000
    execute store result score #pliH.y2 pliS. run data get storage pl_impulse:zz pos[1] 1000
    execute store result score #pliH.z2 pliS. run data get storage pl_impulse:zz pos[2] 1000
    scoreboard players operation #pliH.x1 pliS. *= #pliH.x2 pliS.
    scoreboard players operation #pliH.y1 pliS. *= #pliH.y2 pliS.
    scoreboard players operation #pliH.z1 pliS. *= #pliH.z2 pliS.
    scoreboard players operation #pliH.x1 pliS. += #pliH.y1 pliS.
    scoreboard players operation #pliH.x1 pliS. += #pliH.z1 pliS.
    scoreboard players operation #pliH.x1 pliS. /= #c100000 _