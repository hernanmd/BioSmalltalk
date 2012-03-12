testing
isRegistered: aString
	" Search aString in the receiver's registered names and descriptions. Answer <true> if found "
	
	^ ( self registry 
		detect: [: fmt | fmt first = aString or: [ fmt substrings includes: aString ] ]
		ifNone: [ nil ] ) isNil