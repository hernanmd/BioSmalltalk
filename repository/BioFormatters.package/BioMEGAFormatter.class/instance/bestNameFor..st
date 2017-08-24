private
bestNameFor: seqAssoc
	" Answer a <String> with a identifiable name for group of sequences in seqAssoc. See class comments for details on seqAssoc expected format "
	
	^ seqAssoc value
		detect: [ : d | d includesKey: self groupNameQualifier ]
		ifFound: [ : found | found  at: self groupNameQualifier ]
		ifNone: [ 'Unnamed_Seq' , BioNamedObject uniqueName ] 