require_relative 'euler'

describe Problem1 do
  describe '#solution' do
    it 'returns the sum of numbers that are multiples of 3 or 5 below a given value' do 
      expect(Problem1.new.solution(10)).to eq(23)
    end
  end  
end

describe Problem2 do
  describe '#solution' do
    it 'returns the sum of the even numbers in the Fibonacci sequence up to a given number' do
      expect(Problem2.new.solution(100)).to eq(44)
    end
  end
end

describe Problem3 do
  describe '#solution' do
    it 'returns the largest prime factor for a given number' do
      expect(Problem3.new.solution(13195)).to eq(29)
    end
  end
end


