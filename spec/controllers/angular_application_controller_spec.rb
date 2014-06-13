require 'rails_helper'

RSpec.describe AngularApplicationController, :type => :controller do

  before do
    session[:user_id] = Fabricate(:user).id
  end

  describe "GET index" do
    it "should render the index page" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
