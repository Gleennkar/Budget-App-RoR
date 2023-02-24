require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456')
  end

  context 'validation tests' do
    it 'is valid with attributes' do
      expect(@user).to be_valid
    end

    it 'name must be present' do
      @user.name = nil
      expect(@user).to_not be_valid
    end
  end
end
