Class {
	#name : #BioCompositeIDParser,
	#superclass : #BioNCBIIdParser,
	#category : 'BioParsers-Core'
}

{ #category : #'initialize-release' }
BioCompositeIDParser >> giParser [
	" Answer a Parser for parsing the Gene Identifier part
	of a description line "	
	
	^ BioGIParser new parser
]

{ #category : #'initialize-release' }
BioCompositeIDParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self giParser , 
		self parserForDbAccessionLocus
]

{ #category : #'initialize-release' }
BioCompositeIDParser >> parserForDbAccessionLocus [

	^ self parserForGenBank | 
		self parserForEmbl |
		self parserForDdbj
]
