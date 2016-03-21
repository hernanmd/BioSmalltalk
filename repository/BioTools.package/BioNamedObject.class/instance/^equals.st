comparing
= anObject
	" Answer whether the receiver and anObject represent the same object. "
	
	^ self == anObject and: [ self class = anObject class and: [ self names = anObject names ] ]