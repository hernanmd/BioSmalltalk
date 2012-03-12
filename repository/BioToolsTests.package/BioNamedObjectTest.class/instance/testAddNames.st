testing
testAddNames

	namedObject name: 'accessionName1'.
	self assert: namedObject name = 'accessionName1'.
	" Add a name "
	namedObject addName: 'accessionName2'.	
	" Preserve the preferred name "
	self assert: namedObject name = 'accessionName1'.
	self assert: namedObject preferredName = 'accessionName1'.
	
	" Names were added correctly "
	self assert: namedObject names asOrderedCollection = ( OrderedCollection with: 'accessionName1' with: 'accessionName2' ).
	