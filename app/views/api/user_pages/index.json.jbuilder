json.user do |json|
	json.(@user, :name, :email)
	json.set! :status do |json|
		json.(@user.status, :automation, :imagination, :humor, :enhancement)
	end
end
