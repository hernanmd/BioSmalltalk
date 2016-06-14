report
fromRecord: record

	self extractAX 
		ifTrue: [ self extractFromRecord: record position: self fieldNrAXId ].
	self extractRS 
		ifTrue: [ self extractFromRecord: record position: self fieldNrRS ].
	self extractAlleleFrqs 
		ifTrue: [ self extractAlleleFrqsFromRecord: record position: self fieldNrAlleleFqy ]
		ifFalse: [
			self extractMinAlleleFrqs ifTrue: [ 
				self extractMinAlleleFrqsFromRecord: record position: self fieldNrAlleleFqy ] ].
	self extractGeneAnnot 
		ifTrue: [ self extractGeneAnnotFromRecord: record position: self fieldNrGeneAnnot ].

