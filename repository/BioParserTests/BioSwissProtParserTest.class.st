Class {
	#name : #BioSwissProtParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Core'
}

{ #category : #accessing }
BioSwissProtParserTest >> setUp [

	super setUp.
	parser := BioSwissProtParser new.
]

{ #category : #testing }
BioSwissProtParserTest >> testSwissProtTokenize01 [

	self
		assert: (BioParser tokenizeAccession: 'sp|P80487|HHP_THICU')
		equals: #( 'P80487' )
]

{ #category : #testing }
BioSwissProtParserTest >> testSwissProtTokenize02 [

	self
		assert: (BioParser tokenizeAccession: 'sp|P80487.1|HHP_THICU')
		equals: #( 'P80487' '1' )
]

{ #category : #testing }
BioSwissProtParserTest >> testSwissProtTokenize03 [

	self
		assert:
		(BioParser tokenizeSwissProtEntryName: 'sp|Q9UWG2|RL3_METVA')
		equals: 'RL3_METVA'
]
