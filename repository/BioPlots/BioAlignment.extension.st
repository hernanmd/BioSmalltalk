Extension { #name : #BioAlignment }

{ #category : #'*BioPlots' }
BioAlignment >> plot [

	BioRSBaseBuilder new
		fromAlignment: self;
		open
]
