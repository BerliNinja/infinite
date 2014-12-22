require 'rails_helper'

  describe IdeasController, type: :controller do
    it "renders index" do
      get :index
      expect(response.status).to eql 200
    end

  end