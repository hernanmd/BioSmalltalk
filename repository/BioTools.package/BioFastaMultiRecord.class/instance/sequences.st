accessing
sequences
	" Answer a <Collection> with the receiver's sequences "

	^ sequences
		ifNil: [ sequences := OrderedCollection new ]