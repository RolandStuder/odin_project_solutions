module Matcher
  def peg_match(code_one,code_two)
    code_one = code_one.dup
    code_two = code_two.dup

    correct_positions = 0
    correct_colors = 0

    code_one.each_with_index do |peg, i|
      if peg == code_two[i]
        correct_positions += 1
        code_one[i] = nil # So it will be no longer used
        code_two[i] = nil # So it will be no longer used
      end
    end

    code_one.each_with_index do |peg, i|
      if !peg.nil? && code_two.include?(peg)
        correct_colors += 1
        code_two.delete_at(code_two.index(peg))
      end
    end
    {positions: correct_positions, colors: correct_colors}
  end
  
end