get '/decks/:id' do 
	@deck = Deck.find_by(id: params[:id])
	#remaining_cards = Deck.find_by
	@cards = Card.where(deck_id: params[:id])

	@possible_card_ids = []

	@cards.each do |card|
		# binding.pry
		if Guess.where(card_id: card.id).last.guess_body != card.answer
		@possible_card_ids << card.id
		end
		@the_card_id = @possible_card_ids.sample
		binding.pry
		@the_card = Card.find(@the_card_id)
	end
	erb :'decks/decks'
end
	
	# @current_card_id = @possible_card_ids.shuffle.first
	# @current_card = Card.find_by_id(@current_card_id)
	# @question= @current_card.question
	# @answer= @current_card.answer
	#will store card ids.

post '/decks/:deck_id/:cards/:id' do 
	guess = Guess.create(guess_body: params[:guess_body], card_id: params[:id])
	
end 