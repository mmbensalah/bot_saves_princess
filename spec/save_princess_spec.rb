require 'rspec'
require 'stringio'
require_relative '../save_princess'

RSpec.describe SavePrincess do
  describe '#build_matrix' do
    it 'creates matrix corresponding to input size' do
      input_size = 3
      save_princess = SavePrincess.new(input_size)
      expect(save_princess.build_matrix.count).to eq(3)
      expect(save_princess.build_matrix.class).to eq(Array)
    end
    it 'creates correct path when princess in 0,0 position' do
      input_size = 3
      save_princess = SavePrincess.new(input_size)
      save_princess.stub(:completed_matrix) { [["p","-","-"],["-","m","-"],["-","-","-"]] }
      expect(save_princess.display_path_to_princess).to include("LEFT" "UP")
    end

    it 'creates correct path when princess in 0,2 position' do
      input_size = 3
      save_princess = SavePrincess.new(input_size)
      save_princess.stub(:completed_matrix) { [["-","-","-"],["-","m","-"],["P","-","-"]] }
      expect(save_princess.display_path_to_princess).to include("LEFT" "DOWN")
    end

    it 'creates correct path when princess in 2,0 position' do
      input_size = 3
      save_princess = SavePrincess.new(input_size)
      save_princess.stub(:completed_matrix) { [["-","-","p"],["-","m","-"],["-","-","-"]] }
      expect(save_princess.display_path_to_princess).to include("RIGHT" "UP")
    end

    it 'creates correct path when princess in 2,2 position' do
      input_size = 3
      save_princess = SavePrincess.new(input_size)
      save_princess.stub(:completed_matrix) { [["-","-","-"],["-","m","-"],["-","-","p"]] }
      expect(save_princess.display_path_to_princess).to include("RIGHT" "DOWN")
    end
  end
end
