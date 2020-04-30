module Api
  class AvatarController < ApplicationController
    def index
      image = current_user.avatar.image
      filetype = current_user.avatar.filetype
      send_data image, type: filetype, disposition: 'inline'
    end

    def update
      image = params[:avatar]
      correct_format(image)

      @avatar = current_user.avatar
      @avatar.filename = image.original_filename
      @avatar.filetype = image.content_type
      @avatar.image    = image.tempfile.read

      binding.pry

      if @avatar.save
        redirect_to root_path
      else
        response_bad_request
      end
    end

    private

    def correct_format(image)
      name = image.original_filename.split(".").first
      prefix = image.original_filename.split(".").last
      type = image.content_type.split("/").last
      return if prefix==type

      image.original_filename = "#{name}.#{type}"
    end

  end
end
