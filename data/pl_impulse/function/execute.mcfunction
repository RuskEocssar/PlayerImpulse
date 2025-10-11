#> pl_impulse:execute
# マクロを用いて入力と実行を1ラインで実行するためのファンクション
# @public

## 入力の反映とコマンドの実行
    $data modify storage pl_impulse: in set value $(in)
    $function pl_impulse:$(func)