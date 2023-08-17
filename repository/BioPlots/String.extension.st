Extension { #name : #String }

{ #category : #'*BioPlots' }
String >> addFromRSBuilder: aBioRSBaseBuilder rowIndex: anInteger [ 

	aBioRSBaseBuilder addSequenceString: self rowIndex: anInteger
]
