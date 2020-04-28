module Api
  class UserPagesController < ApplicationController
    def index
      @user = current_user
    end

    def avatar
      image = current_user.avatar.image
      filetype = current_user.avatar.filetype
      send_data image, type: filetype, disposition: 'inline'
    end
  end
end
