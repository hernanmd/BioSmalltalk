as yet unclassified
testCleanupAfterYourself

	self should: [tempDir entries isEmpty].
	
	graph add: #A.
	graph asMorph.
	graph asXml.
	
	self should: [tempDir entries isEmpty].