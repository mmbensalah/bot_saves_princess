require 'rspec'
require_relative '../save_princess'

RSpec.describe SavePrincess do
  context 'builds matrix' do
    it 'creates matrix corresponding to input size' do
      input_size = 3
      save_princess = SavePrincess.new(input_size)
      matrix = save_princess.build_matrix
      expect(matrix.class).to eq Array
    end
  end
end
