instance creation
for: locationString

	^ self adapterClass new 
		location: locationString;
		initializeWith: ( self classFor: self adapterClass providerClass )
