Class {
	#name : #BioNCBIBlastReaderTest,
	#superclass : #BioNCBITests,
	#instVars : [
		'reader'
	],
	#category : #'BioBlastTests-Core'
}

{ #category : #accessing }
BioNCBIBlastReaderTest >> blastResultsSample02 [

	^ BioWebBlastSamples new blastResultsSample02.
]

{ #category : #accessing }
BioNCBIBlastReaderTest >> setUp [

	super setUp.
	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessBlastReader01 [
	" Accessing information about the BLAST "

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
	self deny: reader hitHspsNodes isEmpty.
	self 
		assert: (reader hitHspsNodes isKindOf: BioBlastNode)
		description: 'Answer the nodes inside a root BioBlastNode'.
	self assert: reader hitHspsNodes hits size equals: 100.	

	self deny: reader hitResults isEmpty.
	self 
		assert: (reader hitResults allSatisfy: [ : a | a isKindOf: BioBlastParentNode ])
		description: 'Answer the nodes inside a root BioBlastNode'

]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessBlastReader02 [
	" Accessing meta-information about the BLAST "

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	self assert: reader blastDbName equals: 'nr'.
	self assert: reader blastProgramVersion equals: 'BLASTN 2.2.23+'.
	self assert: reader blastQueryDef equals: 'No definition line'.
	self assert: reader blastQueryId equals: '47837'.
	self assert: reader blastQueryLength equals: '240'.


]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessBlastReader03 [
	" Accessing information about the BLAST "

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
		
	self deny: reader giListIdentifiers isEmpty.
	self assert: (reader giListIdentifiers bioHasEqualElements: self giList1).

	self deny: reader hitAccessions isEmpty.	
	self assert: (reader hitAccessions allSatisfy: [ : a | a isKindOf: BioAccession ]).
	self assert: reader hitAccessions size equals: 100.
	
	self deny: reader hitAccessionsAsTokens isEmpty.	
	self assert: (reader hitAccessionsAsTokens allSatisfy: [ : a | a isKindOf: Array ]).	
	self assert: reader hitAccessionsAsTokens size equals: 100.
	
	self deny: reader hitAccessionsAsString isEmpty.	
	self assert: (reader hitAccessionsAsString allSatisfy: [ : a | a isKindOf: String ]).	
	self assert: reader hitAccessionsAsString size equals: 100.
	
	self deny: reader hitHsps isEmpty.
	self 
		assert: (reader hitHsps allSatisfy: [ : a | a isKindOf: BioBlastNode ])
		description: 'Answer the nodes as a Collection of BioBlastNode hits'.
	self assert: reader hitHsps size equals: 100.	

	self deny: reader identities isEmpty.
	self assert: (reader identities allSatisfy: [ : ident | ident isKindOf: String ]).
	self assert: reader identities size equals: 100
]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessDNAAlignments01 [

	| alignment |

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.	
	alignment := reader alignments.

	self assert: (alignment isKindOf: BioAlignment).
	self deny: alignment isEmpty.

	self assert: (alignment names allSatisfy: [ : each | (BioAccessionParser on: each) isAccession ]).
	self assert: (alignment sequences allSatisfy: #isBioSequence).
	


]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessFilter [

	| emptyFilter |
	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	
	emptyFilter := reader filter.
	self assert: (emptyFilter isKindOf: BioBlastFilter).
	self assert: emptyFilter reader equals: reader.
	self assert: emptyFilter contents isNil.
]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessFilterBlastReader01 [

	| ft |

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.	
	ft := reader filter definitionsBeginWith: #('Bos taurus').

	self assert: (reader filter isKindOf: BioBlastFilter).
	self assert: (ft isKindOf: BioFilteredResult).
	self assert: (reader contents isKindOf: BioFilteredResult).
	
	self deny: ft isEmpty.
	self assert: ft size equals: 87.
	

]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessFilterBlastReader02 [

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
	reader filter alignsWithMinLength: 235.

	self assert: reader hits isCollection.
	self deny: reader hits isEmpty.
"	self assert: reader hits size = 100 "

]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessNode [

	| nodeContents |
	
	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	
	nodeContents := reader accessNode: 'Iteration_iter-num'.
	self assert: (nodeContents isKindOf: Collection).
	self assert: nodeContents anyOne equals: '1'.
	
	nodeContents := reader accessNode: 'Hit_def'.
	self assert: (nodeContents isKindOf: Collection).
	self assert: nodeContents size equals: 100.
	self assert: (nodeContents allSatisfy: [ : str | str beginsWith: 'Bos' ])


]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAccessProteinAlignments01 [

	| alignments |
	
	alignments := (BioNCBIBlastReader newFromXML: self resultBlastp01) alignments.
	
	self assert: (alignments isKindOf: BioAlignment).
	self deny: alignments isEmpty.

	self assert: (alignments names allSatisfy: [ : each | (BioAccessionParser on: each) isAccession ]).
	self assert: (alignments sequences allSatisfy: #isProteinSequence).
	


]

{ #category : #testing }
BioNCBIBlastReaderTest >> testAddFilterBlastReader01 [

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
		
	self assert: reader filters isEmpty.	
	reader filter definitionsBeginWith: #('Bos taurus').

	self deny: reader filters isNil.
	self assert: reader filters isCollection.
	self deny: reader filters isEmpty.
	self assert: (reader filters allSatisfy: [ : f | f isKindOf: BioBlastFilter ]).


]

{ #category : #testing }
BioNCBIBlastReaderTest >> testFilterBlastReader01 [

	| hits |
	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	reader setSAXParser.
	reader filter definitionsBeginWith: #('Bos taurus').
	hits := reader hits.

	self assert: hits isCollection.
	self deny: hits isEmpty.
	self assert: (hits allSatisfy: [ : each | each isKindOf: BioBlastNode ]).

	self assert: hits size equals: 87.
	self assert: hits first nodeName equals: 'Hit'.
	self assert: hits first nodes isCollection
]

{ #category : #testing }
BioNCBIBlastReaderTest >> testGiList [
	| giList |
	giList := (BioNCBIBlastReader newFromXML: self resultBlastp01) giList.
	self assert: (giList isKindOf: Collection).
	self deny: giList isEmpty.
	self assert: giList size equals: 10.
	self
		assert:
			(giList
				bioHasEqualElements:
					#('116414' '227369' '544028' '118083358' '326912741' '348530520' '130498679' '292622140' '47221590' '348526341'))
]

{ #category : #testing }
BioNCBIBlastReaderTest >> testHasContents [

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.	
	self assert: reader hasContents.



]

{ #category : #testing }
BioNCBIBlastReaderTest >> testNewBlastReader01 [

	reader := BioNCBIBlastReader newFromXML: self blastResultsSample02.
	self assert: (reader isKindOf: BioNCBIBlastReader).
	self assert: reader filters isCollection.
	self assert: reader filters isEmpty.


]
