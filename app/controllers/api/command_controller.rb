module Api
  class CommandController < ApplicationController
    def index
      @commands = current_user.command.all
    end

    def show
      @command = Command.find(params[:id])
      @zipdata = Command.find(params[:id]).command_file.zipdata.read
      @unzippeddata = unzip_file(@zipdata)
      @filetree = json_file_tree(@unzippeddata)
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

    def unzip_file(zipdata)
      files = []
      datas = []
      Zip::File.open_buffer(zipdata) do |ar|
        ar.each do |entry|
          unless entry.name[-1] == '/'
            files.push(entry.name)
            datas.push(entry.get_input_stream.read)
          end
        end
      end

      [files, datas]
    end

    def json_file_tree(_files)
      layerlist = file.map { |file_path| file_path.split('/') }
      structured_files = []
      layerlist.each do |layers|
        insert_file(layers, structured_files)
      end

      structured_files[0].to_json
    end

    def insert_file(layers_to_insert, current_directory)
      return if layers_to_insert.empty?

      head = layers_to_insert.first
      tail = layers_to_insert.slice(1, layers_to_insert.length)

      target = current_directory.find { |el| el[:name] == head }
      unless target
        target = {
          name: head,
          isfile: tail.empty?,
          children: []
        }
        current_directory.push(target)
      end

      insert_file(tail, target[:children])
    end
  end
end
