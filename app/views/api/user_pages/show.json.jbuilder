json.user do |json|
  json.call(@user, :id, :name)
  json.set! :status do |stats|
    stats.call(@status, :automation, :imagination, :humor, :enhancement)
  end
end
