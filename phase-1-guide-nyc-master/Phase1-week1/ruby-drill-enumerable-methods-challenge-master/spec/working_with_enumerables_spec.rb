require_relative '../working_with_enumerables'

describe "containing_quotes" do
  it "returns a new array containing the sentences with quotes in them" do
    sentences = ['Someone yelled, "Oi!"', 'They went thataway!', 'They sang, "Oo-ee-oo ..."']

    sentences_with_quotes = containing_quotes(sentences)
    expect(sentences_with_quotes).to match_array ['Someone yelled, "Oi!"', 'They sang, "Oo-ee-oo ..."']
  end

  it "does not match delimit quotes with single quotes" do
    sentences = ["Someone yelled, 'Oi!'"]

    sentences_with_quotes = containing_quotes(sentences)
    expect(sentences_with_quotes).to match_array []
  end

  it "does not modify the input array" do
    sentences = ['Someone yelled, "Oi!"', 'They went thataway!', 'They sang, "Oo-ee-oo ..."']
    containing_quotes(sentences)

    expect(sentences).to eq ['Someone yelled, "Oi!"', 'They went thataway!', 'They sang, "Oo-ee-oo ..."']
  end
end

describe "balance" do
  it "returns the remaining balance after subtracting all expenses from the starting balance" do
    expenses = [100, 100, 50, 100]
    starting_balance = 500

    remaining_balance = balance(expenses, starting_balance)
    expect(remaining_balance).to eq 150
  end

  it "can return a negative balance" do
    expenses = [100, 100, 50, 100]
    starting_balance = 300

    remaining_balance = balance(expenses, starting_balance)
    expect(remaining_balance).to eq -50
  end

  it "does not modify the input array" do
    expenses = [100, 100, 50, 100]
    starting_balance = 500
    balance(expenses, starting_balance)

    expect(expenses).to eq [100, 100, 50, 100]
  end
end

describe "finding a word with an even number of characters" do
  it "returns the first word with an even number of characters" do
    words = ["a", "be", "cat", "disc"]

    found_word = even_length_word(words)

    expect(found_word).to eq "be"
  end

  it "does not find empty strings" do
    words = ["", "a", "be", "cat", "disc"]

    found_word = even_length_word(words)

    expect(found_word).to eq "be"
  end

  it "returns nil if no word has an even number of characters" do
    words = ["a", "I"]

    found_word = even_length_word(words)

    expect(found_word).to eq nil
  end

  it "does not modify the input array" do
    words = ["a", "be", "cat", "disc"]
    even_length_word(words)

    expect(words).to eq ["a", "be", "cat", "disc"]
  end
end

describe "snippets" do
  it "returns a new array containing the first X words of each string followed by an ellipsis" do
    sentences = ["One two three four.", "Eins zwei drei vier."]
    desired_word_count = 2

    snipped_sentences = snippets(sentences, 2)
    expect(snipped_sentences).to eq ["One two ...", "Eins zwei ..."]
  end

  it "defaults to three words" do
    sentences = ["One two three four.", "Eins zwei drei vier."]

    snipped_sentences = snippets(sentences)
    expect(snipped_sentences).to eq ["One two three ...", "Eins zwei drei ..."]
  end

  it "does not snip sentences with fewer words than the desired snippet word count" do
    sentences = ["One two three four.", "Eins zwei drei vier."]
    desired_word_count = 5

    snipped_sentences = snippets(sentences, desired_word_count)
    expect(snipped_sentences).to eq ["One two three four.", "Eins zwei drei vier."]
  end

  it "does not modify the input array" do
    sentences = ["One two three four.", "Eins zwei drei vier."]

    snippets(sentences)
    expect(sentences).to eq ["One two three four.", "Eins zwei drei vier."]
  end
end

describe "initials" do
  it "returns a new array containing the initials of each name" do
    names = ["Eirene Roderick", "Barbara Foster", "Milan Penny"]

    names_as_initials = initials(names)
    expect(names_as_initials).to eq ["ER", "BF", "MP"]
  end

  it "works with middle names" do
    names = ["Eirene Rose Roderick"]

    names_as_initials = initials(names)
    expect(names_as_initials).to eq ["ERR"]
  end

  it "capitalizes each initial" do
    names = ["eirene roderick"]

    names_as_initials = initials(names)
    expect(names_as_initials).to eq ["ER"]
  end

  it "does not modify the input array" do
    names = ["Eirene Roderick", "Barbara Foster", "Milan Penny"]
    initials(names)

    expect(names).to eq ["Eirene Roderick", "Barbara Foster", "Milan Penny"]
  end
end

describe "pair_abbreviations" do
  it "pairs full forms with their abbreviations" do
    state_data = [["OH", "Ohio"], ["MI", "Michigan"], ["IL", "Illinois"]]

    pairs = pair_abbreviations(state_data)
    expect(pairs).to eq({ "Ohio" => "OH", "Michigan" => "MI", "Illinois" => "IL" })
  end

  it "does not modify the input array" do
    state_data = [["OH", "Ohio"], ["MI", "Michigan"], ["IL", "Illinois"]]
    pair_abbreviations(state_data)

    expect(state_data).to eq [["OH", "Ohio"], ["MI", "Michigan"], ["IL", "Illinois"]]
  end
end
