require './lib/offset_generator'

RSpec.describe OffsetGenerator do
  describe 'initialization, parsing and code generation' do
    date = Date.new(1995, 8, 4)
    offset_gen = OffsetGenerator.new(date)
    expected_code = [1, 0, 2, 5]

    it 'returns a date' do
      expect(offset_gen.date_code).to be_instance_of Array
    end

    it 'returns four digit code number' do
      allow(offset_gen).to receive(:parse_input_date) do
        40895
      end
      expect(offset_gen.create_date_code(date)).to eq expected_code
    end

    it 'returns valid offsets' do
      allow(offset_gen).to receive(:date_code) do
        expected_code
      end
      expect(offset_gen.generate(:A)).to eq 1
      expect(offset_gen.generate(:B)).to eq 0
      expect(offset_gen.generate(:C)).to eq 2
      expect(offset_gen.generate(:D)).to eq 5
    end
  end
end
