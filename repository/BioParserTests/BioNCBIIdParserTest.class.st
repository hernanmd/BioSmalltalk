Class {
	#name : #BioNCBIIdParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Core'
}

{ #category : #accessing }
BioNCBIIdParserTest >> parserClass [
	" Private - See superimplementor's comment "
	
	^ BioNCBIIdParser

]

{ #category : #accessing }
BioNCBIIdParserTest >> setUp [
	" Private - See superimplementor's comment "

	super setUp.
	parser := self parserClass new.

]

{ #category : #testing }
BioNCBIIdParserTest >> testAllIdentifiers [

	| identifiers |
	
	identifiers := self parserClass allIdentifiers.
	self assert: (identifiers isKindOf: Collection).
	self 
		assertCollection: identifiers 
		hasSameElements: #('pdb' 'bbs' 'gi' 'gnl' 'lcl' 'pat' 'pir' 'prf' 'sp' 'dbj' 'emb' 'gb' 'ref').
]

{ #category : #testing }
BioNCBIIdParserTest >> testClassForBBS [

	self
		assert: (self parserClass classFor: 'bbs')
		equals: BioGIBackBoneIdParser.

]

{ #category : #testing }
BioNCBIIdParserTest >> testClassForDBJ [

	self assert: (self parserClass classFor: 'dbj') equals: BioDDBJParser.

]

{ #category : #testing }
BioNCBIIdParserTest >> testClassForEMB [

	self assert: (self parserClass classFor: 'emb') equals: BioEMBLParser.

]

{ #category : #testing }
BioNCBIIdParserTest >> testClassForPDB [

	self
		assert: (self parserClass classFor: 'pdb')
		equals: BioBrookhavenProtParser.
]

{ #category : #testing }
BioNCBIIdParserTest >> testClassForRefSeq [

	self
		assert: (self parserClass classFor: 'ref')
		equals: BioRefSeqParser.
]

{ #category : #testing }
BioNCBIIdParserTest >> testClassForSwissProt [

	self
		assert: (self parserClass classFor: 'sp')
		equals: BioSwissProtParser

]
