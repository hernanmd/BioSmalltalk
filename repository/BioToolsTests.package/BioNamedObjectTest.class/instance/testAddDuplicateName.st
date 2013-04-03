testing
testAddDuplicateName

	namedObject name: 'accessionName1'.
	self assert: namedObject name = 'accessionName1'.
	
	" Add duplicated name "
	self shouldnt:	[ namedObject addName: 'accessionName2' ] 		raise: BioDuplicatedObject.	
	self should: 	[ namedObject addName: 'accessionName1' ] 		raise: BioDuplicatedObject.