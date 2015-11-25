instance creation
newWith: aString remaining: aCollection

	^ self new 
		initializeCumulative: aString remaining: aCollection;
		yourself