あなたはいかなる男女のペアでも結婚させられる能力を持っている。あまりにも要望が多いため、手続きを自動化したいと考えたあなたは、たくさんの結婚前の男女の名前から結婚後苗字の変わった女性の名前を生成するプログラムを初めに作ることにした。以下の入力例、出力例を見てそのプログラムを作成せよ。ただし、結婚できずに余った者に関しては出力してはならない。

入力は一行目に男性の名前列、二行目に女性の名前列が与えられ、左から順にペアを作って名前を生成していく。 それぞれの名前列で名前の数が異なる場合は少ない方に合わせてペアを作らなければならない。

入力
```
M1 M1 M3 ... Mn
W1 W2 W3 ... Wm
```
出力

O1 O2 O3 ... Oz
ここでzはn, mの内小さい方の数

# 入力例
SuzukiMakoto OgataRyo TanakaMichael TanakaTaro
KobayashiSaki AizuMisaki ShibuyaRin

# 出力例
SuzukiSaki OgataMisaki TanakaRin

---

非常に難しい問題。
苗名が半角スペースで区切られていないので、いかにそれらを分割するか思いつくかどうかで決まる。
アプローチは複数あり、

* 先頭を切り落としたうえで、次のキャピタルのアルファベットに衝突するまで一つずつ切り落としていく
* 末尾から最初にキャピタルに衝突するまでを一つずつ切り落としていく
* 正規表現を用いて、「先頭がキャピタルのアルファベットで始まり、それ以外は小文字のアルファベットの部分文字列」にマッチする文字列を取り出す

など様々な方法がある

以下は末尾から最初にキャピタルに衝突するまでを一つずつ切り落としていく例。コードが冗長で可読性が高くない

```
male = STDIN.gets.split
female = STDIN.gets.split

# あふれた分の人は結婚できないので、苗字を書き換える人を少ない方に合わせる
n = (male.size > female.size) ? female.size : male.size

# 文字がキャピタルかどうかを真偽値で返す関数
def is_upper?(ch)
    ('a'.ord <= ch.ord && ch.ord <= 'z'.ord) ? false : true
end

# 入力文字列を苗名に分割する関数
def split_name(name)
# 名前の部分にあたる配列
    ret = []
# 入力文字列を一文字ずつに分割した配列のコピー
    o_name = name.chars
    while true do
        a = o_name.pop
        if a != nil then
        # 文字列の尻から取り出した文字が大文字ならループを脱出する
            if is_upper?(a) then
                ret.push(a)
                break
            end
        end
        ret.push(a)
    # 上記の処理で、「retにはo_nameの末尾から最初に衝突する大文字までの文字列が逆順に格納されている」という状況ができる
    end
    # o_nameには苗字のみが残されており、retには名前が逆順に格納されているので配列として返却
    return [o_name.join, ret.reverse.join]
end

for i in 0..n-1 do
    puts split_name(male[i])[0] + split_name(female[i])[1]
end


# RubyTaro

# lname: RubyTar
# fname: o
# lname: RubyTa
# fname: or
# lname: RubyT
# fname: ora
# lname: Ruby
# fname: oraT
# LstName: Ruby
# FstName: Taro
```

次に、先頭を切り落としたうえで、次のキャピタルのアルファベットに衝突するまで一つずつ切り落としていく例。高階関数を用いているので処理の内容が読みやすく理解しやすい。

```
men = ["SuzukiMakoto", "OgataRyo",  "TanakaMichael",  "TanakaTaro"]
women = ["KobayashiSaki",  "AizuMisaki",  "ShibuyaRin"]

# ファーストネームを取り出す
def get_fstn(name)
    # 先頭を切り落とし「aからzまでのRangeの中に先頭から取り出したアルファベットが含まれる限り先頭を切り落とし続ける」という反復処理を行う
    name.chars.drop(1).drop_while{|n| ('a'..'z').include?(n) }.join
end

# ファミリーネームを取り出す
def get_fmn(name)
    # first nameを空文字列に置換することによってlast nameを取り出す:
    name.gsub(get_fstn(name), "")
end

puts men.zip(women).select{|mw| mw[0] != nil && mw[1] != nil }.
map{|mw| get_fmn(mw[0]) + get_fstn(mw[1])}.join("\t")

```

最後に正規表現を用いる方法。

正規表現は文字列のパターンを記述するための**言語**で、そのパターンに合致する文字列を抽象化して表現したもの。

「大文字から始まってそれ以外は小文字のアルファベットの文字列」や「n桁の数字の文字列」など、その他にも様々なパターンを表現することができる。

* [参考資料1](http://www.megasoft.co.jp/mifes/seiki/)
* [参考資料2](http://www.megasoft.co.jp/mifes/seiki/meta.html)

```
# 正規表現を使う場合
men = ["SuzukiMakoto", "OgataRyo",  "TanakaMichael",  "TanakaTaro"]
women = ["KobayashiSaki",  "AizuMisaki",  "ShibuyaRin"]
def split_name(name)
    /([A-Z][a-z]+)([A-Z][a-z]+)/ =~ name
    [$1, $2]
end

puts men.zip(women).select{|mw| mw[0] != nil && mw[1] != nil }.
map{|mw| split_name(mw[0])[0] + split_name(mw[1])[1]}.join("\t")
```
