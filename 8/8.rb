men = ["SuzukiMakoto", "OgataRyo",  "TanakaMichael",  "TanakaTaro"]
women = ["KobayashiSaki",  "AizuMisaki",  "ShibuyaRin"]

# ファーストネームを取り出す
def get_fstn(name)
  name.chars.drop(1).drop_while{|n| ('a'..'z').include?(n) }.join
end

# ファミリーネームを取り出す
def get_fmn(name)
  name.gsub(get_fstn(name), "")
end

# 正規表現を使う場合
def split_name(name)
  /([A-Z][a-z]+)([A-Z][a-z]+)/ =~ name
  [$1, $2]
end

puts men.zip(women).select{|mw| mw[0] != nil && mw[1] != nil }.
  map{|mw| get_fmn(mw[0]) + get_fstn(mw[1])}.join("\t")

# 正規表現を使用
puts men.zip(women).select{|mw| mw[0] != nil && mw[1] != nil }.
  map{|mw| split_name(mw[0])[0] + split_name(mw[1])[1]}.join("\t")

