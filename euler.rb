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

class Problem3
  def solution(number)
    prime_factors = Array.new
    current_prime = 2
    while current_prime <= number
      prime_factors.push(current_prime) if divisible?(number, current_prime)
      number = number / current_prime while divisible?(number, current_prime)
      current_prime = next_prime(current_prime)
    end
    prime_factors.max
  end

  private

  def next_prime(current_num) 
    potential_prime = current_num + 1
    potential_prime += 1 until is_prime?(potential_prime)
    potential_prime
  end

  def is_prime?(num)
    prime = true
    (2...num).each do |factor|
      prime = !divisible?(num, factor)
      break if !prime
    end
    prime 
  end

  def divisible?(num, factor)
    (num % factor).zero?
  end
end


