testing
testAsSequenceString

	self assert: '    ACTG ' asCondensedString = 'ACTG'.
	self assert: String empty asCondensedString = String empty.
	self assert: 'AC TG' asCondensedString = 'ACTG'.
	self assert: ' A C T G ' asCondensedString = 'ACTG'.
	
	
	self assert: 'ACTG
' asCondensedString = 'ACTG'.
	self assert: '

ACTG

' asCondensedString = 'ACTG'
	