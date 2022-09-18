"
Adapter for the Fuel serializer.

See [the Fuel homepage](http://rmod.lille.inria.fr/web/pier/software/Fuel) for details


"
Class {
	#name : #BioFLSerializer,
	#superclass : #BioSerializationEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #testing }
BioFLSerializer class >> isPreferredAdapter [
	" Private - See superimplementor's comment "

	^ true
]

{ #category : #accessing }
BioFLSerializer class >> providerClass [
	" See superimplementor's comment "

	^ #FLSerializer
]

{ #category : #'initialize-release' }
BioFLSerializer >> initializeWith: aProviderClass [
	" Private - See superimplementor's comment "
	
	super initializeWith: aProviderClass newDefault
]

{ #category : #accessing }
BioFLSerializer >> materialize [
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ Cursor read showWhile: [ 	
					(self classFor: #FLMaterializer) materializeFromFileNamed: self location ] ]
		ifFalse: [ self error: self location , ' is not a valid file for materialization' translated ]
]

{ #category : #accessing }
BioFLSerializer >> serialize: anObject [
	" See superimplementor comment "
	
	Cursor write showWhile: [ 	
		self provider serialize: anObject toFileNamed: self location.
		self doCompressionIn: self location ].
]
