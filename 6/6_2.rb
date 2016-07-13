# 手続き型のコードではこんな感じ
dir_name, dir_num = STDIN.gets.split
dir_num = dir_num.to_i

for i in 1..dir_num do
    if i % 2 == 1 then
        Dir.mkdir(dir_name + i.to_s, 0705)
    else
        Dir.mkdir(dir_name + i.to_s, 0754)
    end
end
