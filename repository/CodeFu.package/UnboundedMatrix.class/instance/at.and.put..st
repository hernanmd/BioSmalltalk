initialize-release
at: row and: column put: aNumber

	^[ matrix at: row and: column put: aNumber ] 
		on: SubscriptOutOfBoundsError 
		do: [ :ex | backgroundValue ]