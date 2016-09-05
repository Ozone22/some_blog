require 'rails_helper'

describe 'User pages' do

  let(:user) { FactoryGirl.create(:user) }

  subject { page }

  describe 'Show page' do

    before do
      sign_in user
      visit user_path(user)
    end

    it { should have_content(user.login) }
    it { should have_link(nil, href: edit_user_registration_path) }

  end

  describe 'Index page' do

    before do
      @another_user = FactoryGirl.create(:user)
      sign_in user
      visit users_path
    end

    it { should have_link(user.login, href: user_path(user)) }
    it { should have_link(@another_user.login, href: user_path(@another_user)) }

  end

end