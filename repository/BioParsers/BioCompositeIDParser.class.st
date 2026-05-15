"
Parser for composite NCBI identifiers that combine multiple database accessions. Handles initialization of composite identifier parsing.
"
Class {
	#name : 'BioCompositeIDParser',
	#superclass : 'BioNCBIIdParser',
	#category : 'BioParsers-Core',
	#package : 'BioParsers',
	#tag : 'Core'
}

{ #category : 'initialize-release' }
BioCompositeIDParser >> giParser [
	" Answer a Parser for parsing the Gene Identifier part
	of a description line "	
	
	^ BioGIParser new parser
]

{ #category : 'initialize-release' }
BioCompositeIDParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self giParser , 
		self parserForDbAccessionLocus
]

{ #category : 'initialize-release' }
BioCompositeIDParser >> parserForDbAccessionLocus [

	^ self parserForGenBank | 
		self parserForEmbl |
		self parserForDdbj
]
