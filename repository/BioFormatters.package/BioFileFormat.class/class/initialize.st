initialize-release
initialize
	" Private - Initialize receiver's file formats. 
	self initialize "
	
	self registry: nil.
	self formatCollection
		do: [: formatSpec |
				self 
					registerFormat: formatSpec first 
					extensions: formatSpec second
					description: formatSpec third
					rootClass: formatSpec fourth ]