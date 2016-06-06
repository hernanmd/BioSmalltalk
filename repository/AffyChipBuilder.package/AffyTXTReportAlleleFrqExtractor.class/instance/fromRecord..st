report
fromRecord: record

	self extractAX 
		ifTrue: [ self extractFromRecord: record position: self axFieldNumber ].
	self extractRS 
		ifTrue: [ self extractFromRecord: record position: self rsFieldNumber ].
	self extractAlleleFrqs 
		ifTrue: [ self extractAlleleFrqsFromRecord: record position: self alleleFrqsFieldNumber ]
		ifFalse: [
			self extractMinAlleleFrqs ifTrue: [ 
				self extractMinAlleleFrqsFromRecord: record position: self alleleFrqsFieldNumber ] ]
