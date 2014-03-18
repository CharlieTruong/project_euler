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



class Problem4
  def solution(digit_count)
    potential_num = max_num(digit_count)
    found = false
    while !found
      potential_num = next_palindromic_num(potential_num)
      found = true if valid_factors?(potential_num, digit_count)
    end
    potential_num
  end

  private

  def next_palindromic_num(number)
    next_number = number - 1
    next_number -= 1 until palindromic?(next_number)
    next_number
  end

  def palindromic?(number)
    number == number.to_s.reverse.to_i    
  end

  def max_num(digit_count)
    num1 = (10 ** digit_count) - 1
    num2 = (10 ** digit_count) - 2
    num1 * num2
  end

  def valid_factors?(number, digit_count)
    possible_factor = (10 ** digit_count) - 1
    factors = Array.new
    while factors.length < 2
      if (number % possible_factor).zero?
        factors.push(possible_factor, number / possible_factor)
      else
        possible_factor -= 1
      end
    end
    within_bounds?(factors, digit_count)
  end

  def within_bounds?(factors, digit_count)
    upper_limit = (10 ** digit_count) - 1
    lower_limit =  10 ** (digit_count - 1)
    first_test = factors.first >= lower_limit && factors.first <= upper_limit
    second_test = factors.last >= lower_limit && factors.last <= upper_limit
    first_test && second_test
  end
end

class Problem5
  def solution(max_divisor)
    current_num = max_divisor
    while !all_divisible?(current_num, max_divisor)
      current_num += max_divisor
    end
    current_num
  end

  private

  def all_divisible?(current_num, max_divisor)
    divisible = true
    (1..max_divisor).each do |divisor|
        divisible = (current_num % divisor).zero?
        break if !divisible
    end
    divisible
  end
end
