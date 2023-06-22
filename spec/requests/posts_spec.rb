require 'rails_helper'

RSpec.describe "Posts", type: :request do
describe "GET /users/:id/posts" do
  before(:all) do
    @user = User.create(name: 'John Doe', posts_counter: 0)
  end
  it "returns 200 http status and success" do
    get user_posts_path(@user)
    expect(response).to have_http_status(200)
    expect(response).to be_successful
  end
  it 'renders the index template' do
    get user_posts_path(@user)
    expect(response).to render_template(:index)
  end
  it 'the response body includes correct placeholder text.' do
    get user_posts_path(@user)
    expect(response.body).to include("Here is a list of posts by a given user")
  end
end
end