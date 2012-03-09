accessing
, aBioSequence
	" Concatenate the receiver's with aGTSequence if their alphabets are compatible "
	
	^ self alphabet class = aBioSequence alphabet class
		ifFalse: [ self signalInvalidObject: 
						'Incompatible alphabets: ' , 
						self alphabet class asString , 
						' and ' , 
						aBioSequence alphabet class asString  ]
		ifTrue: [ self newPrototypeWith: self asString , aBioSequence asString ]