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

      response_bad_request && return unless check_format(image)

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
      name = image.original_filename.split('.').first
      prefix = image.original_filename.split('.').last
      type = image.content_type.split('/').last

      # correct filename if prefix isn't right
      image.original_filename = "#{name}.#{type}" if prefix != type

      not_broken(image.tempfile)
    end

    def not_broken(file)
      begin
        header = file.read(8)
        file.seek(-12, IO::SEEK_END)
        footer = file.read(12)
        file.seek(0, IO::SEEK_SET)
      rescue StandardError
        file.seek(0, IO::SEEK_SET)
        return false
      end

      is_jpg = header[0, 2].unpack('H*') == %w[ffd8] && footer[-2, 2].unpack('H*') == %w[ffd9]
      is_gif = header[0, 3].unpack('A*') == %w[GIF] && footer[-1, 1].unpack('H*') == %w[3b]
      is_png = header[0, 8].unpack('H*') == %w[89504e470d0a1a0a] && footer[-12, 12].unpack('H*') == %w[0000000049454e44ae426082]

      return true if is_jpg || is_gif || is_png

      false
    end
  end
end
