#> zz.pl_impulse:load
# 定義/初期設定
# @within
#   tag/function minecraft:load

## 各種定義
    function zz.pl_impulse:define

## 入力の初期設定
    execute unless data storage pl_impulse: in run data modify storage pl_impulse: in set value {}
    execute unless data storage pl_impulse: in_default run data modify storage pl_impulse: in_default set value {\
        velocity:20f,add:true,ineritia:false\
    }
    execute unless data storage pl_impulse:zz id run data modify storage pl_impulse:zz id set value {used:[]}
    
## スコアのリセット

## ストレージ初期化

## (0,0)チャンクの常時読み込み
    forceload add 0 0

## 計算用エンティティの召喚
    execute unless score 4fe002bb-0000-0000-0000-000000000001 _ matches 1 store success score 4fe002bb-0000-0000-0000-000000000001 _ run summon marker 0 0 0 {UUID:[I;1340080827,0,0,1]}
    execute unless score 4fe002bb-0000-0000-0000-000000000002 _ matches 1 store success score 4fe002bb-0000-0000-0000-000000000002 _ run summon marker 0 0 0 {UUID:[I;1340080827,0,0,2]}
    execute unless score 4fe002bb-0000-0006-0000-000a00000001 _ matches 1 store success score 4fe002bb-0000-0006-0000-000a00000001 _ run summon item 0 1000 0 {UUID:[I;1340080827,6,10,1],Item:{id:"stick",components:{max_stack_size:1}},PickupDelay:32767s,Age:-32768s,NoGravity:true,Invulnerable:true}