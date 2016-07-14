標準入力から任意の文字列と整数を受け取り、以下の仕様を満たしたディレクトリを生成せよ(実際に実行し試せ)。

```
[入力例]
dir 3

[出来上がったディレクトリ]
$ ls
dir1/ dir2/ dir3/
作られるディレクトリのパーミッションは、
奇数番号の場合は、 drwx---r-x
偶数番号の場合は、 drwxr-xr--
とする。コメントにパーミッションの意味も書け。
```

ディレクトリ作成には、次の命令を使え。 http://docs.ruby-lang.org/ja/2.1.0/method/Dir/s/mkdir.html

---

手続き型のコードではこんな感じ。標準入力で受け取った数字の回数文forループで処理を行い、そのカウンタをディレクトリ名に付与する方法。

permissionの8進数表現はLiteracy1の復習。

```
dir_name, dir_num = STDIN.gets.split
dir_num = dir_num.to_i

# C言語では for(i = 1; i <= n; i++){ ... } のようなコードに書き直せる
for i in 1..dir_num do
    if i % 2 == 1 then
        # 奇数の場合にはpermissionを705でmkdir
        Dir.mkdir(dir_name + i.to_s, 0705)
    else
        # 偶数の場合には754でmkdir
        Dir.mkdir(dir_name + i.to_s, 0754)
    end
end
```

Rangeとブロック付きメソッドとイテレータをうまく使うと綺麗に書ける。

* ディレクトリ名
* permission(oct)

に関する二次元配列を作成した上で、eachを用いてディレクトリを作成している。
mapはブロック内の処理を適用した値を要素とした配列を返却するので、dir_with_permという変数にその二次元配列を格納している。

手続き型のコードとの大きな違いは、「ディレクトリの作成に用いる情報群に対してテストコードを書くことができる」という点である。

ディレクトリ名とpermissionの二次元配列を作成しておくことで、ディレクトリ作成の処理を行う前にそれらの情報に対してバリデーションやテストコードを書くことが可能になるのは手続き型のコードでは実現が難しい大きな利点だ。

```
# 標準入力をもとに、作成するディレクトリ名の配列を作成する
dir_name, num_str = STDIN.gets.split
num = num_str.to_i
# ディレクトリ名の配列にしておけば、配列に対してのテストコードを書くことが可能になる。
dir_with_perm = (1..num).map{|n| [dir_name + n.to_s, n % 2 == 0 ? 0754 : 0705]}

# irb> dir_name = "midterm"
# irb> num_str = 10
# irb> num = num_str.to_i
# irb> dir_with_perm = (1..num).map{|n| [dir_name + n.to_s, n % 2 == 0 ? 0754 : 0705]}
# irb> p dir_with_perm
# [["midterm1", 453], ["midterm2", 492], ["midterm3", 453], ["midterm4", 492], ["midterm5", 453], ["midterm6", 492], ["midterm7", 453], ["midterm8", 492], ["midterm9", 453], ["midterm10", 492]]
# 453は8進数で705、492は754である。

dir_with_perm.each{|dir_with_perm| Dir.mkdir(dir_with_perm[0], dir_with_perm[1])}
```