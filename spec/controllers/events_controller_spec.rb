require 'rails_helper'

RSpec.describe EventsController, :type => :controller do

  context "attemptint to browse events without authentication" do
    describe "GET index" do
      it "redirects the user to sign in page" do
        get :index
        expect(response).to redirect_to sign_in_path
      end
    end
  end

  context "A user that is logged visits his events" do
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

    describe "POST create" do
      it "creates a new event" do
        post :create, :format => :json, :event => {title: "the title", description: "the description", 
                                                   start_time: Time.zone.now.to_s, end_time: (Time.zone.now+1.hour).to_s}
        expect(response.code).to eq('201')
      end
    end
  end
end
