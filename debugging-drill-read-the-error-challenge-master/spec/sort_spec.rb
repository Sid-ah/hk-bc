require_relative "../sort"

describe 'sort' do
  let(:words) { %w{ all i can say is that my life is pretty plain } }
  let(:words_with_nil) { words.dup.insert(3, nil) }
  let(:mixed_array) { ["2", 1, "5", 4, "3"] }

  it "sorts the array" do
    expect(sort(words)).to eq ["all", "can", "i", "is", "is", "life", "my", "plain", "pretty", "say", "that"]
  end

  it "orders nil elements as empty strings" do
    expect(sort(words_with_nil)).to eq [nil, "all", "can", "i", "is", "is", "life", "my",  "plain", "pretty", "say", "that"]
  end

  it "sorts numbers and strings" do
    expect(sort(mixed_array)).to eq [1,"2","3",4,"5"]
  end
end
