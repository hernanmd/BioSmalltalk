testing
testName

	namedObject name: 'accessionName1'.
	self assert: namedObject name = 'accessionName1'.
	self assert: namedObject preferredName = 'accessionName1'.
	self assert: namedObject names asOrderedCollection = ( OrderedCollection with: 'accessionName1' ).
	