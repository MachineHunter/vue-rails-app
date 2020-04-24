module Authentication
  def login(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end

  def logout
    @user = nil
    @auth_token = nil
  end
end
