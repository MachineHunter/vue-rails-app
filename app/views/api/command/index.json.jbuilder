json.command do |json|
  json.array!(@commands) do |command|
    command.array! command.attributes
  end
end
