accessing
query: aString
	" Set the client query accordingly to aString "
	
	( self isIdentifier: aString )
		ifFalse: [ self term: aString ]
		ifTrue: [ self uids: ( Array with: aString ) ]