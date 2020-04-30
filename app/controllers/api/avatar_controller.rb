module Api
  class AvatarController < ApplicationController
    def index
      image = current_user.avatar.image
      filetype = current_user.avatar.filetype
      send_data image, type: filetype, disposition: 'inline'
    end

    def update
      image = params[:avatar]
      return if image.nil?

      response_bad_request and return unless check_format(image)

      @avatar = current_user.avatar
      @avatar.filename = image.original_filename
      @avatar.filetype = image.content_type
      @avatar.image    = image.tempfile.read

      if @avatar.save
        redirect_to root_path
      else
        response_bad_request
      end
    end

    private

    def check_format(image)
      name = image.original_filename.split(".").first
      prefix = image.original_filename.split(".").last
      type = image.content_type.split("/").last

      # correct format if prefix isn't right
      image.original_filename = "#{name}.#{type}"

      return not_broken(image.tempfile)
    end

    def not_broken(file)
      begin
        header = file.read(8)
        file.seek(-12, IO::SEEK_END)
        footer = file.read(12)
      rescue
        return false
      end

      if header[0,2].unpack('H*') == %w(ffd8) && footer[-2, 2].unpack('H*') == %w(ffd9) # jpg
        return true
      elsif header[0,3].unpack('A*') == %w(GIF) && footer[-1, 1].unpack('H*') == %w(3b) # gif
        return true
      elsif header[0,8].unpack('H*') == %w(89504e470d0a1a0a) && footer[-12,12].unpack('H*') == %w(0000000049454e44ae426082) # png
        return true
      else
        return false
      end
    end

  end
end
