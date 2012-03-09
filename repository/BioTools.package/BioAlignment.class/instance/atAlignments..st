accessing
atAlignments: alignInterval
	" Answer a Collection with the receiver's sequences at alignNumber position "
	
	^ ( alignInterval between: 1 and: self size )
		ifTrue: [ self copyFrom: alignInterval first to: alignInterval last ]
		ifFalse: [ self signalInvalidObject: alignInterval asString , ' is out of range in the receiver''s sequences' ]