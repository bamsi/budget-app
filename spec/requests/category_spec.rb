require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  before(:each) do
    @user = User.create(name: 'bamsi', email: 'bamsi@gmail.com', password: 'xyz@2022')
    @category = Category.create(name: 'Electronics', icon: 'https://cdn-icons-png.flaticon.com/512/3659/3659898.png', user_id: @user.id)
    login_as(@user)
  end

  describe 'GET #index' do
    it 'returns a 200 status code' do
      get categories_path
      expect(response).to have_http_status(200)
    end
    it 'render category template' do
      get categories_path
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder' do
      get categories_path
      expect(response.body).to include('Add Category')
    end
  end

  describe 'GET #new' do
    it 'returns a 200 status code' do
      get new_category_path
      expect(response).to have_http_status(200)
    end

    it 'render show template' do
      get new_category_path
      expect(subject).to render_template('new')
    end
    it 'the response body includes correct placeholder' do
      get new_category_path
      expect(response.body).to include('Add Category')
    end
  end
end
