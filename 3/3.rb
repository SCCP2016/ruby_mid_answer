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
