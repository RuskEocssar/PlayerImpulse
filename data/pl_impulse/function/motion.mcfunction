#> pl_impulse:motion
# プレイヤーにモーションを付与する
# 実行時の向きが方向となる
# @public

## 入力の取得
    data modify storage pl_impulse:zz in set from storage pl_impulse: in_default
    data modify storage pl_impulse:zz in merge from storage pl_impulse: in

## データを設定
    # データを取得
    item replace entity 4fe002bb-0-6-0-a00000001 container.0 with saddle[custom_data={pl_impulse:{_rot:[0f,0f]}}]
    execute if items entity @s saddle * run item replace entity 4fe002bb-0-6-0-a00000001 container.0 from entity @s saddle
    data modify storage pl_impulse:zz components set from entity 4fe002bb-0-6-0-a00000001 Item.components
    # モーションを加算
    execute if data storage pl_impulse:zz {in:{add:true}}.components."minecraft:enchantments"."zz.pl_impulse:impulse" as 4fe002bb-0-0-0-1 run function zz.pl_impulse:cal/add
    # モーションを置き換え
    execute unless data storage pl_impulse:zz {in:{add:true}}.components."minecraft:enchantments"."zz.pl_impulse:impulse" run function zz.pl_impulse:cal/replace
    # そのほか
    scoreboard players set @s pliS.setting 0
    execute if data storage pl_impulse:zz in{inertia:true} run scoreboard players set @s pliS.setting 1

## モーションを付与
    data modify entity 4fe002bb-0-6-0-a00000001 Item.components set from storage pl_impulse:zz components
    item replace entity @s saddle from entity 4fe002bb-0-6-0-a00000001 container.0