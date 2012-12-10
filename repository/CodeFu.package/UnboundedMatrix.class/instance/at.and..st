initialize-release
at: row and: column

	^[ matrix at: row and: column ] 
		on: SubscriptOutOfBoundsError 
		do: [ :ex | backgroundValue ]