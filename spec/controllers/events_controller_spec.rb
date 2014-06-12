require 'rails_helper'

RSpec.describe EventsController, :type => :controller do

  context "user not authenticated" do
    describe "GET index" do
      it "redirects the user to sign in page" do
        get :index
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context "A user that is logged in" do
    let(:user) { Fabricate(:user) }

    before do
      session[:user_id] = user.id
    end

    describe "GET index" do
      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end
