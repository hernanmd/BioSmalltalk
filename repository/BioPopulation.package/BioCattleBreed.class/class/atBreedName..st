testing
atBreedName: aString
	" Answer the first breed in the receiver's breeds found if aString is present in any synonym "

	^ self breeds 
			detect: [: breed | breed includesName: aString ]
			ifNone: [ nil ]