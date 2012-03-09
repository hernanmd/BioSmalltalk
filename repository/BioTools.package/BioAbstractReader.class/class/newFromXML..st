instance creation
newFromXML: aFileLocationOrString
	" Answer a new reader using file located at aFileLocationOrString "

	| streamContents |
	
	( streamContents := aFileLocationOrString contents ) isXML
		ifFalse: [ streamContents := self openFileNamed: aFileLocationOrString ].
	^ self new
		results: streamContents contents;
		yourself