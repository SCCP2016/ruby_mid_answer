暗号を解いて答えの文字列を表示するプログラムを書け。答えのキーワードは、コメントに記述せよ。 暗号は以下に示す表を使うことで複合することが出来る。 今回対象となる暗号は、`"lymmkuknidpbruimyjkk"` である。

```
"q" -> "e"
"t" -> "p"
"b" -> "b"
"n" -> "w"
"j" -> "s"
"u" -> "t"
"w" -> "z"
"c" -> "v"
"k" -> "i"
"d" -> "r"
"p" -> "u"
"h" -> "q"
"x" -> "m"
"z" -> "x"
"v" -> "h"
"l" -> "k"
"s" -> "j"
"i" -> "a"
"f" -> "d"
"r" -> "y"
"a" -> "c"
"m" -> "n"
"e" -> "f"
"y" -> "o"
"g" -> "g"
"o" -> "l"
```

---

暗号のアルファベットの復号用ハッシュを全て手打ちで作成するという方法もあるが、せっかく対応表が与えられているのだから是非活用しよう。
ハッシュのディクショナリを作成する処理がメインとなり、対応表をコピーして標準入力にペースト(もしくはリダイレクション)するか、対応表をファイルとして保存してからプログラム内で直接ファイルを開いて読み込む方法がある。
対応表の文字列を分解してハッシュに落としこむ処理には様々な解法がある。

* 一文字ずつの配列に分解して添字を指定してアルファベットを取り出す
* ダブルクォートで文字列を分割してアルファベットに対応する添字を使って取り出す
* etc...

```
# 標準入力から文字列を受け取りディクショナリを作成する方法
arr = []
loop{
 line = gets
 if line == nil
   break
 end
 arr.push(line)

hash = {}
arr.each{|text| hash.store(text[1],text[8])}
p hash
# 以下の辞書を作るためのコード↑
# dict = {"q"=>"e",  "t"=>"p",  "b"=>"b",  "n"=>"w",  "j"=>"s",  "u"=>"t",  "w"=>"z",  "c"=>"v",  "k"=>"i",  "d"=>"r",  "p"=>"u",  "h"=>"q",  "x"=>"m",  "z"=>"x",  "v"=>"h",  "l"=>"k",  "s"=>"j",  "i"=>"a",  "f"=>"d",  "r"=>"y",  "a"=>"c",  "m"=>"n",  "e"=>"f",  "y"=>"o",  "g"=>"g",  "o"=>"l"}
```

```
# ファイルアクセス用のクラスを用いて中身を読み取りディクショナリを作成する方法
def make_dictionary()
    dict = {"" => ""}
    # dictというファイルを開き、一行ずつ読み込む
    File.open("./dict") do |file|
        file.each_line do |d|
            # ダブルクォートで区切り、復号用のハッシュを作成してディクショナリに追加する
            a = d.split("\"")
            dict[a[1]] = a[3]
        end
    end
    return dict
end

dict = make_dictionary()
```
