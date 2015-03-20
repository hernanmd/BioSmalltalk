accessing public
addUser: aNameString

	^ ( self isUser: aNameString )
		ifFalse: [ self users addLast: ( self createUser: aNameString ) ]
		ifTrue: [ self signalDuplicateObject: aNameString , ' already exists' translated ].