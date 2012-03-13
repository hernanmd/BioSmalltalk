private
validateParameters: parameters
	" Answer <false> if parameters are valid for receiver's current command "

	^ parameters isValidParameterFor: self client