料金を求めるプロセスを、

1. 年齢から基本料金を求める。
2. 性別から割引後の料金を求める。

の２つに分割しよう。
基本料金の区分は 0〜12歳, 12〜18歳, 19〜22歳, 23歳〜 の4つなので、Rangeとcase式を用いて基本料金を求めよう。
割引料金は性別が男性か女性かでif式を用いて場合分けしよう。

```
age, sex = STDIN.gets.split.map(&:to_i)

# caseは式なので代入可
fee = case age
      when 0..12 then
        700
      when 13..18 then
        1000
      when 19..22 then
        1200
      else
        1500
      end

# ifも式なので、値として出力可能
p (if sex == 0 then 
      fee 
    else 
      fee-200
    end)

# 三項演算子を用いる方法もある
p sex == 0 ? fee : fee-200
```
