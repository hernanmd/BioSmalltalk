"
Adapter for the Fuel serializer.

See http://rmod.lille.inria.fr/web/pier/software/Fuel for details

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet

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
