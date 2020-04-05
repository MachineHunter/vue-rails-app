json.practices do |json|
	 json.array!(@practices) do |practice|
 		 json.merge! practice.attributes
 	end
end
