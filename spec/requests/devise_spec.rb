require 'rails_helper'

describe 'Devise generated pages' do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }

  describe 'Authorization' do

    describe 'Sign in page' do

      before { sign_in user }

      it { should have_content(user.login) }
      it { should have_link(nil, href: destroy_user_session_path ) }
      it { should have_content('Вход в систему выполнен') }

    end

    describe 'Sign up page' do

      let(:new_user) { FactoryGirl.attributes_for(:user) }

      before { sign_up new_user }

      it { should have_content(new_user[:login]) }
      it { should have_link(nil, href: destroy_user_session_path ) }
      it { should have_content('Добро пожаловать! Вы успешно зарегистрировались') }
    end

    describe 'Sign out' do

      before do
        sign_in user
        click_link(nil, href: destroy_user_session_path, match: :first)
      end

      it { should have_content('Выход из системы выполнен.') }

    end

  end

  describe 'Edit' do

    before do
      sign_in user
      visit edit_user_registration_path
    end

    it { should have_content('Настройки') }

    describe 'with invalid information' do

      before { click_button 'Обновить' }

      it { should have_selector('div.alert.alert-danger') }

    end

    describe 'with valid information' do

      before do
        fill_in 'Логин', with: 'newLogin'
        fill_in 'Текущии пароль', with: user.password
        fill_in 'Пароль', with: user.password
        fill_in 'Пароль (еще раз)', with: user.password
        click_button 'Обновить'
      end

      it { should have_content('успешно изменена') }
      it { should have_selector('div.alert.alert-info') }
      specify { expect(user.reload.login).to eq('newLogin') }
    end
  end

end