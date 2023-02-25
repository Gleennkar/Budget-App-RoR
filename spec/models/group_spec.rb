require 'rails_helper'

RSpec.describe Group, type: :model do
  before :each do
    @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @group = Group.create(name: 'Microverse', icon: 'microverser.png', user: @user)
  end

  context 'validation tests' do
    it 'is valid with attributes' do
      expect(@group).to be_valid
    end

    it 'name must be present' do
      @group.name = nil
      expect(@group).to_not be_valid
    end

    it 'icon must be present' do
      @group.icon = nil
      expect(@group).to_not be_valid
    end
  end
end
