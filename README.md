# PlayerImpulse
Player Motion Datapack with `apply_impulse` enchantment effect.  
`apply_impulse`エンチャントエフェクトを使ったプレイヤーへのモーション付与ができるデータパックです。

対応バージョン：25w41a

## 目次
- [使い方](#使い方)
- [使用例](#使用例)

# 使い方

### `pl_impulse:motion`
　`pl_impulse:motion`ファンクションを実行すると、実行時の向きに、入力した速度成分を強さとしたモーションをプレイヤーに付与します。
オプションの入力はストレージ`pl_impulse: in`に設定します。

▼基本的な使い方
```mcfunction
# 入力
data modify storage pl_impulse: in set valuse {velocity:<velocity>}

# 実行
execute rotated <x rotation> <y rotation> run function pl_impulse:motion
```

**入力フォーマット**
```html
* <>内はデータ型 ()内は初期値

pl_impulse: in {
    velocity : <float>,     | (0.3f) 与えるモーションの強さ。 
    add : <boolen>,         | (true) 同じtickですでにモーションが付与されているとき、それに加算するかどうか。trueの場合は、モーションの大きさを加算する。falseの場合は、モーションを上書きする。
    inertia : <boolen>,     | (true) すでにプレイヤーが受けている慣性を残すかどうか。falseの場合、慣性が低減される。
}
```

**使用例**
```mcfunction
# 向きを設定
execute rotated 0 -45 run data modify storage pl_impulse: in set valuse {velocity:0.3f}
function pl_impulse:motion

# 加算なし
data modify storage pl_impulse: in set valuse {velocity:0.3f,add:false}
function pl_impulse:motion

# 慣性なし
data modify storage pl_impulse: in set valuse {velocity:0.3f,inertia:false}
function pl_impulse:motion
```

### `pl_impulse:execute`
　ファンクションの入力設定と実行を、マクロによって1行で行うためのファンクションです。マクロを使う分負荷がやや高くなりますが、簡易的に実行することができます。

**入力フォーマット**
```html
* <>内はデータ型 ()内は初期値

function pl_impulse:execute {                 
    func : <string>,        | 実行するファンクション pl_impulse:以降のファンクションのパスを記入する 例:pl_impulse:motion -> motion
    in : <comapund>,        | ファンクションの入力 pl_impulse: に設定するNBTデータ
}
```

**使用例**
```mcfunction
function pl_impulse:execute {func:"motion",in:{velocity:0.3f,add:false,inertia:true}}
```


# 使用例(フックショット)
　`pl_impulse:execute/`内に、このデータパックを活用したフックショットのコマンドを用意してあります。使用手順は以下のとおりです。  

1. クロスボウを入手  
以下のコマンドを実行してクロスボウを入手します。
```mcfunction
function pl_impulse:example/give
```

2. クロスボウを打つ  
クロスボウには矢がセットされているので、フックショットを撃ちたいところに右クリックで矢を放ちます。矢は最大2本を撃ち付けることが可能です。2本以上撃った場合は、古い矢から順番に消えていきます。また、撃った矢は着弾後10秒で消滅します。

3. 移動する  
スペース(ジャンプ)キーを長押しすると、着弾した矢に向かってプレイヤーを動かします。矢が2本ある場合は両方からモーションを与えられます。スペースキーを離すとモーションは解除され、矢は削除されます。