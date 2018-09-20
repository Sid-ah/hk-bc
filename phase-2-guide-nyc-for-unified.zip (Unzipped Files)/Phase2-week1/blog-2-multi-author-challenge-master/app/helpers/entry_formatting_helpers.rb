module EntryFormatting
  def stub(text)
    return text if less_than_26_words_long?(text)
    first_25_words(text) +  '...'
  end

  private
  def less_than_26_words_long?(text)
    !(text.match first_25_words_regex)
  end

  def first_25_words(text)
    text.slice first_25_words_regex
  end

  def first_25_words_regex
    /\A(\S+\s){25}/
  end
end

helpers EntryFormatting
