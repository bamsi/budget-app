require 'rails_helper'

RSpec.describe 'Expenditures', type: :request do
  before(:each) do
    @user = User.create(name: 'bamsi', email: 'bamsi@gmail.com', password: 'xyz@2022')
    @category = Category.create(name: 'Electronics', icon: 'https://cdn-icons-png.flaticon.com/512/3659/3659898.png', user_id: @user.id)
    @expenditure = Expenditure.create(name: 'Radio', amount: 200, author: @user, category_id: @category.id)
    login_as(@user)
  end

  describe 'GET #index' do
    it 'returns a 200 status code' do
      get category_expenditures_path(@category.id)
      expect(response).to have_http_status(200)
    end
    it 'render category template' do
      get category_expenditures_path(@category.id)
      expect(response).to render_template('index')
    end

    it 'the response body includes correct placeholder' do
      get category_expenditures_path(@category.id)
      expect(response.body).to include('Add Transaction')
    end
  end

  describe 'GET #new' do
    it 'returns a 200 status code' do
      get new_category_expenditure_path(@category.id)
      expect(response).to have_http_status(200)
    end

    it 'render show template' do
      get new_category_expenditure_path(@category.id)
      expect(subject).to render_template('new')
    end
    it 'the response body includes correct placeholder' do
      get new_category_expenditure_path(@category.id)
      expect(response.body).to include('Add Transaction')
    end
  end
end
