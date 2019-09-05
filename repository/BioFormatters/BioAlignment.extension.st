Extension { #name : #BioAlignment }

{ #category : #'*BioFormatters' }
BioAlignment >> asPhylip [
	" Answer a <BioPhylip> instance with receiver's contents properly filled "
	
	^ BioPhylip new
		numberOfTaxa: self size;
		numberOfCharacters: self numberOfCharacters;
		sequences: self sequences;
		yourself
]

{ #category : #'*BioFormatters' }
BioAlignment >> asPhylipString [
	" Answer the receiver as a Phylip record object "
	<lint: 'Method selectors' rationale: 'No spelling error' author: 'hfm'>

	^ self asPhylip asString
]
