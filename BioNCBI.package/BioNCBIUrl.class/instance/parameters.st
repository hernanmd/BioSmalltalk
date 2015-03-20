private
parameters
	" Answer a Collection with the receiver's parameter names "

	^ self path last findTokens: self urlTokens.
