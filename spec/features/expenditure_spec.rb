require 'rails_helper'

RSpec.describe Expenditure, type: :feature do
  before :each do
    @user = User.create(name: 'bamsi', email: 'bamsi@gmail.com', password: 'xyz@2022')
    @category = Category.create(name: 'Electronics', icon: 'https://cdn-icons-png.flaticon.com/512/3659/3659898.png', user_id: @user.id)
    @expenditure = Expenditure.create(name: 'Radio', amount: 200, author: @user, category_id: @category.id)
    login_as(@user)
    visit category_expenditures_path(@category.id)
  end

  context 'Transaction index page' do
    it 'I can see the name of transaction' do
      expect(page).to have_content('Radio')
    end

    it 'I can see the amount' do
      expect(page.html).to include('200')
    end

    it 'When I click on a add transaction, it redirects new transaction form' do
      click_button 'Add Transaction'
      expect(page).to have_content('Amount')
    end
  end
end
