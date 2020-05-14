json.command @commands do |command|
  json.merge! command.attributes
  json.owner do
    json.extract! command.user, :name, :id
  end
end
