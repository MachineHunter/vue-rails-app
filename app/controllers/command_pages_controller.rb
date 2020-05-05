require 'zipruby'

class CommandPagesController < ApplicationController
  def index; end

  def new; end

  def show
    @zipdata = Command.find(params[:id]).command_file.zipdata.read
    @unzippeddata = unzip_file(@zipdata)
    @filetree = json_file_tree(@unzippeddata)
    render json: @filetree
  end

  private

  def unzip_file(zipdata)
    files = []
    datas = []
    Zip::Archive.open_buffer(zipdata) do |ar|
      ar.num_files.times do |i|
        path = ar.get_name(i)
        unless path[-1] == '/'
          files.push(path)
          datas.push(ar.fopen(path).read)
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
