require "rails_helper"

RSpec.describe CardsController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "renders the show template if item found"
    card = FactoryGirl.create(:card)
    get :show, {id: card.id}
    expect(response).to render_template("show")
  end

end

