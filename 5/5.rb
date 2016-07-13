arr = STDIN.gets.split.map(&:to_i)

# 畳み込みを利用して配列内の最小値を求める
def min(arr)
    arr.inject{ |min_val, n| min_val > n ? n : min_val }
end

# 畳み込みを利用して配列内の最大値を求める
def max(arr)
    arr.inject{ |min_val, n| min_val < n ? n : min_val }
end

# 畳み込みを利用して配列の要素の値の合計値を求める
def sum(arr)
    arr.inject{ |sum, n| sum + n }
end

p min(arr)
p max(arr)
p sum(arr)
