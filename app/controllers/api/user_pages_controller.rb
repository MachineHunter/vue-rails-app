module Api
  class UserPagesController < ApplicationController
    def index
      @user = current_user
    end

    def avatar
      image = current_user.avatar.image
      type = current_user.avatar.type
      #send_data image, type: "image"
    end

  end
end
