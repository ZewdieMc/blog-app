require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "returns 200 http status and success" do
      get users_path
      expect(response).to have_http_status(200)
      expect(response).to be_successful
    end
    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end
     it 'the response body includes correct placeholder text.' do
      get users_path
      expect(response.body).to include("Here is a list of users")
     end
  end
  describe "GET /users/:id" do
    before(:all) do
      @user = User.create(name: 'John Doe', posts_counter: 0)
    end
    it "returns 200 http status and success" do
      get user_path(@user)
      expect(response).to have_http_status(200)
      expect(response).to be_successful
    end
    it 'renders the show template' do
      get user_path(@user)
      expect(response).to render_template(:show)
    end
    it 'the response body includes correct placeholder text.' do
      get user_path(@user)
      expect(response.body).to include("These are details of the user")
    end
  end
end