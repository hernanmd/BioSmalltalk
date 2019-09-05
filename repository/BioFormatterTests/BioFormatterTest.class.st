Class {
	#name : #BioFormatterTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'formatter'
	],
	#category : 'BioFormatterTests-Core'
}

{ #category : #accessing }
BioFormatterTest >> formatter [
	^ formatter
]

{ #category : #accessing }
BioFormatterTest >> formatter: anObject [
	formatter := anObject
]

{ #category : #accessing }
BioFormatterTest >> formatterClass [
	" Answer the concrete BioFormatter class being tested "
	
	self subclassResponsibility.
]

{ #category : #accessing }
BioFormatterTest >> setUp [

	super setUp.
	formatter := BioFormatter new.
]

{ #category : #testing }
BioFormatterTest >> testEscapeDelimiters01 [

	self assert: formatter delimiterSourceCharacter equals: $;.
	self assert: formatter delimiterTargetCharacter equals: $,.
	
	self assert: (formatter escapeDelimiters: 'normal text') equals: 'normal text'.
	self assert: (formatter escapeDelimiters: 'normal;text') equals: 'normal,text'.
	self assert: (formatter escapeDelimiters: ';normal;text;') equals: ',normal,text,'.		
	self assert: (formatter escapeDelimiters: ';;;;') equals: ',,,,'.
	self assert: (formatter escapeDelimiters: String empty) equals: String empty.	
	
	formatter delimiterSourceCharacter: $|.	

	self assert: (formatter escapeDelimiters: 'normal text') equals: 'normal text'.
	self assert: (formatter escapeDelimiters: 'normal|text') equals: 'normal,text'.
	self assert: (formatter escapeDelimiters: '|normal|text|') equals: ',normal,text,'.		
	self assert: (formatter escapeDelimiters: '||||') equals: ',,,,'.
	self assert: (formatter escapeDelimiters: String empty) equals: String empty.	

	formatter delimiterTargetCharacter: $M.
	
	self assert: (formatter escapeDelimiters: 'normal text') equals: 'normal text'.
	self assert: (formatter escapeDelimiters: 'normal|text') equals: 'normalMtext'.
	self assert: (formatter escapeDelimiters: '|normal|text|') equals: 'MnormalMtextM'.	
	self assert: (formatter escapeDelimiters: '||||') equals: 'MMMM'.
	self assert: (formatter escapeDelimiters: String empty) equals: String empty.	
]

{ #category : #testing }
BioFormatterTest >> testFormatterFor [

	self assert: ((BioFileFormatter formatterFor: 'fasta') isKindOf: BioFASTAFormatter).
	self assert: ((BioFileFormatter formatterFor: 'CSV') isKindOf: BioCSVFormatter).
	self assert: ((BioFileFormatter formatterFor: 'csv') isKindOf: BioCSVFormatter).
	self assert: ((BioFileFormatter formatterFor: 'Comma Separated Values') isKindOf: BioCSVFormatter).
	
	self assert: ((BioFileFormatter formatterFor: 'BlastReportCSV') isKindOf: BioBlastCSVFormatter).
	self assert: ((BioFileFormatter formatterFor: 'xml') isKindOf: BioXMLFormatter).
	self assert: ((BioFileFormatter formatterFor: 'XML') isKindOf: BioXMLFormatter).
	self assert: ((BioFileFormatter formatterFor: 'HaploView') isKindOf: BioHaploViewFormatter).
	
	self should: [BioFileFormatter formatterFor: String empty] raise: Error.
	self should: [BioFileFormatter formatterFor: nil] raise: Error.	
]

{ #category : #testing }
BioFormatterTest >> testGenerator01 [

	self assert: (BioObject generateJoin: 2 repeat: 4) = '2222'.
	self assert: (BioObject generateJoin: -1 repeat: 4) = '-1-1-1-1'.
	self assert: (BioObject generateJoin: 0 repeat: 0) = String empty.
	self assert: (BioObject generateJoin: $A repeat: 4) = 'AAAA'.		
	self assert: (BioObject generateJoin: 'B' repeat: 4) = 'BBBB'.
	self assert: (BioObject generateJoin: 'GATACA' repeat: 2) =  'GATACAGATACA'.	
	
	self should: [ BioObject generateJoin: 'C' repeat: -1 ] raise: Exception.
]

{ #category : #testing }
BioFormatterTest >> testGenerator02 [

	self assert: (BioObject generate: 2 repeat: 4) asArray = #(2 2 2 2).
	self assert: (BioObject generate: -1 repeat: 4) asArray = #(-1 -1 -1 -1).
	self assert: (BioObject generate: 0 repeat: 0) asArray = Array empty.
	self assert: (BioObject generate: $A repeat: 4) asArray = #($A $A $A $A).		
	self assert: (BioObject generate: 'B' repeat: 4) asArray = #('B' 'B' 'B' 'B').
	self assert: (BioObject generate: 'GATACA' repeat: 2) asArray =  #('GATACA' 'GATACA').	

]
