require 'rails_helper'

RSpec.describe 'Groups', type: :feature do
  before :each do
    @user = User.create(name: 'Jonah', email: 'jonakayizzi@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @group = Group.create(name: 'Microverse', icon: 'microverser.png', user: @user)

    sign_in(@user)
    visit groups_path
  end

  describe 'the group index page' do
    it 'displays the group name' do
      expect(page).to have_content(@group.name)
    end

    it 'displays the group icon' do
      expect(page).to have_css("img[  src='#{@group.icon}']")
    end

    it 'displays the group total' do
      expect(page).to have_content(@group.contract.sum(:amount))
    end

    it 'displays button to add a contract' do
      expect(page).to have_link('NEW GROUP')
    end
  end
end
