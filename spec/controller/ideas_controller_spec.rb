require 'rails_helper'

  describe IdeasController, type: :controller do
    it "renders index" do
      get :index
      expect(response.status).to eql 200
    end

    context 'with valid parameters submitted' do
      describe 'POST create' do
        it "creates an idea" do
          expect { post :create, { idea: { title: 'foo', description: 'bar'} } }.to change { Idea.count }
          expect(response.status).to eql 302
        end
      end
    end

  end