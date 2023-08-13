"
Groups common parsers for identifiers of the most common DNA databases located at NCBI.

This class is not intended to be used directly.

"
Class {
	#name : #BioIDParser,
	#superclass : #BioFASTAParser,
	#category : #'BioParsers-Core'
}

{ #category : #'accessing-parsers' }
BioIDParser >> parserForCompositeId [

	^ BioCompositeIDParser new parser
]

{ #category : #'accessing-parsers' }
BioIDParser >> parserForDdbj [

	^ BioDDBJParser new parser
]

{ #category : #'accessing-parsers' }
BioIDParser >> parserForEmbl [

	^ BioEMBLParser new parser
]

{ #category : #'accessing-parsers' }
BioIDParser >> parserForGenBank [
	" This is GB "
	
	^ BioGBParser new parser

]
