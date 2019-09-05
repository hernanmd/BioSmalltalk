"
Adapter for the Magma Object Database

See http://wiki.squeak.org/squeak/2665 for details

Currently Magma is available in Squeak and Pharo.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
"
Class {
	#name : #BioMaObjectSerializer,
	#superclass : #BioSerializationEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioMaObjectSerializer class >> providerClass [
	" See superimplementor's comment "

	^ #MaObjectSerializer
]

{ #category : #'initialize-release' }
BioMaObjectSerializer >> initializeWith: aProviderClass [
	" Private - See superimplementor's comment "
	
	super initializeWith: aProviderClass new
]

{ #category : #accessing }
BioMaObjectSerializer >> materialize [
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ Cursor read showWhile: [ self serializer fileIn: (self fileDirectoryClass forFileName: self locationString) ] ]
		ifFalse: [ self signalInvalidObject: self location , ' is not a valid file for materialization' translated ]
]

{ #category : #accessing }
BioMaObjectSerializer >> serialize: anObject [
	" See superimplementor's comment "

	Cursor write showWhile: [ 	
		self provider
			fileOut: anObject 
			toFileNamed: self fileName 
			in: self workingDirectory.
		self doCompressionIn: self fileName ].
]
