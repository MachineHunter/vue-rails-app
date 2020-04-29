module Api
  class AvatarController < ApplicationController
    def index
      image = current_user.avatar.image
      filetype = current_user.avatar.filetype
      send_data image, type: filetype, disposition: 'inline'
    end

    def update
      image = params[:avatar]
      @avatar = current_user.avatar
      @avatar.filename = image.filename
      @avatar.filetype = image.content_type
      @avatar.image    = image.tempfile.read
      if @avatar.save
        redirect_to root_path
      else
        response_bad_request
      end
    end
  end
end
