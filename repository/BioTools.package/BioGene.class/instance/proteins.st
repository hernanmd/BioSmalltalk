accessing
proteins
	" Answer a <Collection> of reciever's protein "

	^ proteins
		ifNil: [ proteins := OrderedCollection new ]