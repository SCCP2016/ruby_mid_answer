# 手続き型の解答。理解しにくい
male = STDIN.gets.split
female = STDIN.gets.split

# あふれた分の人は結婚できないので、苗字を書き換える人を少ない方に合わせる
n = (male.size > female.size) ? female.size : male.size

# 文字がキャピタルかどうかを真偽値で返す関数
def is_upper?(ch)
    ('a'.ord <= ch.ord && ch.ord <= 'z'.ord) ? false : true
end

# 入力文字列を苗名に分割する関数
def split_name(name)
    # 名前の部分にあたる配列
    ret = []
    # 入力文字列を一文字ずつに分割した配列のコピー
    o_name = name.chars
    while true do
        a = o_name.pop
        if a != nil then
            # 文字列の尻から取り出した文字が大文字ならループを脱出する
            if is_upper?(a) then
                ret.push(a)
                break
            end
        end
        ret.push(a)
        # 上記の処理で、「retにはo_nameの末尾から最初に衝突する大文字までの文字列が逆順に格納されている」という状況ができる
    end
    # o_nameには苗字のみが残されており、retには名前が逆順に格納されているので配列として返却
    return [o_name.join, ret.reverse.join]
end

for i in 0..n-1 do
    puts split_name(male[i])[0] + split_name(female[i])[1]
end

# RubyTaro

# lname: RubyTar
# fname: o

# lname: RubyTa
# fname: or

# lname: RubyT
# fname: ora

# lname: Ruby
# fname: oraT

# LstName: Ruby
# FstName: Taro
