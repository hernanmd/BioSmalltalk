instance creation
for: anUrl

	^ self adapterClass new 
		url: anUrl;
		initializeWith: (self classFor: self adapterClass providerClass) new;
		yourself
