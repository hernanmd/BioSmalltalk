accessing
format: aString
	" Answer a String from contracting first letters from aString "

	| result |
	
	self contractionLimit > aString subStrings size
		ifTrue: [ ^ self signalInvalidObject: 'Not enough letters to contract with the receiver, try reducing the contractionLimit' translated ].
			
	result := 
		( aString subStrings first: self contractionLimit )
			inject: String new
			into: [ : accum : subStr | accum , subStr first asString ].
	self capitalize
		ifTrue: [ result := result asUppercase ].
	^ result.