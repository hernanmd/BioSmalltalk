"
Groups common parsers for identifiers of the most common DNA databases located at NCBI.

This class is not intended to be used directly.

"
Class {
	#name : #BioNCBIAbstractParser,
	#superclass : #BioFASTAParser,
	#category : 'BioParsers-Core'
}

{ #category : #'accessing-parsers' }
BioNCBIAbstractParser >> parserForCompositeId [

	^ BioCompositeIDParser new parser
]

{ #category : #'accessing-parsers' }
BioNCBIAbstractParser >> parserForDdbj [

	^ BioDDBJParser new parser
]

{ #category : #'accessing-parsers' }
BioNCBIAbstractParser >> parserForEmbl [

	^ BioEMBLParser new parser
]

{ #category : #'accessing-parsers' }
BioNCBIAbstractParser >> parserForGenBank [
	" This is GB "
	
	^ BioGBParser new parser

]
