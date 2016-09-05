require 'rails_helper'

describe 'Base admin test' do

  subject { page }

  describe 'Simple user access' do

    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      visit admin_root_path
    end

    it { should have_content('Недостаточно прав') }
    it { should have_selector('div.alert-info') }
  end

  describe 'Admin user access' do

    let(:admin) { FactoryGirl.create(:admin) }

    before do
      sign_in admin
      visit admin_root_path
    end

    it { should have_content('Admin') }

  end
end