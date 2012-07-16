instance creation
newFromFilter: aBioFilter
	" Answer a new reader using file located at aFileLocationOrString "

	^ self new
		results: aBioFilter contents;
		yourself