json.genres @genres do |genre|
  json.merge! genre.attributes
end
json.command_types @command_types do |command_type|
  json.merge! command_type.attributes
end
