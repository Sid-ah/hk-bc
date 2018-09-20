require_relative '../html_whitespace_cleaner'

describe HTMLWhitespaceCleaner do
  describe '.clean' do
    it 'removes white space from between tags' do
      clean_html = HTMLWhitespaceCleaner.clean("<html>\n  <body>   <p> </p>\n  </body>\n</html>")
      expect(clean_html).to eq "<html><body><p></p></body></html>"
    end

    it 'ignores floating text between tags' do
      clean_html = HTMLWhitespaceCleaner.clean("<html><body> floating text <p></p></body></html>")
      expect(clean_html).to eq "<html><body> floating text <p></p></body></html>"
    end

    it 'strips any white space from the start and end' do
      clean_html = HTMLWhitespaceCleaner.clean("\r\n  <html><body><p></p></body></html>  \n  ")
      expect(clean_html).to eq "<html><body><p></p></body></html>"
    end

    it 'condenses one or more whitespace characters to one space' do
      clean_html = HTMLWhitespaceCleaner.clean("<html><body><p>Lorem      ipsum.\nDolor sit\n\namet.</p><p>Quem\n    mandamus \r\n\nmaiestatis at duo.</p></body></html>")
      expect(clean_html).to eq "<html><body><p>Lorem ipsum. Dolor sit amet.</p><p>Quem mandamus maiestatis at duo.</p></body></html>"
    end
  end
end
