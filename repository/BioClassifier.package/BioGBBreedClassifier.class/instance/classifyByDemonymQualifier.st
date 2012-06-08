accessing
classifyByDemonymQualifier
	" Classify and answer <true> if the receiver can be classified in a cluster "

	| cluster |

	( cluster := self organization groupForDemonym: self qualifierDemonym )
		ifNotNil: [
			self addClassification: cluster.
			self matched: #classifiedByDemonymQualifier ]
		ifNil: [
			self unMatched: #unclassifiedByNullClusterForCurrentDemonym ]