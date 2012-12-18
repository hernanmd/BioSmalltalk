instance creation
newFromXMLPath: aFileLocationOrString
	" Answer a new receiver's instance using contents located at aFileLocationOrString "

	^ (aFileLocationOrString contents isXML)
		ifTrue: [ self newFromXML: aFileLocationOrString ]
		ifFalse: [ self newFromDirectory: aFileLocationOrString ]
