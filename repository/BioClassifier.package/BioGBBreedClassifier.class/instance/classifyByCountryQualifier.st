accessing
classifyByCountryQualifier
	" Add the receiver's current subject if its country can be classified in a TGroupOrganization "

	| cluster |
	
	( cluster := self organization groupForCountry: self qualifierCountry )
		ifNotNil: [
			self hasBeenDiscardedByDemonym
				ifFalse: [
					self addClassification: cluster.
					self matched: #classifiedByCountryQualifierOfInterest ]
				ifTrue: [ 
					self unMatched: #discardedByDemonymPriority ] ]
		ifNil: [
			self unMatched: #unclassifiedByCountryQualifierOfInterest ].