require 'rails_helper'

RSpec.describe Contract, type: :model do
  before :each do
    @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456')

    @group = Group.create(name: 'Microverse', icon: 'microverser.png', user: @user)

    @contract = Contract.create(name: 'Microverse Transaction', amount: 100, user: @user)

    @contract.groups << @group
  end

  context 'validation tests' do
    it 'is valid with attributes' do
      expect(@contract).to be_valid
    end

    it 'name must be present' do
      @group.name = nil
      expect(@contract).to_not be_valid
    end

    it 'amount must be present' do
      @contract.amount = nil
      expect(@contract).to_not be_valid
    end

    it 'category must be present' do
      @contract.groups = []
      expect(@contract).to_not be_valid
    end
  end
end
