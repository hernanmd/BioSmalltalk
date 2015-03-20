converting
asString
	"Answer a String that represents the receiver."
	
	^ String streamContents: [ : stream |
		stream
			nextPutAll: self names last.
		(self version isNil not and: [ self version isEmpty not ])
			ifTrue: [
				stream
					nextPut: $.;
					nextPutAll: self version ] ]