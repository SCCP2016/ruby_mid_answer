それぞれ引数に配列を受け取り、一つの値を返す関数である。
いずれも値を求めるために畳み込みを利用するのが良い。

**min** ... アキュムレータとして現在までの最小値を保持し、畳み込みで最小値を都度更新する。

**max** ... minと逆にすれば良い。

**sum** ... アキュムレータに合計値を蓄積し、畳み込みで加算していく。

```
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
```
