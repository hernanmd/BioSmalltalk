accessing - sequence annotations
annotationsClass
	" Answer a <Collection> class used to store the receiver's annotations "
	
	^ annotationsClass
		ifNil: [ annotationsClass := self defaultAnnotationsClass ]