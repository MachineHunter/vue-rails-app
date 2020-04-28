# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    # before_action :configure_sign_up_params, only: [:create]
    # before_action :configure_account_update_params, only: [:update]

    # GET /resource/sign_up
    def new
      @user = User.new
    end

    # POST /resource
    def create
      @user = User.new(user_params)
      @user.build_status
      @user.build_avatar

      @avatar = params[:user][:image]
      @user.avatar.filename = @avatar.original_filename
      @user.avatar.filetype = @avatar.content_type
      @user.avatar.image = @avatar.tempfile.read

      sign_in(@user) if @user.save
      redirect_to root_path
    end

    # GET /resource/edit
    # def edit
    #   super
    # end

    # PUT /resource
    def update
      # 力技故いつかリファクタしたい
      @user = current_user
      @user.name = params[:user][:name]
      @user.password = params[:password]
      @avatar = params[:user][:image]
      @user.avatar.filename = @avatar.original_filename
      @user.avatar.filetype = @avatar.content_type
      @user.avatar.image = @avatar.tempfile.read
      redirect_to root_path if @user.save && @user.avatar.save
    end

    # DELETE /resource
    # def destroy
    #   super
    # end

    # GET /resource/cancel
    # Forces the session data which is usually expired after sign
    # in to be expired now. This is useful if the user wants to
    # cancel oauth signing in/up in the middle of the process,
    # removing all OAuth session data.
    # def cancel
    #   super
    # end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_up_params
    #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
    # end


    # If you have extra params to permit, append them to the sanitizer.
    # def configure_account_update_params
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
    # end

    # The path used after sign up.
    # def after_sign_up_path_for(resource)
    #   super(resource)
    # end

    # The path used after sign up for inactive accounts.
    # def after_inactive_sign_up_path_for(resource)
    #   super(resource)
    # end

    private

    def user_params
      params.require(:user).permit(:name, :password, :email, :password_confirmation, :current_password, :image)
    end
  end
end
