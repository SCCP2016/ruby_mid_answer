`STDIN.gets` で得られた標準入力の文字列には末尾に改行文字が含まれているので、予め削除しておく必要があることに注意。
Stringが提供するcharsというメソッドは文字列を一文字ずつの配列に分解するものである。

```
irb> "RubyOnRails"
=> "RubyOnRails"
irb> "RubyOnRails".chars
=> ["R", "u", "b", "y", "O", "n", "R", "a", "i", "l", "s"]
```

```
# 末尾の改行を削除した文字列をtextという変数に代入
text = STDIN.gets.chomp

puts text

# Stringが長さを求めるメソッドを提供している
puts text.size

# 文字列を逆順に並べ替えるメソッド、reverseを使う
puts text.reverse

# 文字列内のアルファベットを大文字に変えるメソッド、updcaseを使う
puts text.upcase

# Rangeで書くと -1で末尾, -2でその前を指す
puts text[1..-2]

# 文字列を配列として一文字ずつに分解し、a, b, cであるときにupcaseを適用するような処理を書く
puts text.chars.map{|w| (('a' <= w && w <= 'c') ? w.upcase : w)}.join
```
