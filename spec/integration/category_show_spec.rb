require 'rails_helper'

RSpec.describe ' Groups', type: :feature do
  before :each do
    @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456')
    @group = Group.create(name: 'Microverse', icon: 'microverser.png', user: @user)

    @contract = Contract.create(name: 'Microverse Contract', amount: 100, user: @user)

    @contract.groups << group

    sign_in(@user)
    visit group_path(@group)
  end

  describe 'the group show page' do
    it 'displays the group name' do
      expect(page).to have_content(@group.name)
    end

    it 'displays the groupy icon' do
      expect(page).to have_css("img[  src='#{@group.icon}']")
    end

    it 'displays the group total' do
      expect(page).to have_content(@group.Contract.sum(:amount))
    end

    it 'displays button to add a contract' do
      expect(page).to have_link('NEW CONTRACT')
    end
  end
end
