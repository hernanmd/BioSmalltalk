accessing instance variables
owners
	" Answer a <Collection> of the propietaries of the receiver's project "

	^ owners	
		ifNil: [ owners := OrderedCollection new ]