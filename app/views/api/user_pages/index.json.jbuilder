json.user do |json|
  json.call(@user, :name, :email)
  json.set! :status do |stats|
    stats.call(@user.status, :automation, :imagination, :humor, :enhancement)
  end
end
