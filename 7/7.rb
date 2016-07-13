# arr = []
# loop{
#  line = gets
#  if line == nil
#    break
#  end
#  arr.push(line)
#}
# hash = {}
# arr.each{|text| hash.store(text[1],text[8])}
# p hash
# 以下の辞書を作るためのコード↑
dict = {"q"=>"e",  "t"=>"p",  "b"=>"b",  "n"=>"w",  "j"=>"s",  "u"=>"t",  "w"=>"z",  "c"=>"v",  "k"=>"i",  "d"=>"r",  "p"=>"u",  "h"=>"q",  "x"=>"m",  "z"=>"x",  "v"=>"h",  "l"=>"k",  "s"=>"j",  "i"=>"a",  "f"=>"d",  "r"=>"y",  "a"=>"c",  "m"=>"n",  "e"=>"f",  "y"=>"o",  "g"=>"g",  "o"=>"l"}

cipher = "lymmkuknidpbruimyjkk"
puts cipher.chars.map{|c| dict[c]}.join
