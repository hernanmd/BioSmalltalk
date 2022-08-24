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
BioNCBIIdParserTest >> testClassFor [

	self assert: (self parserClass classFor: 'pdb') = BioBrookhavenProtParser.
	self assert: (self parserClass classFor: 'bbs') = BioGIBackBoneIdParser.
	self assert: (self parserClass classFor: 'dbj') = BioDDBJParser.
	self assert: (self parserClass classFor: 'emb') = BioEMBLParser.
	self assert: (self parserClass classFor: 'ref') = BioRefSeqParser.
	self assert: (self parserClass classFor: 'sp') = BioSwissProtParser.	
"	self assert: (self parserClass classFor: 'gi') = .
	self assert: (self parserClass classFor: 'gnl') = .
	self assert: (self parserClass classFor: 'lcl') = .
	self assert: (self parserClass classFor: 'pat') = .
	self assert: (self parserClass classFor: 'pir') = .
	self assert: (self parserClass classFor: 'prf') = .
	self assert: (self parserClass classFor: 'gb') = .	
"

]
