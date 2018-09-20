require_relative '../in_loops'

describe 'methods calling blocks with next, break, and return' do
  describe 'loop_no_extras' do
    it '' do
      expected_value = (1..20).to_a
      expect(loop_no_extras).to eq expected_value
    end
  end

  describe 'loop_with_next' do
    it '' do
      expected_value = nil
      expect(loop_with_next).to eq expected_value
    end
  end

  describe 'loop_with_break' do
    it '' do
      expected_value = nil
      expect(loop_with_break).to eq expected_value
    end
  end

  describe 'loop_with_return' do
    it '' do
      expected_value = nil
      expect(loop_with_return).to eq expected_value
    end
  end
end
