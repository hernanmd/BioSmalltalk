writing
writeOn: aStream
	" Write the receiver's section on aStream "

	| delimiter |
	
	delimiter := self iniFile profileSection locusSeparator value.
	self writeLabelOn: aStream.
	self associationsDo: [:assoc | 
		" Label key case "
		aStream tab;
			nextPutAll: assoc key;
			nextPut: $=.
		assoc value isString 
			ifTrue: [ self writeQuoted: assoc on: aStream ]				" Value case "
			ifFalse: [ assoc value 
						writeSamplesOn: aStream 
						delimiter: delimiter ]								" Matrix case "
		]
					
