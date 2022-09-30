require 'rails_helper'

RSpec.describe Expenditure, type: :model do
  before(:each) do
    @user = User.create(name: 'bamsi', email: 'bamsi@gmail.com', password: '12345')
    @user.save
    @category = Category.create(name: 'Electronics', icon: 'https/icon.com/electronics', user_id: @user.id)
  end

  subject do
    described_class.new(name: 'Electronics', amount: 200, author: @user, category: @category)
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid when amount is negative' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
