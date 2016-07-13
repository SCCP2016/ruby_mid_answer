# 標準入力をもとに、作成するディレクトリ名の配列を作成する
dir_name, num_str = STDIN.gets.split
num = num_str.to_i
# ディレクトリ名の配列にしておけば、配列に対してのテストコードを書くことが可能になる。
dir_with_perm = (1..num).map{|n| [dir_name + n.to_s, n % 2 == 0 ? 0754 : 0705]}

dir_with_perm.each{|dir_with_perm| Dir.mkdir(dir_with_perm[0], dir_with_perm[1])}
