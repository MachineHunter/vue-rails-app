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

  def sign_up(name, email, password, confirmation)
    visit new_user_registration_path
    fill_in 'user[name]', with: name
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: confirmation
    click_button 'Sign up'
  end

  def account_update(name, email, new_password, new_confirmation, old_password)
    visit edit_user_registration_path
    fill_in 'user[name]', with: name unless name == ''
    fill_in 'user[email]', with: email unless email == ''
    fill_in 'user[password]', with: new_password unless new_password == ''
    fill_in 'user[password_confirmation]', with: new_confirmation unless new_confirmation == ''
    fill_in 'user[current_password]', with: old_password
    click_button 'Update'
  end

  def avatar_update(avatar)
    attach_file 'avatar', avatar
    click_button '画像を更新する'
  end
end
