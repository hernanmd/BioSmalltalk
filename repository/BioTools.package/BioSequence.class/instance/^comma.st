accessing
, aBioSequence
	" Concatenate the receiver with aBioSequence if their alphabets are compatible "
	
	^ self alphabet class = aBioSequence alphabet class
		ifFalse: [ self signalInvalidObject: 
						self alphabet class asString , 
						'Incompatible alphabet with: ' translated ,
						aBioSequence alphabet class asString  ]
		ifTrue: [ self newPrototypeWith: self asString , aBioSequence asString ]