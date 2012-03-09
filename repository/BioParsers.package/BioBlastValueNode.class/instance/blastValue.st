accessing
blastValue
	" Answer the receiver's value "
	
	^ value isNumeric
		ifTrue: [ value asNumber ]
		ifFalse: [ value ]
		