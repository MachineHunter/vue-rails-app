class CommandPagesController < ApplicationController

  def index; end

  def show
    @zipdata = Command.find(params[:id]).command_file
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

    return [files, datas]
  end

  def json_file_tree(files)
    layerlist = file.map { |filePath| filePath.split('/') }
    structuredFiles = []
    layerlist.each do |layers|
      insertFile(layers, structuredFiles)
    end

    return structuredFiles[0].to_json
  end


  def insertFile(layersToInsert, currentDirectory)
    return if layersToInsert.length===0

    head = layersToInsert.first
    tail = layersToInsert.slice(1, layersToInsert.length)

    target = currentDirectory.find { |el| el[:name]===head }
    unless target
      target = {
        name: head,
        isfile: tail.length === 0 ? true : false,
        children: []
      }
      currentDirectory.push(target)
    end

    insertFile(tail, target[:children])
  end

end
