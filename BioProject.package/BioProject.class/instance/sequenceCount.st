accessing-sequences
sequenceCount
	" Answer a Number of the receiver's working sequences "
	
	^ self jobs isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ self jobs sum: #sequenceCount ]