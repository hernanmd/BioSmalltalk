private
bestNameFor: seqAssoc
	" Answer a <String> with a identifiable name for group of sequences in seqAssoc "
	
	^ seqAssoc value
		detect: [ : d | (d includesKey: PCTBreedQualifier qualifierString) ]
		ifFound: [ : found | found  at: PCTBreedQualifier qualifierString ]
		ifNone: [ 'Unnamed_Seq' , BioNamedObject uniqueName ]

