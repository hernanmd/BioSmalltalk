initialize-release
initialize
	" Private - Initialize receiver's file formats. 
	self initialize "
	
	self registry: nil.
	self formatsCollection
		do: [: formatSpec |
				self 
					registerFormat: formatSpec first 
					extensions: formatSpec second
					description: formatSpec third
					rootClass: formatSpec fourth ]