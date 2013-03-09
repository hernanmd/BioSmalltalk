accessing
removeFormat: nameString
	" Remove the format nameString if found from the receiver's registry "

	(self formatFor: nameString)
		ifNotNilDo: [: fmt | 
			self registry 
				remove: fmt 
				ifAbsent: [ self signalNotFound: nameString ]].
	

			