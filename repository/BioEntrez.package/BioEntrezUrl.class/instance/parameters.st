accessing
parameters
	" Answer a <Collection> with the receiver's parameter names "

	^ self hasQuery 
		ifTrue: [ self query keys ]
		ifFalse: [ Array new ]