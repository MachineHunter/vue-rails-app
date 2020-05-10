json.set! :command, @command
json.set! :filename, @command_file.filename
json.filetree do
  json.merge! @filetree
end
json.set! :filedatas, @filedatas
json.set! :index_url, @index_url
