class Problem1
  def solution(max_value)
    (1...max_value).select{|num| multiple_3_or_5?(num)}.reduce(:+)
  end

  private 

  def multiple_3_or_5?(num)
    (num % 3).zero? || (num % 5).zero?
  end
end

class Problem2
  def solution(max_value)
    fibonacci(max_value).select{|num| num.even?}.reduce(:+)
  end

  private

  def fibonacci(max_value, sequence = [1,2])
    next_fibonacci = sequence.last(2).reduce(:+)
    if next_fibonacci > max_value
      sequence
    else
      sequence.push(next_fibonacci)
      fibonacci(max_value, sequence)
    end
  end
end

