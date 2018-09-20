require_relative '../chessboard'

describe 'generate_chessboard' do
  let(:board) { generate_chessboard }

  describe 'board structure' do
    it 'has eight rows' do
      expect(board.length).to eq 8
    end

    it 'has rows with eight spaces' do
      row_lengths = board.map(&:length)

      expect(row_lengths).to all(be 8)
    end
  end

  describe 'piece placement' do
    it 'has a first row of black backline pieces' do
      expect(board.first).to eq ['B Rook', 'B Knight', 'B Bishop', 'B Queen', 'B King', 'B Bishop', 'B Knight', 'B Rook']
    end

    it 'has a last row of while backline pieces' do
      expect(board.last).to eq ['W Rook', 'W Knight', 'W Bishop', 'W Queen', 'W King', 'W Bishop', 'W Knight', 'W Rook']
    end

    it 'has a second row of all black pawns' do
      expect(board[1]).to eq Array.new(8) { 'B Pawn' }
    end

    it 'has a second to last row of all white pawns' do
      expect(board[-2]).to eq Array.new(8) { 'W Pawn' }
    end

    it 'has four empty rows' do
      empty_rows_count = board.count { |row| row.all?(&:nil?) }
      expect(empty_rows_count).to eq 4
    end
  end
end
