"
BioSerializationEngine is the superclass for all known serializers. Behavior of serializers includes materialization and compression (compression is not implemented currently).
"
Class {
	#name : #BioSerializationEngine,
	#superclass : #BioAbstractAdapter,
	#instVars : [
		'doCompression',
		'location'
	],
	#category : #'BioTools-Adapters'
}

{ #category : #'instance creation' }
BioSerializationEngine class >> for: locationString [

	^ self adapterClass new 
		location: locationString;
		initializeWith: (self classFor: self adapterClass providerClass);
		yourself

]

{ #category : #accessing }
BioSerializationEngine class >> materialize: aLocationString [

	| materialization |
	
	self bioLog: 'Materializing...' translated.
	materialization := (self for: aLocationString) materialize.
	self bioLog: 'done' translated.
	^ materialization

]

{ #category : #accessing }
BioSerializationEngine class >> serialize: anObject [
	" Check and correct, if necessary, anObject's name before serializing into a file "

	| fileName serialization |
	
	(fileName := anObject printString withoutBlanks) size > 100 
		ifTrue: [ fileName := anObject class asString. ].
	fileName := fileName ,  '_' , self currentSeconds , '.obj'.
	self bioLog: 'Serializing...' translated.
	serialization := (self for: fileName) serialize: anObject.
	self bioLog: 'done' translated.
	^ serialization
	
]

{ #category : #accessing }
BioSerializationEngine >> doCompression [

	^ doCompression
		ifNil: [ doCompression := false ]
]

{ #category : #accessing }
BioSerializationEngine >> doCompression: anObject [
	doCompression := anObject
]

{ #category : #accessing }
BioSerializationEngine >> doCompressionIn: aFilename [

	
]

{ #category : #testing }
BioSerializationEngine >> isValidMaterialization [
	" Answer <true> if the receiver's location is valid for materialization "

	^ self location asFileReference isFuel
]

{ #category : #accessing }
BioSerializationEngine >> location [
	^ location
]

{ #category : #accessing }
BioSerializationEngine >> location: anObject [
	location := anObject
]
