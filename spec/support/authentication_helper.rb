def sign_in(user)
  visit new_user_session_path
  fill_in 'Email', with: user.email
  fill_in 'Пароль', with: user.password
  click_button 'Вход'
end

def sign_up(user_attributes)
  visit new_user_registration_path
  fill_in 'Email', with: user_attributes[:email]
  fill_in 'Логин', with: user_attributes[:login]
  fill_in 'Пароль', with: user_attributes[:password]
  fill_in 'Подтверждение пароля', with: user_attributes[:password_confirmation]
  click_button 'Регистрация'
end