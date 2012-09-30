accessing
atAlignment: alignNumber
	" Answer a Collection with the receiver's sequences at alignNumber position "
	
	^ (alignNumber between: 1 and: self size)
		ifTrue: [ self sequences at: alignNumber ]
		ifFalse: [ self signalInvalidObject: alignNumber asString , ' is out of range in the receiver''s sequences' ]