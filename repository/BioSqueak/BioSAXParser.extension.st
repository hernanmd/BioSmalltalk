Extension { #name : #BioSAXParser }

{ #category : #'*BioSqueak' }
BioSAXParser >> parse: anObject [
	" Parse anObject. This is for cases where you want to set parser parameters before parsing the document #parseDocument "
	
	driver := SAXDriver on: anObject readStream.
	driver validating: true.
	driver saxHandler: self.
	"self input: anObject readStream."
	[ self usesNamespaces: false ]
	on: MessageNotUnderstood
	do: [ : ex | self useNamespaces: false ].
	self startDocument.
	^ self parseDocument

]

{ #category : #'*BioSqueak' }
BioSAXParser >> parseDocument [

	self bioLog: 'Start parsing document...' translated.
	super parseDocument.
	self bioLog: 'End parsing document' translated.
   ^ results
]

{ #category : #'*BioSqueak' }
BioSAXParser class >> parseDocumentFrom: anObject useNamespaces: aBoolean [

	| parser |

	" driver := SAXDriver on: anObject readStream. "
	" validating: true. "
	" parser := self new driver: driver. "
	parser := self on: anObject readStream.
	[ parser usesNamespaces: false ]
	on: MessageNotUnderstood
	do: [ : ex | parser useNamespaces: false ].
	parser startDocument.
	^ parser parseDocument.


]
