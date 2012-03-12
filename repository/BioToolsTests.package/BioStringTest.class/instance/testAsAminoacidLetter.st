testing
testAsAminoacidLetter

	self assert: 'A' asAminoacidLetter = $A.

	self should: [ 'AG' asAminoacidLetter ] 			raise: BioException.
	self should: [ String empty asAminoacidLetter ] 	raise: BioException	