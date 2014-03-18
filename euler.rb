class Problem1
  def solution(max_value)
    (1...max_value).select{|num| multiple_3_or_5?(num)}.reduce(:+)
  end

  private 

  def multiple_3_or_5?(num)
    (num % 3).zero? || (num % 5).zero?
  end
end

