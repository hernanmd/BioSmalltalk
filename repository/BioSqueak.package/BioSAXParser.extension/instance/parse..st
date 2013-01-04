*BioSqueak
parse: anObject
	" Parse anObject. This is for cases where you want to set parser parameters before parsing the document #parseDocument "
	
	driver := SAXDriver on: anObject readStream.
	driver validating: true.
	driver saxHandler: self.
	" parser := self new driver: driver."
	"self input: anObject readStream."
	[ self usesNamespaces: false ]
	on: MessageNotUnderstood
	do: [ : ex | self useNamespaces: false ].
	self startDocument.
	^ self parseDocument
