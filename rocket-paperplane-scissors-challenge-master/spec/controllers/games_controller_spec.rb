require 'rails_helper'

describe GamesController do
  let!(:game) { Game.create!(user_throw: Game::THROWS.sample) }

  describe "GET #index" do
    it "responds with status code 200"

    it "assigns the recent games as @games"

    it "renders the :index template"
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: game.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct game as @game" do
      get :show, { id: game.id }
      expect(assigns(:game)).to eq(game)
    end

    it "renders the :show template" do
      get :show, { id: game.id }
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200"

    it "assigns a new game to @game" do
      get :new
      expect(assigns(:game)).to be_a_new Game
    end

    it "renders the :new template"
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302"

      it "creates a new game in the database"

      it "assigns the newly created game as @game"

      it "sets a notice that the game was successfully created"

      it "redirects to the created game"
    end

    context "when invalid params are passed" do
      it "responds with status code 422: Unprocessable Entity" do
        post :create, { game: { user_throw: "pineapple" } }
        expect(response).to have_http_status 422
      end

      it "does not create a new game in the database"

      it "assigns the unsaved game as @game"

      it "renders the :new template"
    end
  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, { id: game.id }
      expect(response).to have_http_status 302
    end

    it "destroys the requested game" do
      expect { delete(:destroy, { id: game.id }) }.to change(Game, :count).by(-1)
    end

    it "sets a notice that the game was destroyed" do
      delete :destroy, { id: game.id }
      expect(flash[:notice]).to match /Game was successfully destroyed/
    end

    it "redirects to the games list" do
      delete :destroy, { id: game.id }
      expect(response).to redirect_to games_url
    end
  end
end
