instance creation
newFromFlat: aFileLocationOrString
	" Answer a new reader using file located at aFileLocationOrString "

	| contents |
	
	self needsWork. " #isPathLocation missing "	
	( contents := aFileLocationOrString contents ) isPathLocation
		ifTrue: [ contents := self openFileNamed: aFileLocationOrString ].
	^ self new
		results: contents;
		yourself