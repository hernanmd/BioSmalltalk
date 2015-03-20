text-mining
isFoundIn: aString
	" Answer <true> if the receiver's is located at aString "
	
	^ self locationsWithoutPrefixes includes: aString