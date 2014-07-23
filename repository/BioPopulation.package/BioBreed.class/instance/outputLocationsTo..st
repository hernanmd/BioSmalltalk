accessing
outputLocationsTo: aStream
	" Private - See comment in #outputAsCsvTo: "
	
	self locations isEmpty
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ self locations do: [: each | 
					aStream 
						nextPutAll: each; 
						nextPut: $, ].
					aStream back ].