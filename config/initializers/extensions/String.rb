class String
	# strip! that returns self instead of nil if nothing was stripped
	def strip_or_self!
		strip! || self
	end

end