require 'rails_helper'

RSpec.describe Category, type: :feature do
  before :each do
    @user = User.create(name: 'bamsi', email: 'bamsi@gmail.com', password: 'xyz@2022')
    @category = Category.create(name: 'Electronics', icon: 'https://cdn-icons-png.flaticon.com/512/3659/3659898.png', user_id: @user.id)
    login_as(@user)
    visit categories_path
  end

  context 'Category index page' do
    it 'I can see the name of category' do
      expect(page).to have_content('Electronics')
    end

    it 'I can see the icon' do
      expect(page.html).to include('https://cdn-icons-png.flaticon.com/512/3659/3659898.png')
    end

    it 'When I click on a add category, it redirects new category form' do
      click_button 'Add Category'
      expect(page).to have_content('Name')
    end
  end
end
