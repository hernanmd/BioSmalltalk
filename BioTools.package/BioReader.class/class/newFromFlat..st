instance creation
newFromFlat: aFileLocationOrString
	" Answer a new reader using file located at aFileLocationOrString "

	| contents |
	
	contents := self openFileNamed: aFileLocationOrString.
	^ self new
		results: contents;
		yourself