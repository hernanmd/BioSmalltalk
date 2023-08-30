"
Root superclass for all SAX parsers in BioSmalltalk.

The catchNodes instance variable is a workaround to a StAX-like parsing feature because at the time of this writing there was no solid StAX support in Smalltalk. Indeed, a StAX parser allows to select or filter specific nodes in a XML, while SAX is commonly and thought to be used as a read-all solution. The catchNodes is a flag to enable the selection of custom nodes.

Instance Variables:
	results			<Object>
	catchNodes		<Boolean>
	selectedNodes	<Object>
	current 			<Object>		Holds an object representing a node element in the XML tree. 
"
Class {
	#name : #BioSAXParser,
	#superclass : #SAXHandler,
	#instVars : [
		'results',
		'catchNodes',
		'selectedNodes',
		'current'
	],
	#category : #'BioParsers-Core'
}

{ #category : #'instance creation' }
BioSAXParser class >> newParser [
	" Use this special method because SAXHandler>>new was invalidated with Error exception "

	^ self basicNew
			initialize;
			yourself
]

{ #category : #'instance creation' }
BioSAXParser class >> parse: anObject [
	" Parse anObject. This is for cases where you want to set parser parameters before parsing the document #parseDocument "
	
	| parser |

	" driver := SAXDriver on: anObject readStream. "
	" driver validating: true. "
	" parser := self new driver: driver. "
	parser := self on: anObject readStream.
	[ parser usesNamespaces: false ]
	on: MessageNotUnderstood
	do: [ : ex | parser useNamespaces: false ].
	parser startDocument.
	^ parser parseDocument

]

{ #category : #'instance creation' }
BioSAXParser class >> parseDocumentFrom: anObject useNamespaces: aBoolean [
	| parser |

	" driver := SAXDriver on: anObject readStream. "
	" driver validating: true. "
	" parser := self new driver: driver. "
	parser := self on: anObject readStream.
	[ parser usesNamespaces: false ]
		on: MessageNotUnderstood
		do: [ :ex | parser useNamespaces: false ].
	parser startDocument.
	parser parseDocument.
	^ parser
]

{ #category : #'instance creation' }
BioSAXParser class >> parseFile: aFileName [
	" Parse aFileName representing a XML String as input "

	^ self parse: aFileName asFileReference
]

{ #category : #'instance creation' }
BioSAXParser class >> parseString: aString [
	" Parse a String XML formatted input "

	^ self parse: aString readStream
]

{ #category : #accessing }
BioSAXParser >> catchOff [
	" Private - Guard for deactivating parsing of nodes in the receiver "

	catchNodes := false
]

{ #category : #accessing }
BioSAXParser >> catchOn [
	" Private - Guard for activating parsing of nodes in the receiver "

	catchNodes := true
]

{ #category : #accessing }
BioSAXParser >> configuration [

	^ configuration
		ifNil: [ configuration := self configurationClass new ]
]

{ #category : #accessing }
BioSAXParser >> current [
	^ current
]

{ #category : #accessing }
BioSAXParser >> current: anObject [
	current := anObject
]

{ #category : #accessing }
BioSAXParser >> driver [

	^ self parser driver
]

{ #category : #private }
BioSAXParser >> estimatedResultSize [
	" Answer a <Number> of approximate found nodes in the receiver parsed file "

	^ self subclassResponsibility
]

{ #category : #initialize }
BioSAXParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	self initializeResults.
	self initializeSAXHandler.
	self configuration parserLimits documentReadLimit: 100000000. " 100 Mbytes"
	self configuration decodesCharacters: false.
	self configuration isValidating: false.	
	self externalEntityResolver externalSubsetReadLimit: 100000000.
	self catchOff.
]

{ #category : #initialize }
BioSAXParser >> initializeResults [
	" Private - Initialize receiver's results "

	results := self resultClass new: self estimatedResultSize
]

{ #category : #initialize }
BioSAXParser >> initializeSAXHandler [
	" Private - Code '''COPIED''' from SAXHandler>>on: beacuse sometimes we need to setup a parser BEFORE passing aStream as required now by SAXHandler "

	documentURI := nil.
	configuration
		ifNil: [self configuration: self configurationClass new]
		ifNotNil: [self configuration: configuration copy].
	hasParser := false.
	isInContent := false.
	isInCDataSection := false.
]

{ #category : #accessing }
BioSAXParser >> input: aString [

	input := aString
]

{ #category : #accessing }
BioSAXParser >> parse: anObject [
	" Parse anObject. This is for cases where you want to set parser parameters before parsing the document #parseDocument "
	
	"	| driver |

	driver := SAXDriver on: anObject readStream. "
	" driver validating: true. "
	" parser := self new driver: driver. "
	self input: anObject readStream.
	[ self usesNamespaces: false ]
	on: MessageNotUnderstood
	do: [ : ex | self useNamespaces: false ].
	self startDocument.
	^ self parseDocument

]

{ #category : #accessing }
BioSAXParser >> parseDocument [
	" Private - Parse receiver's input "

	self bioLog: 'Start parsing document...' translated.
	self input reset.
	super parseDocument.
	self bioLog: 'End parsing document' translated.
	^ results
]

{ #category : #accessing }
BioSAXParser >> parserNodes [

	^ self class parserNodes
]

{ #category : #private }
BioSAXParser >> resultClass [
	" Private - Answer the <Class> used to access to the parsing results "

	self subclassResponsibility
]

{ #category : #accessing }
BioSAXParser >> results [
	^ results
]

{ #category : #accessing }
BioSAXParser >> results: aCollection [
	" Set the receiver's results to be aCollection "

	^ results := aCollection
]

{ #category : #accessing }
BioSAXParser >> selectNodes: aCollection [
	" Select aCollection of nodes to be parsed by the receiver "

	selectedNodes := aCollection
]

{ #category : #accessing }
BioSAXParser >> selectedNodes [
	"Answer the value of choosenNodes"

	^ selectedNodes
		ifNil: [ selectedNodes := self defaultNodes asOrderedCollection ]
]
