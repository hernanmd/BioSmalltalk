"
BioSmartRefStreamSerializer is an adapter for the ""classic"" generic object serializer for Squeak.

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
"
Class {
	#name : #BioSmartRefStreamSerializer,
	#superclass : #BioSerializationEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioSmartRefStreamSerializer class >> providerClass [
	" See superimplementor's comment "

	^ #FileStream
]

{ #category : #accessing }
BioSmartRefStreamSerializer >> materialize [
	" See superimplementor comment "

	^ self isValidMaterialization
		ifTrue: [ Cursor read showWhile: [ 	
					self provider: (self provider readOnlyFileNamed: self location).
					self provider fileInObjectAndCode ] ]
		ifFalse: [ self signalInvalidObject: self location , ' is not a valid file for materialization' translated ]


]

{ #category : #accessing }
BioSmartRefStreamSerializer >> serialize: anObject [
	" See superimplementor's comment "

	Cursor write showWhile: [ 	
		self provider: (self provider newFileNamed: self location).
		self provider
				fileOutClass: nil "no class" 
				andObject: anObject.	
		self doCompressionIn: self location ].
]
