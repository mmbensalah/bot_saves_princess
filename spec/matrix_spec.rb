require_relative '../lib/matrix'

RSpec.describe Matrix do
  describe '#initialize' do
    it "initializes with matrix size from Input" do
      allow($stdin).to receive(:gets).and_return("3")
      size = $stdin.gets.to_i
      matrix = Matrix.new(size)

      expect(matrix.size).to eq(3)
    end
  end

  describe 'find positions' do
    before do
      size   = 3
      @matrix = Matrix.new(size)
      @matrix.instance_variable_set(:@matrix, [["-","-","-"],["-","m","-"],["p","-","-"]])
    end

    it "finds position for bot(m)" do
      bot = @matrix.find_bot_position
      expect(bot).to be_an_instance_of(Bot)
      expect(bot.coordinates).to eq([1,1])
    end

    it "finds position for princess(p)" do
      princess = @matrix.find_princess_position
      expect(princess).to be_an_instance_of(Princess)
      expect(princess.coordinates).to eq([0,2])
    end
  end
end
