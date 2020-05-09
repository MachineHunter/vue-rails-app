module Api
  class CommandController < ApplicationController
    require 'zip'

    def index
      @commands = current_user.command.all
    end

    def show
      @command = Command.find(params[:id])
      @command_file = @command.command_file
      @zipdata = @command_file.zipdata
      @unzippeddata = unzip_file(@zipdata)
      @filetree = json_file_tree(@unzippeddata.first)
      @filedatas = json_file_data(@unzippeddata)
    end

    def new
      @genres = Genre.all
      @command_types = CommandType.all
    end

    def create
      params[:zipdata] = params[:zipdata].tempfile.read
      @command = Command.new(command_params)
      @command.user_id = current_user.id
      @command.build_command_file

      @command.command_file.filename = params[:filename]
      @command.command_file.zipdata = params[:zipdata]

      if @command.save! && @command.command_file.save
        redirect_to command_pages_index_path
      else
        response_bad_request
      end
    end

    def destroy
      @command = Command.find(params[:id])
      if @command.destroy
        redirect_to command_pages_index_path
      else
        response_bad_request
      end
    end

    private

    def command_params
      params.permit(:title, :description, :genre_id, :command_type_id, :command_file_attributes)
    end

    def unzip_file(zipdata)
      files = []
      datas = []
      ::Zip::File.open_buffer(zipdata) do |ar|
        ar.each do |entry|
          unless entry.name[-1] == '/'
            files.push(entry.name)
            datas.push(entry.get_input_stream.read)
          end
        end
      end

      [files, datas]
    end

    def json_file_tree(files)
      layerlist = files.map { |file_path| file_path.split('/') }
      structured_files = []
      layerlist.each do |layers|
        insert_file(layers, structured_files)
      end

      structured_files[0]
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

    def json_file_data(unzippeddata)
      files, datas = unzippeddata
      files.map! { |file| file.split('/').last }
      Hash[*[files, datas].transpose.flatten]
    end
  end
end
