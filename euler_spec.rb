require_relative 'euler'

describe Problem1 do
  describe '#solution' do
    it 'returns the sum of numbers that are multiples of 3 or 5 below a given value' do 
      expect(Problem1.new.solution(10)).to eq(23)
    end
  end  
end

