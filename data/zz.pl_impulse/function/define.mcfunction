 #> zz.pl_impulse:define
# スコアボード等の定義のみ
# @within
#   function zz.pl_impulse:load

## Scoreboard objective
    #> Puclic
    # @public
    #> Local (core)
    # @within pl_impulse:**
        scoreboard objectives add _ dummy
        scoreboard objectives add pliS. dummy "汎用"
        scoreboard objectives add pliS.mode dummy "モード"
        scoreboard objectives add pliS.setting dummy "設定"
        scoreboard objectives add pliS.rot_x dummy "向きx"
        scoreboard objectives add pliS.rot_y dummy "向きy"
        scoreboard objectives add pliS.velocity dummy "大きさ"

## Score Holder
    scoreboard players set #c255 _ 255
    scoreboard players set #c100000 _ 100000

## Tags
    #> Public
    # @public
 
## Team
    #> Private
    # @within pl_impulse:**

## Entity
    #> Local
    # @within pl_impulse:**
        # summon entity ~ ~ ~ {UUID:[I;1340080827,type,temp,index]}
        #define entity 4fe002bb-0-0-0-1 Marker1
        #define entity 4fe002bb-0-0-0-2 Marker2
        #define entity 4fe002bb-0-0-0-3 Marker3
        #define entity 4fe002bb-0-6-0-a00000001 Item (アイテム処理用)