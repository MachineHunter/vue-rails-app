json.users do |json|
  json.array!(@users) do |user|
    json.merge! user.attributes
  end
end
