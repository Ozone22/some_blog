require 'rails_helper'

describe 'Admin user pages' do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }

  before do
    @another_user = FactoryGirl.create(:user)
    sign_in admin
  end

  describe 'index page' do

    before { visit admin_users_path }

    it { should have_link(@another_user.login, href: admin_user_path(@another_user)) }
    it { should have_link('изменить', href: edit_admin_user_path(@another_user)) }
    it { should have_link('удалить', href: admin_user_path(@another_user)) }
    it { should_not have_link('удалить', href: admin_user_path(admin)) }

  end

  describe 'show page' do

    before { visit admin_user_path(@another_user) }

    it { should have_content(@another_user.login) }

  end

  describe 'edit page' do

    before { visit edit_admin_user_path(@another_user) }

    it { should have_content(@another_user.login) }

    describe 'fill with invalid data' do

      before { click_button 'Изменить' }

      it { should have_selector('div.alert.alert-danger') }

    end

    describe 'fill with valid data' do

      before do
        fill_in 'Логин', with: 'newLogin'
        fill_in 'Email', with: @another_user.email
        fill_in 'Пароль', with: @another_user.password
        fill_in 'Пароль (еще раз)', with: @another_user.password

        click_button 'Изменить'
      end

      it { should have_selector('div.alert.alert-info') }
      it { should have_content('изменен') }
      specify { expect(@another_user.reload.login).to eq('newLogin') }

    end

  end
end