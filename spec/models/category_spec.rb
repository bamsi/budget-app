require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'bamsi', email: 'bamsi@gmail.com', password: 'xyz@2022')
  end

  subject do
    described_class.new(name: 'Electronics', icon: 'https://cdn-icons-png.flaticon.com/512/3659/3659898.png', user: @user)
  end

  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid without icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end
end
