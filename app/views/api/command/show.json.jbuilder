json.set! :command, @command
json.set! :filename, @command_file.filename
json.filetree do
  json.merge! @filetree
end
json.set! :filedatas, @filedatas
