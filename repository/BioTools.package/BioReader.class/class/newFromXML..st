instance creation
newFromXML: aFileLocationOrString
	" Answer a new reader using file located at aFileLocationOrString "

	| streamContents |
	
	( streamContents := aFileLocationOrString contents ) isXML
		ifFalse: [ streamContents := self openFullFileNamed: aFileLocationOrString ].
	^ self new
		results: streamContents contents;
		yourself