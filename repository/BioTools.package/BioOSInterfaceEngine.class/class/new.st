instance creation
new
	" Answer a new instance of the receiver "

	^ self adapterClass basicNew
		initializeWith: ( self classFor: self adapterClass providerClass )
