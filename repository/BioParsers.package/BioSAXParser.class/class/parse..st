instance creation
parse: anObject
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
