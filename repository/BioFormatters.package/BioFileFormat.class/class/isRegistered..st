testing
isRegistered: aString
	" Search aString in the receiver's registered names and descriptions. Answer <true> if found "
	
	^ (self registry 
		detect: [: fmt | (fmt includesExtension: aString) or: [ fmt includesName: aString ] ]
		ifNone: [ nil ]) isNil not