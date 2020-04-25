module Api
  class UserPagesController < ApplicationController
    def index
      @user = current_user
      @avatar = current_user.avatar.filename
    end
  end
end
