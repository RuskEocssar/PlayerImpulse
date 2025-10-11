#> zz.pl_impulse:cal/replace
# プレイヤーのモーションをセット
# @within
#   function zz.pl_impulse:**

## モーションを設定
    # 向きを取得する
    tp 4fe002bb-0-0-0-1 0.0 0.0 0.0 ~ ~
    data modify storage pl_impulse:zz components."minecraft:custom_data".pl_impulse._rot set from entity 4fe002bb-0-0-0-1 Rotation
    # 強さを設定する
    execute store result score #pliH. pliS. run data get storage pl_impulse:zz in.velocity 10
    execute unless score #pliH. pliS. matches 256.. run scoreboard players set @s pliS.mode 0
    execute unless score #pliH. pliS. matches 256.. store result storage pl_impulse:zz components."minecraft:enchantments"."zz.pl_impulse:impulse" int 1 run data get storage pl_impulse:zz in.velocity 10
    execute if score #pliH. pliS. matches 256.. run scoreboard players set @s pliS.mode 10
    execute if score #pliH. pliS. matches 256.. store result storage pl_impulse:zz components."minecraft:enchantments"."zz.pl_impulse:impulse" int 1 run data get storage pl_impulse:zz in.velocity 1