module Api
  class CommandController < ApplicationController
    def index
      @commands = current_user.command.all
    end

    def new
      @genres = Genre.all
      @command_types = CommandType.all
    end

    def create
      params[:zipdata] = params[:zipdata].tempfile.read
      @command = Command.new(command_params)
      @command.command_file = CommandFile.new(command_file_params)

      if @command.command_file.save && @command.save
        redirect_to command_pages_index_path
      else
        response_bad_request
      end
    end

    private

    def command_params
      params.permit(:title, :description, :genre_id, :command_type_id)
    end

    def command_file_params
      params.permit(:filename, :zipdata)
    end
  end
end
