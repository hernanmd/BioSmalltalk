"
SIXX is Smalltalk Instance eXchange in XML

See URL for details: http://www.mars.dti.ne.jp/~umejava/smalltalk/sixx/

One should never name the final subclasses, instead write the corresponding adapter superclass, for example, to serialize your objects, use:

BioSerializationEngine serialize: anObject.

to get the contents at an URL:

(BioWebClientEngine for: 'http://www.google.com.ar') httpGet
"
Class {
	#name : #BioSIXXSerializer,
	#superclass : #BioSerializationEngine,
	#category : #'BioTools-Adapters'
}

{ #category : #accessing }
BioSIXXSerializer class >> providerClass [
	" See superimplementor's comment "

	^ #SixxReadStream
]

{ #category : #'initialize-release' }
BioSIXXSerializer >> initializeWith: aProviderClass [
	" Private - See superimplementor's comment "
	
	super initializeWith: aProviderClass newDefault
]

{ #category : #accessing }
BioSIXXSerializer >> materialize [
	" See superimplementor comment "

	| srs object |

	Cursor read showWhile: [ 	
		srs := self provider readOnlyFileNamed: self location.
		object := srs next.
		srs close ].
	^ object.
]

{ #category : #accessing }
BioSIXXSerializer >> serialize: anObject [
	" See superimplementor's comment "
	"anObject sixxString"
	
	Cursor write showWhile: [ 	
		| stream |
		stream := (Smalltalk at: #SixxWriteStream) newFileNamed: self location.
		stream nextPut: anObject.
		stream close ].
]
