# 7の問題を作るためのプログラム

# アナグラム作成
table = ('a'..'z').zip(('a'..'z').to_a.shuffle).shuffle

# アナグラムからハッシュを作成
hash = Hash[*table.flatten]
# 複合化ハッシュを作成
rev_hash = hash.invert
# 暗号化ハッシュを確認
p hash
# 暗号化
chipher = "konnitiwarubytanosii".chars.map{|str| rev_hash[str]}.join
# 暗号確認
puts chipher
# 複合確認
puts chipher.chars.map{|str| hash[str]}.join
p table
puts table.map{|arr| "\"#{arr[0]}\" -> \"#{arr[1]}\""}.join("\n")

