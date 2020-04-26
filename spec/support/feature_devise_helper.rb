module FeatureDevise

  def sign_in_without_factory(email, password)
    visit new_user_session_path
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    click_button 'Log in'
  end

  def sign_in_with_factory(user)
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  def sign_up(name, email, password, confirmation, avatar)
    visit new_user_registration_path
    fill_in 'user[name]', with: name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: confirmation
    attach_file('icon-input', avatar, make_visible: true)
    click_button 'Sign up'
  end

  def account_update(name, email, new_password, new_confirmation, old_password, avatar)
    visit edit_user_registration_path
    fill_in 'user[name]', with: name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: new_password
    fill_in 'user[password_confirmation]', with: new_confirmation
    fill_in 'user[current_password]', with: old_password
    attach_file 'dummy', avatar
    click_button 'Update'
  end
end
